from io import BytesIO
from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from starlette.responses import JSONResponse
import pandas as pd
import numpy as np

app = FastAPI()

# CORS ayarları
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/merge_files/")
async def merge_files(file1: UploadFile = File(...), file2: UploadFile = File(...)):
    try:
        # Dosyaları oku
        excel_data1 = pd.read_excel(BytesIO(await file1.read()), dtype=str)
        excel_data2 = pd.read_excel(BytesIO(await file2.read()), dtype=str)

        # Tarih sütunlarını dönüştür
        for df in [excel_data1, excel_data2]:
            for col in df.columns:
                if "tarih" in col.lower():  # Tarih sütunlarını bul
                    df[col] = pd.to_datetime(df[col], errors='coerce')

        # Verileri birleştir ve aynı satırları kaldır
        merged_data = pd.concat([excel_data1, excel_data2]).drop_duplicates()

        # İlk 20 satırı JSON formatında döndür
        merged_records = merged_data.head(20).to_json(orient="records")
        return JSONResponse(content={"merged_data": merged_records})

    except Exception as e:
        error_message = str(e)
        print(f"Bir hata oluştu: {error_message}")
        return JSONResponse(content={"error": error_message}, status_code=500)


# Hugging Face pipeline ve sütun karşılaştırma fonksiyonu
def compare_columns(columns1, columns2):
    vectors1 = get_column_vectors(columns1)
    vectors2 = get_column_vectors(columns2)

    similarities = sklearn_cosine_similarity(vectors1, vectors2)

    matches = []
    for i, sim_row in enumerate(similarities):
        for j, score in enumerate(sim_row):
            if not math.isnan(score) and score > 0.8:
                matches.append((columns1[i], columns2[j], score))

    return matches

def get_column_vectors(columns):
    vectors = []
    for column in columns:
        output = nlp_model(column)
        vector = [sum(x) / len(output[0]) for x in zip(*output[0])]
        vectors.append(vector)
    return vectors

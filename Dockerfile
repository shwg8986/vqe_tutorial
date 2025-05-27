# ベースとなるPythonイメージを指定
FROM python:3.10-slim

# 作業ディレクトリを設定
WORKDIR /app

# 必要なPythonライブラリをインストール (Jupyter Lab、Pandas、NumPyなど)
# 必要に応じて他のライブラリも追加する。
RUN pip install --no-cache-dir \
    jupyterlab \
    pandas \
    numpy \
    matplotlib \
    japanize_matplotlib \
    seaborn \
    scikit-learn \
    qiskit~=1.0.2 \
    qiskit_algorithms \
    pylatexenc
# Jupyter Notebookのポートを公開
EXPOSE 8888

# コンテナ起動時にJupyter Labを起動
# トークンなし、任意のIPアドレスからの接続を許可 (開発環境向け)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
# Dockerを使ってローカル環境を汚さず、PythonのJupyter Notebook環境でVQEのtutorialを実行する手順。

---

## 構築ステップ概要

1. Dockerイメージのビルド
2. Dockerコンテナの起動
3. VSCodeからの接続

---

### 推奨VSCode拡張機能

- Dev Containers (`ms-vscode-remote.remote-containers`)
- Python (`ms-python.python`)
- Jupyter (`ms-toolsai.jupyter`)

---

## 1. Dockerイメージのビルド 

```bash
docker build -t python-notebook .
```

- `python-notebook`: 任意のイメージ名。

---

## 2. Dockerコンテナの起動

```bash
docker run -p 8888:8888 -v "$(pwd):/app" --name my-notebook-container python-notebook
```

- `-p 8888:8888`: ポートフォワーディング。
- `-v "$(pwd):/app"`: ローカルフォルダをコンテナにマウント。
- `--name`: コンテナに名前をつける。

### バックグラウンド実行（Detachedモード）

```bash
docker run -d -p 8888:8888 -v "$(pwd):/app" --name my-notebook-container python-notebook
```

---

## 3. VSCodeでの接続

1. VSCodeでプロジェクトフォルダを開く。
2. コマンドパレットで「**Dev Containers: Attach to Running Container**」を選択。  
　または、**左下の「><」アイコン（両矢印のようなマーク）**をクリックし、`Attach to Running Container` を選択。
3. コンテナに接続後、**再度コマンドパレットを開き**、「**Files: Open Folder**」を選択し、`/app` ディレクトリに移動。  
   - ※ デフォルトでは `/` ルートディレクトリが開いているため、**手動で `/app` に移動する必要があります**。
4. `/app` フォルダが開けたら、`.ipynb` ファイルを開いてノートブックを実行できます。
---

## コンテナ操作コマンドまとめ (例)

```bash
# コンテナのビルド
docker build -t vqe-notebook .

# 初回起動（フォアグラウンド実行）
docker run -p 8888:8888 -v "$(pwd):/app" --name quantum-container vqe-notebook

# 既存コンテナの再起動
docker start quantum-container

# ログを確認
docker logs quantum-container
```

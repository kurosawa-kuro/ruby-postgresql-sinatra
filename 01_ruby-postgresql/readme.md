# Ubuntu上でのPostgreSQLのセットアップとRubyスクリプトの実行ガイド

この文書は、Ubuntu環境でPostgreSQLデータベースを設定し、Rubyスクリプトを使用してデータベース操作を行うためのステップバイステップガイドです。

## 前提条件
- Ubuntuがインストールされた環境
- Rubyの基本的な知識とインストール済みのRuby環境
- PostgreSQLデータベースの基本的な知識

## 目次
1. DBeaverを使用したデータベーステーブルの作成
2. Gemライブラリのインストール
3. dotenv

## 1. DBeaverを使用したデータベーステーブルの作成
DBeaverは強力なデータベース管理ツールで、テーブルの作成やデータの挿入などの操作を簡単に行えます。以下のSQLステートメントをDBeaverで実行し、`todo` テーブルを作成し、初期データを挿入してください。

```sql
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

INSERT INTO todos (title) VALUES ('買い物に行く');
INSERT INTO todos (title) VALUES ('犬の散歩');
INSERT INTO todos (title) VALUES ('プログラミングの勉強');
```

## 2. Gemライブラリのインストール

```bash
bundle install
```

## 3. dotenv
`.env-sample` を `.env` にコピーし、適切な値を設定してください。

## 4. Rubyスクリプトの実行
以下のRubyスクリプトは、PostgreSQLデータベースに接続し、`todo` テーブルからデータを取得して出力します。このスクリプトを `main.rb` として保存し、次のコマンドで実行します。

```bash
ruby main.rb
```

**出力例:**

```
ID: 1, タイトル: 買い物に行く
ID: 2, タイトル: 犬の散歩
ID: 3, タイトル: プログラミングの勉強
```

このガイドに従うことで、Ubuntu上でPostgreSQLデータベースを設定し、Rubyスクリプトを使用してデータベース操作を行うことができます。
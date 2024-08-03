# Discord Music Bot

這個專案包含一個 Dockerfile，用於下載並執行 JMusicBot。

此專案將 JMusicBot 以及其設定檔（config.txt）打包到 Docker Image 中，並允許使用環境變數來動態組態設定檔中的部分內容。

## 文件結構

```
.
├── config.template.txt
├── Dockerfile
└── generate_config.sh
```

### config.template.txt

這個文件是 JMusicBot 的設定模板，其中包含需要替換的佔位符 YOUR_BOT_TOKEN 和 YOUR_OWNER_ID。

### generate_config.sh

這個腳本將 `config.template.txt` 文件中的佔位符替換為環境變數中的值，並產生最終的 `config.txt` 文件。

## 構建和執行

### 構建 Docker Image

首先，確保你有 Docker 已經安裝並正在執行。然後使用以下指令來構建 Docker Image：

```sh
docker build --build-arg GH_TOKEN=your_github_token -t jmusicbot .
your_github_token 是你用來下載 JMusicBot.jar 的 GitHub Token。
```

### 執行 Docker Container

使用以下指令執行 Docker Container，並提供所需的環境變數：

```sh
docker run -e DC_TOKEN=your_discord_token -e DC_OWNER_ID=your_owner_id jmusicbot
```

`your_discord_token` 是你的 Discord Bot Token。

`your_owner_id` 是你的 Discord User ID。

## 重要說明

請確保你的 `GitHub Token` (GH_TOKEN) 具有下載 JMusicBot.jar 的權限。

確保你的 `Discord Bot Token` (DC_TOKEN) 和 `Discord User ID` (DC_OWNER_ID) 是正確的，否則 JMusicBot 將無法正常執行。
許可

這個專案遵循 MIT 許可證。詳細信息請參閱 LICENSE 文件。

---

# Discord Music Bot

This project includes a Dockerfile for downloading and running JMusicBot.

This project packages JMusicBot and its configuration file (config.txt) into a Docker Image, allowing dynamic configuration of parts of the configuration file using environment variables.

## File Structure

```
.
├── config.template.txt
├── Dockerfile
└── generate_config.sh
```

### config.template.txt

This file is the configuration template for JMusicBot, containing placeholders for YOUR_BOT_TOKEN and YOUR_OWNER_ID that need to be replaced.

### generate_config.sh

This script replaces the placeholders in the `config.template.txt` file with values from environment variables and generates the final `config.txt` file.

## Build and Run

### Build the Docker Image

First, ensure you have Docker installed and running. Then use the following command to build the Docker Image:

```sh
docker build --build-arg GH_TOKEN=your_github_token -t jmusicbot .
```

`your_github_token` is the GitHub Token you use to download JMusicBot.jar.

### Run the Docker Container

Use the following command to run the Docker Container, providing the necessary environment variables:

```sh
docker run -e DC_TOKEN=your_discord_token -e DC_OWNER_ID=your_owner_id jmusicbot
```

`your_discord_token` is your Discord Bot Token.

`your_owner_id` is your Discord User ID.

## Important Notes

Ensure that your GitHub Token (GH_TOKEN) has permission to download JMusicBot.jar.

Make sure your Discord Bot Token (DC_TOKEN) and Discord User ID (DC_OWNER_ID) are correct; otherwise, JMusicBot will not function properly.

## License

This project is licensed under the MIT License. For more details, please refer to the LICENSE file.

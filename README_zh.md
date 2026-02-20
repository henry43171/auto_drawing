# 繪圖自動化工具

本儲存庫包含輕量級的自動化工具，旨在管理日常繪圖任務，示範軟體是 Clip Studio Paint。
其目標是減少重複性的步驟，並協助維持固定的繪圖習慣。

## 檔案說明

- `auto_csp_a4_h.bat`
  - **複製一個設定好的 .clip 模板，避免每次練習都需要調整畫布設定**。
  - 這邊的模板檔案是 A4 大小+橫向，可依照自身需求調整模板檔案。
  - 設定檔讀取自 `config/auto_csp_a4_h.txt` (從 `config_example/` 中的範例複製)。

- `auto_urls.bat`
  - **開啟一組或多組預先定義好的參考網站**。
  - 設定檔讀取自 `config/urls.txt` (從 `config_example/` 中的範例複製)。

- `auto_csp_with_folder.bat`
  - **複製一個設定好的 .clip 模板並開啟，同時開啟素材資料夾**。
  - 設定檔讀取自 `config/config_csp_with_folder.txt` (從 `config_example/` 中的範例複製)。

- `auto_csp_project.bat`
  - **開啟一個固定的 .clip 檔，趕稿用**。
  - 設定檔讀取自 `config/auto_csp_project.txt` (從 `config_example/` 中的範例複製)。

## 設定檔說明
- `config_example/`
  - 包含作為模板的範例設定檔 (`urls.txt`、`config_csp_with_folder.txt`等等)。
  - 請將它們複製到 `config/` 資料夾中，並根據你的環境進行調整。

## 使用方式

1.  將 `config_example/` 中的範例設定檔複製到一個名為 `config/` 的新資料夾中。
2.  依據需求編輯 `config/` 資料夾中的設定檔。
3.  執行所需的批次檔 (`auto_urls.bat` 或 `auto_csp_with_folder.bat`) 來進行自動化操作。
4.  新建立的 CSP 檔案會以日期命名，以避免覆蓋舊檔案。
5.  **可以搭配 Windows 的工作排程器，設定時間，自動化開啟腳本。**

## 注意事項

- 請確保所有路徑都是有效的。在檔案路徑中使用非英文字元可能會導致批次檔執行時出錯。
- 這些工具為輕量級設計，適合個人日常使用。
- 批次檔包含簡單的防護措施，以避免意外覆蓋檔案。

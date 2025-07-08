# auto-update.ps1

# Đường dẫn tới ảnh gốc và ảnh đích trong repo
$source = "D:\Zalo OA trong này\Hinhreport\first_page.png"
$dest   = "D:\repos\my-latest-image\screenshots\latest.png"

# Nếu ảnh gốc tồn tại
if (Test-Path $source) {
    # Ghi đè ảnh vào repo
    Copy-Item $source $dest -Force

    # Chuyển thư mục làm việc về repo
    Set-Location "D:\repos\my-latest-image"

    # Add, commit & push
    & git add "screenshots/latest.png"
    & git commit -m "Auto-update latest.png on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    & git push origin main
}

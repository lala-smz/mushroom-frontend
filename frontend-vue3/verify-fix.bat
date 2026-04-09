@echo off
chcp 65001 >nul
echo.
echo ==========================================
echo    蘑菇管理删除和状态过滤 - 快速验证脚本
echo ==========================================
echo.

echo [1/4] 检查后端服务状态...
curl -s http://localhost:3003/health >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ 后端服务运行正常
) else (
    echo ✗ 后端服务未运行
    echo.
    echo 请先启动后端服务：
    echo   cd backend-node
    echo   npm run dev
    echo.
    pause
    exit /b 1
)

echo.
echo [2/4] 检查前端服务状态...
curl -s http://localhost:5173 >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ 前端服务运行正常
) else (
    echo ✗ 前端服务未运行
    echo.
    echo 请先启动前端服务：
    echo   cd frontend-vue3
    echo   npm run dev
    echo.
    pause
    exit /b 1
)

echo.
echo [3/4] 测试蘑菇API...
curl -s http://localhost:3003/api/mushrooms | findstr "success" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ 蘑菇API正常
) else (
    echo ✗ 蘑菇API异常
    pause
    exit /b 1
)

echo.
echo [4/4] 打开测试页面...
echo.
echo 请在浏览器中按以下步骤测试：
echo.
echo 1. 删除功能测试：
echo    - 访问: http://localhost:5173/admin/mushrooms
echo    - 登录管理员账号
echo    - 点击任意蘑菇的"删除"按钮
echo    - 验证删除后蘑菇立即消失
echo.
echo 2. 注册页面过滤测试：
echo    - 访问: http://localhost:5173/register
echo    - 选择"卖家"身份
echo    - 验证下拉框中只显示激活的蘑菇
echo.
echo 3. 卖家申请过滤测试：
echo    - 使用卖家账号登录
echo    - 访问"我的售卖种类管理"
echo    - 点击"申请添加新种类"
echo    - 验证只显示激活的蘑菇
echo.
echo ==========================================
echo 按任意键打开测试页面...
echo ==========================================
pause >nul

start http://localhost:5173/admin/mushrooms
start http://localhost:5173/register

echo.
echo ✓ 已打开测试页面
echo.
echo 详细说明请查看: TEST_DELETE_AND_STATUS_FILTER.md
echo.
pause

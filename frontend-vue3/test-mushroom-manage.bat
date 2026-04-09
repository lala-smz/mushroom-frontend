@echo off
chcp 65001 >nul
echo ========================================
echo   蘑菇管理功能测试环境启动脚本
echo ========================================
echo.

REM 检查Node.js是否安装
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未检测到Node.js，请先安装Node.js
    pause
    exit /b 1
)

echo [1/4] 检查后端服务...
echo.

REM 检查3003端口是否被占用
netstat -ano | findstr :3003 >nul
if %errorlevel% equ 0 (
    echo [提示] 后端服务已在运行（端口3003）
) else (
    echo [启动] 正在启动后端服务...
    start "菌类网后端服务" cmd /k "cd backend-node && npm run dev"
    echo [等待] 等待后端服务启动（10秒）...
    timeout /t 10 /nobreak >nul
)

echo.
echo [2/4] 检查前端服务...
echo.

REM 检查5173端口是否被占用
netstat -ano | findstr :5173 >nul
if %errorlevel% equ 0 (
    echo [提示] 前端服务已在运行（端口5173）
) else (
    echo [启动] 正在启动前端服务...
    start "菌类网前端服务" cmd /k "cd frontend-vue3 && npm run dev"
    echo [等待] 等待前端服务启动（10秒）...
    timeout /t 10 /nobreak >nul
)

echo.
echo [3/4] 打开浏览器...
echo.

REM 尝试打开默认浏览器
start http://localhost:5173/admin/mushrooms

echo.
echo [4/4] 测试准备完成！
echo.
echo ========================================
echo   测试步骤：
echo ========================================
echo 1. 使用管理员账号登录系统
echo 2. 访问蘑菇管理页面
echo 3. 测试以下功能：
echo    - 查看蘑菇列表
echo    - 搜索蘑菇
echo    - 添加新蘑菇
echo    - 编辑现有蘑菇
echo    - 删除蘑菇
echo    - 分页功能
echo.
echo ========================================
echo   查看详细文档：
echo ========================================
echo - 测试指南: MUSHROOM_MANAGE_TEST_GUIDE.md
echo - 重构报告: MUSHROOM_MANAGE_REFACTOR_REPORT.md
echo.
echo ========================================
echo   日志查看位置：
echo ========================================
echo - 前端控制台: 浏览器开发者工具 (F12)
echo - 后端控制台: 后端服务窗口
echo.
pause

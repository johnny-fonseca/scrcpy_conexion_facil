@echo off
title SCRCPY - Conexion facil Premium 
color 0B
chcp 65001 >nul
setlocal EnableExtensions EnableDelayedExpansion
pushd "%~dp0" >nul 2>&1

REM =============================================
REM RUTAS Y ARCHIVOS (soporte para espacios)
REM =============================================
set "BASE_DIR=%~dp0"
set "BASE_DIR=%BASE_DIR:~0,-1%"
set "CONFIG_FILE=%BASE_DIR%\scrcpy_config.txt"
set "HISTORY_FILE=%BASE_DIR%\scrcpy_ip_history.txt"
set "LOG_FILE=%BASE_DIR%\scrcpy_error.log"
set "BACKUP_FILE=%BASE_DIR%\scrcpy_config.bak"
set "ADB=%BASE_DIR%\adb.exe"
set "SCRCPY=%BASE_DIR%\scrcpy.exe"

REM =============================================
REM VALORES POR DEFECTO
REM =============================================
set "MAX_SIZE=1024"
set "VIDEO_BITRATE=4M"
set "AUDIO_FLAG="
set "AUDIO_STATUS=Activado"
set "STAY_AWAKE_FLAG="
set "STAY_AWAKE_STATUS=Desactivado"
set "BRIGHTNESS="
set "SCREEN_OFF_FLAG="
set "SCREEN_OFF_STATUS=Desactivado"
set "ALWAYS_ON_TOP_FLAG="
set "ALWAYS_ON_TOP_STATUS=Desactivado"
set "ANGLE_VALUE=0"
set "ANGLE_FLAG="
set "AUDIO_BITRATE_VALUE=128K"
set "AUDIO_BITRATE_FLAG=--audio-bit-rate=128K"
set "AUDIO_BUFFER_VALUE=50"
set "AUDIO_BUFFER_FLAG=--audio-buffer=50"
set "AUDIO_CODEC_VALUE=opus"
set "AUDIO_CODEC_FLAG=--audio-codec=opus"
set "FULLSCREEN_FLAG="
set "FULLSCREEN_STATUS=Desactivado"
set "BORDERLESS_FLAG="
set "BORDERLESS_STATUS=Desactivado"
set "WINDOW_TITLE="
set "WINDOW_TITLE_FLAG="
set "WINDOW_X="
set "WINDOW_X_FLAG="
set "WINDOW_Y="
set "WINDOW_Y_FLAG="
set "WINDOW_WIDTH="
set "WINDOW_WIDTH_FLAG="
set "WINDOW_HEIGHT="
set "WINDOW_HEIGHT_FLAG="
set "MAX_FPS="
set "MAX_FPS_FLAG="
set "VIDEO_CODEC_VALUE=h264"
set "VIDEO_CODEC_FLAG=--video-codec=h264"
set "VIDEO_BUFFER="
set "VIDEO_BUFFER_FLAG="
set "SHOW_TOUCHES_FLAG="
set "SHOW_TOUCHES_STATUS=Desactivado"
set "NO_CONTROL_FLAG="
set "NO_CONTROL_STATUS=Desactivado"
set "POWER_OFF_ON_CLOSE_FLAG="
set "POWER_OFF_ON_CLOSE_STATUS=Desactivado"
set "TIME_LIMIT="
set "TIME_LIMIT_FLAG="
set "PUSH_TARGET=/sdcard/Download/"
set "PUSH_TARGET_FLAG=--push-target=/sdcard/Download/"

REM Variables de la primera ampliación
set "CROP="
set "CROP_FLAG="
set "KEYBOARD_MODE=sdk"
set "KEYBOARD_FLAG=--keyboard=sdk"
set "MOUSE_MODE=sdk"
set "MOUSE_FLAG=--mouse=sdk"
set "OTG_FLAG="
set "OTG_STATUS=Desactivado"
set "SHORTCUT_MOD=lalt,lsuper"
set "SHORTCUT_MOD_FLAG=--shortcut-mod=lalt,lsuper"
set "RECORD_FILE="
set "RECORD_FLAG="
set "NO_PLAYBACK_FLAG="
set "NO_PLAYBACK_STATUS=Desactivado"
set "AUDIO_SOURCE=output"
set "AUDIO_SOURCE_FLAG=--audio-source=output"
set "NO_WINDOW_FLAG="
set "NO_WINDOW_STATUS=Desactivado"

REM Nuevas variables (segunda ampliación)
set "VIDEO_SOURCE=display"
set "VIDEO_SOURCE_FLAG="
set "CAMERA_ID="
set "CAMERA_ID_FLAG="
set "CAMERA_FACING="
set "CAMERA_FACING_FLAG="
set "CAMERA_SIZE="
set "CAMERA_SIZE_FLAG="
set "CAMERA_AR="
set "CAMERA_AR_FLAG="
set "CAMERA_FPS="
set "CAMERA_FPS_FLAG="
set "CAMERA_HIGH_SPEED_FLAG="
set "CAMERA_HIGH_SPEED_STATUS=Desactivado"
set "DISPLAY_ID="
set "DISPLAY_ID_FLAG="
set "NEW_DISPLAY="
set "NEW_DISPLAY_FLAG="
set "NO_VD_DESTROY_CONTENT_FLAG="
set "NO_VD_DESTROY_CONTENT_STATUS=Desactivado"
set "NO_VD_SYSTEM_DECORATIONS_FLAG="
set "NO_VD_SYSTEM_DECORATIONS_STATUS=Desactivado"
set "GAMEPAD_MODE=disabled"
set "GAMEPAD_FLAG=--gamepad=disabled"
set "MOUSE_BIND="
set "MOUSE_BIND_FLAG="
set "NO_KEY_REPEAT_FLAG="
set "NO_KEY_REPEAT_STATUS=Desactivado"
set "NO_MOUSE_HOVER_FLAG="
set "NO_MOUSE_HOVER_STATUS=Desactivado"
set "PREFER_TEXT_FLAG="
set "PREFER_TEXT_STATUS=Desactivado"
set "RAW_KEY_EVENTS_FLAG="
set "RAW_KEY_EVENTS_STATUS=Desactivado"
set "NO_CLIPBOARD_AUTOSYNC_FLAG="
set "NO_CLIPBOARD_AUTOSYNC_STATUS=Desactivado"
set "LEGACY_PASTE_FLAG="
set "LEGACY_PASTE_STATUS=Desactivado"
set "RECORD_FORMAT="
set "RECORD_FORMAT_FLAG="
set "RECORD_ORIENTATION="
set "RECORD_ORIENTATION_FLAG="
set "KILL_ADB_ON_CLOSE_FLAG="
set "KILL_ADB_ON_CLOSE_STATUS=Desactivado"
set "NO_CLEANUP_FLAG="
set "NO_CLEANUP_STATUS=Desactivado"
set "NO_POWER_ON_FLAG="
set "NO_POWER_ON_STATUS=Desactivado"
set "PAUSE_ON_EXIT=false"
set "PAUSE_ON_EXIT_FLAG="
set "SCREEN_OFF_TIMEOUT="
set "SCREEN_OFF_TIMEOUT_FLAG="
set "DISABLE_SCREENSAVER_FLAG="
set "DISABLE_SCREENSAVER_STATUS=Desactivado"
set "FORCE_ADB_FORWARD_FLAG="
set "FORCE_ADB_FORWARD_STATUS=Desactivado"
set "TUNNEL_HOST="
set "TUNNEL_HOST_FLAG="
set "TUNNEL_PORT="
set "TUNNEL_PORT_FLAG="
set "PORT="
set "PORT_FLAG="
set "AUDIO_DUP_FLAG="
set "AUDIO_DUP_STATUS=Desactivado"
set "AUDIO_ENCODER="
set "AUDIO_ENCODER_FLAG="
set "AUDIO_CODEC_OPTIONS="
set "AUDIO_CODEC_OPTIONS_FLAG="
set "AUDIO_OUTPUT_BUFFER="
set "AUDIO_OUTPUT_BUFFER_FLAG="
set "REQUIRE_AUDIO_FLAG="
set "REQUIRE_AUDIO_STATUS=Desactivado"
set "CAPTURE_ORIENTATION="
set "CAPTURE_ORIENTATION_FLAG="
set "DISPLAY_ORIENTATION="
set "DISPLAY_ORIENTATION_FLAG="
set "VIDEO_ENCODER="
set "VIDEO_ENCODER_FLAG="
set "VIDEO_CODEC_OPTIONS="
set "VIDEO_CODEC_OPTIONS_FLAG="
set "NO_DOWNSIZE_ON_ERROR_FLAG="
set "NO_DOWNSIZE_ON_ERROR_STATUS=Desactivado"
set "NO_MIPMAPS_FLAG="
set "NO_MIPMAPS_STATUS=Desactivado"
set "RENDER_DRIVER="
set "RENDER_DRIVER_FLAG="
set "START_APP="
set "START_APP_FLAG="
set "PRINT_FPS_FLAG="
set "PRINT_FPS_STATUS=Desactivado"
set "VERBOSITY=info"
set "VERBOSITY_FLAG=--verbosity=info"

REM =============================================
REM NUEVAS VARIABLES 
REM =============================================
set "TCP_PORT=5555"
set "DEVICE_SERIAL="
set "DEVICE_SERIAL_FLAG="
set "PING_BEFORE_CONNECT=1"
set "PING_BEFORE_CONNECT_STATUS=Activado"
set "AUTO_DETECT_IP=0"
set "SCREENSHOT_DIR=%BASE_DIR%\capturas"
set "SCRCPY_VERSION=Desconocida"
set "ADB_VERSION=Desconocida"

REM =============================================
REM CARGAR CONFIGURACION GUARDADA
REM =============================================
if exist "%CONFIG_FILE%" (
    for /f "usebackq tokens=1* delims==" %%a in ("%CONFIG_FILE%") do (
        set "key=%%a"
        set "value=%%b"

        for /f "tokens=*" %%k in ("!key!") do set "key=%%k"

        if /i "!key!"=="MAX_SIZE"            set "MAX_SIZE=!value!"
        if /i "!key!"=="VIDEO_BITRATE"       set "VIDEO_BITRATE=!value!"
        if /i "!key!"=="AUDIO_FLAG"          set "AUDIO_FLAG=!value!"
        if /i "!key!"=="AUDIO_STATUS"        set "AUDIO_STATUS=!value!"
        if /i "!key!"=="STAY_AWAKE_FLAG"     set "STAY_AWAKE_FLAG=!value!"
        if /i "!key!"=="STAY_AWAKE_STATUS"   set "STAY_AWAKE_STATUS=!value!"
        if /i "!key!"=="BRIGHTNESS"          for /f "tokens=*" %%x in ("!value!") do set "BRIGHTNESS=%%x"
        if /i "!key!"=="SCREEN_OFF_FLAG"      set "SCREEN_OFF_FLAG=!value!"
        if /i "!key!"=="SCREEN_OFF_STATUS"    set "SCREEN_OFF_STATUS=!value!"
        if /i "!key!"=="ALWAYS_ON_TOP_FLAG"   set "ALWAYS_ON_TOP_FLAG=!value!"
        if /i "!key!"=="ALWAYS_ON_TOP_STATUS" set "ALWAYS_ON_TOP_STATUS=!value!"
        if /i "!key!"=="ANGLE_VALUE"          set "ANGLE_VALUE=!value!"
        if /i "!key!"=="ANGLE_FLAG"           set "ANGLE_FLAG=!value!"
        if /i "!key!"=="AUDIO_BITRATE_VALUE"  set "AUDIO_BITRATE_VALUE=!value!"
        if /i "!key!"=="AUDIO_BITRATE_FLAG"   set "AUDIO_BITRATE_FLAG=!value!"
        if /i "!key!"=="AUDIO_BUFFER_VALUE"   set "AUDIO_BUFFER_VALUE=!value!"
        if /i "!key!"=="AUDIO_BUFFER_FLAG"    set "AUDIO_BUFFER_FLAG=!value!"
        if /i "!key!"=="AUDIO_CODEC_VALUE"    set "AUDIO_CODEC_VALUE=!value!"
        if /i "!key!"=="AUDIO_CODEC_FLAG"     set "AUDIO_CODEC_FLAG=!value!"
        if /i "!key!"=="FULLSCREEN_FLAG"      set "FULLSCREEN_FLAG=!value!"
        if /i "!key!"=="FULLSCREEN_STATUS"    set "FULLSCREEN_STATUS=!value!"
        if /i "!key!"=="BORDERLESS_FLAG"      set "BORDERLESS_FLAG=!value!"
        if /i "!key!"=="BORDERLESS_STATUS"    set "BORDERLESS_STATUS=!value!"
        if /i "!key!"=="WINDOW_TITLE"         set "WINDOW_TITLE=!value!"
        if /i "!key!"=="WINDOW_TITLE_FLAG"    set "WINDOW_TITLE_FLAG=!value!"
        if /i "!key!"=="WINDOW_X"             set "WINDOW_X=!value!"
        if /i "!key!"=="WINDOW_X_FLAG"        set "WINDOW_X_FLAG=!value!"
        if /i "!key!"=="WINDOW_Y"             set "WINDOW_Y=!value!"
        if /i "!key!"=="WINDOW_Y_FLAG"        set "WINDOW_Y_FLAG=!value!"
        if /i "!key!"=="WINDOW_WIDTH"         set "WINDOW_WIDTH=!value!"
        if /i "!key!"=="WINDOW_WIDTH_FLAG"    set "WINDOW_WIDTH_FLAG=!value!"
        if /i "!key!"=="WINDOW_HEIGHT"        set "WINDOW_HEIGHT=!value!"
        if /i "!key!"=="WINDOW_HEIGHT_FLAG"   set "WINDOW_HEIGHT_FLAG=!value!"
        if /i "!key!"=="MAX_FPS"              set "MAX_FPS=!value!"
        if /i "!key!"=="MAX_FPS_FLAG"         set "MAX_FPS_FLAG=!value!"
        if /i "!key!"=="VIDEO_CODEC_VALUE"    set "VIDEO_CODEC_VALUE=!value!"
        if /i "!key!"=="VIDEO_CODEC_FLAG"     set "VIDEO_CODEC_FLAG=!value!"
        if /i "!key!"=="VIDEO_BUFFER"         set "VIDEO_BUFFER=!value!"
        if /i "!key!"=="VIDEO_BUFFER_FLAG"    set "VIDEO_BUFFER_FLAG=!value!"
        if /i "!key!"=="SHOW_TOUCHES_FLAG"    set "SHOW_TOUCHES_FLAG=!value!"
        if /i "!key!"=="SHOW_TOUCHES_STATUS"  set "SHOW_TOUCHES_STATUS=!value!"
        if /i "!key!"=="NO_CONTROL_FLAG"      set "NO_CONTROL_FLAG=!value!"
        if /i "!key!"=="NO_CONTROL_STATUS"    set "NO_CONTROL_STATUS=!value!"
        if /i "!key!"=="POWER_OFF_ON_CLOSE_FLAG"   set "POWER_OFF_ON_CLOSE_FLAG=!value!"
        if /i "!key!"=="POWER_OFF_ON_CLOSE_STATUS" set "POWER_OFF_ON_CLOSE_STATUS=!value!"
        if /i "!key!"=="TIME_LIMIT"           set "TIME_LIMIT=!value!"
        if /i "!key!"=="TIME_LIMIT_FLAG"      set "TIME_LIMIT_FLAG=!value!"
        if /i "!key!"=="PUSH_TARGET"          set "PUSH_TARGET=!value!"
        if /i "!key!"=="PUSH_TARGET_FLAG"     set "PUSH_TARGET_FLAG=!value!"
        if /i "!key!"=="CROP"                 set "CROP=!value!"
        if /i "!key!"=="CROP_FLAG"            set "CROP_FLAG=!value!"
        if /i "!key!"=="KEYBOARD_MODE"        set "KEYBOARD_MODE=!value!"
        if /i "!key!"=="KEYBOARD_FLAG"        set "KEYBOARD_FLAG=!value!"
        if /i "!key!"=="MOUSE_MODE"           set "MOUSE_MODE=!value!"
        if /i "!key!"=="MOUSE_FLAG"           set "MOUSE_FLAG=!value!"
        if /i "!key!"=="OTG_FLAG"             set "OTG_FLAG=!value!"
        if /i "!key!"=="OTG_STATUS"           set "OTG_STATUS=!value!"
        if /i "!key!"=="SHORTCUT_MOD"         set "SHORTCUT_MOD=!value!"
        if /i "!key!"=="SHORTCUT_MOD_FLAG"    set "SHORTCUT_MOD_FLAG=!value!"
        if /i "!key!"=="RECORD_FILE"          set "RECORD_FILE=!value!"
        if /i "!key!"=="RECORD_FLAG"          set "RECORD_FLAG=!value!"
        if /i "!key!"=="NO_PLAYBACK_FLAG"     set "NO_PLAYBACK_FLAG=!value!"
        if /i "!key!"=="NO_PLAYBACK_STATUS"   set "NO_PLAYBACK_STATUS=!value!"
        if /i "!key!"=="AUDIO_SOURCE"         set "AUDIO_SOURCE=!value!"
        if /i "!key!"=="AUDIO_SOURCE_FLAG"    set "AUDIO_SOURCE_FLAG=!value!"
        if /i "!key!"=="NO_WINDOW_FLAG"       set "NO_WINDOW_FLAG=!value!"
        if /i "!key!"=="NO_WINDOW_STATUS"     set "NO_WINDOW_STATUS=!value!"

        REM Nuevas variables segunda ampliación
        if /i "!key!"=="VIDEO_SOURCE"         set "VIDEO_SOURCE=!value!"
        if /i "!key!"=="VIDEO_SOURCE_FLAG"    set "VIDEO_SOURCE_FLAG=!value!"
        if /i "!key!"=="CAMERA_ID"            set "CAMERA_ID=!value!"
        if /i "!key!"=="CAMERA_ID_FLAG"       set "CAMERA_ID_FLAG=!value!"
        if /i "!key!"=="CAMERA_FACING"        set "CAMERA_FACING=!value!"
        if /i "!key!"=="CAMERA_FACING_FLAG"   set "CAMERA_FACING_FLAG=!value!"
        if /i "!key!"=="CAMERA_SIZE"          set "CAMERA_SIZE=!value!"
        if /i "!key!"=="CAMERA_SIZE_FLAG"     set "CAMERA_SIZE_FLAG=!value!"
        if /i "!key!"=="CAMERA_AR"            set "CAMERA_AR=!value!"
        if /i "!key!"=="CAMERA_AR_FLAG"       set "CAMERA_AR_FLAG=!value!"
        if /i "!key!"=="CAMERA_FPS"           set "CAMERA_FPS=!value!"
        if /i "!key!"=="CAMERA_FPS_FLAG"      set "CAMERA_FPS_FLAG=!value!"
        if /i "!key!"=="CAMERA_HIGH_SPEED_FLAG"       set "CAMERA_HIGH_SPEED_FLAG=!value!"
        if /i "!key!"=="CAMERA_HIGH_SPEED_STATUS"     set "CAMERA_HIGH_SPEED_STATUS=!value!"
        if /i "!key!"=="DISPLAY_ID"           set "DISPLAY_ID=!value!"
        if /i "!key!"=="DISPLAY_ID_FLAG"      set "DISPLAY_ID_FLAG=!value!"
        if /i "!key!"=="NEW_DISPLAY"          set "NEW_DISPLAY=!value!"
        if /i "!key!"=="NEW_DISPLAY_FLAG"     set "NEW_DISPLAY_FLAG=!value!"
        if /i "!key!"=="NO_VD_DESTROY_CONTENT_FLAG"   set "NO_VD_DESTROY_CONTENT_FLAG=!value!"
        if /i "!key!"=="NO_VD_DESTROY_CONTENT_STATUS" set "NO_VD_DESTROY_CONTENT_STATUS=!value!"
        if /i "!key!"=="NO_VD_SYSTEM_DECORATIONS_FLAG"   set "NO_VD_SYSTEM_DECORATIONS_FLAG=!value!"
        if /i "!key!"=="NO_VD_SYSTEM_DECORATIONS_STATUS" set "NO_VD_SYSTEM_DECORATIONS_STATUS=!value!"
        if /i "!key!"=="GAMEPAD_MODE"         set "GAMEPAD_MODE=!value!"
        if /i "!key!"=="GAMEPAD_FLAG"         set "GAMEPAD_FLAG=!value!"
        if /i "!key!"=="MOUSE_BIND"           set "MOUSE_BIND=!value!"
        if /i "!key!"=="MOUSE_BIND_FLAG"      set "MOUSE_BIND_FLAG=!value!"
        if /i "!key!"=="NO_KEY_REPEAT_FLAG"   set "NO_KEY_REPEAT_FLAG=!value!"
        if /i "!key!"=="NO_KEY_REPEAT_STATUS" set "NO_KEY_REPEAT_STATUS=!value!"
        if /i "!key!"=="NO_MOUSE_HOVER_FLAG"  set "NO_MOUSE_HOVER_FLAG=!value!"
        if /i "!key!"=="NO_MOUSE_HOVER_STATUS" set "NO_MOUSE_HOVER_STATUS=!value!"
        if /i "!key!"=="PREFER_TEXT_FLAG"     set "PREFER_TEXT_FLAG=!value!"
        if /i "!key!"=="PREFER_TEXT_STATUS"   set "PREFER_TEXT_STATUS=!value!"
        if /i "!key!"=="RAW_KEY_EVENTS_FLAG"  set "RAW_KEY_EVENTS_FLAG=!value!"
        if /i "!key!"=="RAW_KEY_EVENTS_STATUS" set "RAW_KEY_EVENTS_STATUS=!value!"
        if /i "!key!"=="NO_CLIPBOARD_AUTOSYNC_FLAG"   set "NO_CLIPBOARD_AUTOSYNC_FLAG=!value!"
        if /i "!key!"=="NO_CLIPBOARD_AUTOSYNC_STATUS" set "NO_CLIPBOARD_AUTOSYNC_STATUS=!value!"
        if /i "!key!"=="LEGACY_PASTE_FLAG"    set "LEGACY_PASTE_FLAG=!value!"
        if /i "!key!"=="LEGACY_PASTE_STATUS"  set "LEGACY_PASTE_STATUS=!value!"
        if /i "!key!"=="RECORD_FORMAT"        set "RECORD_FORMAT=!value!"
        if /i "!key!"=="RECORD_FORMAT_FLAG"   set "RECORD_FORMAT_FLAG=!value!"
        if /i "!key!"=="RECORD_ORIENTATION"   set "RECORD_ORIENTATION=!value!"
        if /i "!key!"=="RECORD_ORIENTATION_FLAG" set "RECORD_ORIENTATION_FLAG=!value!"
        if /i "!key!"=="KILL_ADB_ON_CLOSE_FLAG"    set "KILL_ADB_ON_CLOSE_FLAG=!value!"
        if /i "!key!"=="KILL_ADB_ON_CLOSE_STATUS"  set "KILL_ADB_ON_CLOSE_STATUS=!value!"
        if /i "!key!"=="NO_CLEANUP_FLAG"      set "NO_CLEANUP_FLAG=!value!"
        if /i "!key!"=="NO_CLEANUP_STATUS"    set "NO_CLEANUP_STATUS=!value!"
        if /i "!key!"=="NO_POWER_ON_FLAG"     set "NO_POWER_ON_FLAG=!value!"
        if /i "!key!"=="NO_POWER_ON_STATUS"   set "NO_POWER_ON_STATUS=!value!"
        if /i "!key!"=="PAUSE_ON_EXIT"        set "PAUSE_ON_EXIT=!value!"
        if /i "!key!"=="PAUSE_ON_EXIT_FLAG"   set "PAUSE_ON_EXIT_FLAG=!value!"
        if /i "!key!"=="SCREEN_OFF_TIMEOUT"   set "SCREEN_OFF_TIMEOUT=!value!"
        if /i "!key!"=="SCREEN_OFF_TIMEOUT_FLAG" set "SCREEN_OFF_TIMEOUT_FLAG=!value!"
        if /i "!key!"=="DISABLE_SCREENSAVER_FLAG" set "DISABLE_SCREENSAVER_FLAG=!value!"
        if /i "!key!"=="DISABLE_SCREENSAVER_STATUS" set "DISABLE_SCREENSAVER_STATUS=!value!"
        if /i "!key!"=="FORCE_ADB_FORWARD_FLAG"    set "FORCE_ADB_FORWARD_FLAG=!value!"
        if /i "!key!"=="FORCE_ADB_FORWARD_STATUS"  set "FORCE_ADB_FORWARD_STATUS=!value!"
        if /i "!key!"=="TUNNEL_HOST"          set "TUNNEL_HOST=!value!"
        if /i "!key!"=="TUNNEL_HOST_FLAG"     set "TUNNEL_HOST_FLAG=!value!"
        if /i "!key!"=="TUNNEL_PORT"          set "TUNNEL_PORT=!value!"
        if /i "!key!"=="TUNNEL_PORT_FLAG"     set "TUNNEL_PORT_FLAG=!value!"
        if /i "!key!"=="PORT"                 set "PORT=!value!"
        if /i "!key!"=="PORT_FLAG"            set "PORT_FLAG=!value!"
        if /i "!key!"=="AUDIO_DUP_FLAG"       set "AUDIO_DUP_FLAG=!value!"
        if /i "!key!"=="AUDIO_DUP_STATUS"     set "AUDIO_DUP_STATUS=!value!"
        if /i "!key!"=="AUDIO_ENCODER"        set "AUDIO_ENCODER=!value!"
        if /i "!key!"=="AUDIO_ENCODER_FLAG"   set "AUDIO_ENCODER_FLAG=!value!"
        if /i "!key!"=="AUDIO_CODEC_OPTIONS"  set "AUDIO_CODEC_OPTIONS=!value!"
        if /i "!key!"=="AUDIO_CODEC_OPTIONS_FLAG" set "AUDIO_CODEC_OPTIONS_FLAG=!value!"
        if /i "!key!"=="AUDIO_OUTPUT_BUFFER"  set "AUDIO_OUTPUT_BUFFER=!value!"
        if /i "!key!"=="AUDIO_OUTPUT_BUFFER_FLAG" set "AUDIO_OUTPUT_BUFFER_FLAG=!value!"
        if /i "!key!"=="REQUIRE_AUDIO_FLAG"   set "REQUIRE_AUDIO_FLAG=!value!"
        if /i "!key!"=="REQUIRE_AUDIO_STATUS" set "REQUIRE_AUDIO_STATUS=!value!"
        if /i "!key!"=="CAPTURE_ORIENTATION"  set "CAPTURE_ORIENTATION=!value!"
        if /i "!key!"=="CAPTURE_ORIENTATION_FLAG" set "CAPTURE_ORIENTATION_FLAG=!value!"
        if /i "!key!"=="DISPLAY_ORIENTATION"  set "DISPLAY_ORIENTATION=!value!"
        if /i "!key!"=="DISPLAY_ORIENTATION_FLAG" set "DISPLAY_ORIENTATION_FLAG=!value!"
        if /i "!key!"=="VIDEO_ENCODER"        set "VIDEO_ENCODER=!value!"
        if /i "!key!"=="VIDEO_ENCODER_FLAG"   set "VIDEO_ENCODER_FLAG=!value!"
        if /i "!key!"=="VIDEO_CODEC_OPTIONS"  set "VIDEO_CODEC_OPTIONS=!value!"
        if /i "!key!"=="VIDEO_CODEC_OPTIONS_FLAG" set "VIDEO_CODEC_OPTIONS_FLAG=!value!"
        if /i "!key!"=="NO_DOWNSIZE_ON_ERROR_FLAG" set "NO_DOWNSIZE_ON_ERROR_FLAG=!value!"
        if /i "!key!"=="NO_DOWNSIZE_ON_ERROR_STATUS" set "NO_DOWNSIZE_ON_ERROR_STATUS=!value!"
        if /i "!key!"=="NO_MIPMAPS_FLAG"      set "NO_MIPMAPS_FLAG=!value!"
        if /i "!key!"=="NO_MIPMAPS_STATUS"    set "NO_MIPMAPS_STATUS=!value!"
        if /i "!key!"=="RENDER_DRIVER"        set "RENDER_DRIVER=!value!"
        if /i "!key!"=="RENDER_DRIVER_FLAG"   set "RENDER_DRIVER_FLAG=!value!"
        if /i "!key!"=="START_APP"            set "START_APP=!value!"
        if /i "!key!"=="START_APP_FLAG"       set "START_APP_FLAG=!value!"
        if /i "!key!"=="PRINT_FPS_FLAG"       set "PRINT_FPS_FLAG=!value!"
        if /i "!key!"=="PRINT_FPS_STATUS"     set "PRINT_FPS_STATUS=!value!"
        if /i "!key!"=="VERBOSITY"            set "VERBOSITY=!value!"
        if /i "!key!"=="VERBOSITY_FLAG"       set "VERBOSITY_FLAG=!value!"

        REM Variables 
        if /i "!key!"=="TCP_PORT"                   set "TCP_PORT=!value!"
        if /i "!key!"=="DEVICE_SERIAL"              set "DEVICE_SERIAL=!value!"
        if /i "!key!"=="DEVICE_SERIAL_FLAG"         set "DEVICE_SERIAL_FLAG=!value!"
        if /i "!key!"=="PING_BEFORE_CONNECT"        set "PING_BEFORE_CONNECT=!value!"
        if /i "!key!"=="PING_BEFORE_CONNECT_STATUS" set "PING_BEFORE_CONNECT_STATUS=!value!"
        if /i "!key!"=="SCREENSHOT_DIR"             set "SCREENSHOT_DIR=!value!"
    )
)

REM =============================================
REM CARGAR HISTORIAL DE IPs (ultimas 10)
REM =============================================
set "IP1="  & set "IP2="  & set "IP3="  & set "IP4="  & set "IP5="
set "IP6="  & set "IP7="  & set "IP8="  & set "IP9="  & set "IP10="

if exist "%HISTORY_FILE%" (
    set /a "cnt=0"
    for /f "usebackq delims=" %%i in ("%HISTORY_FILE%") do (
        if not "%%i"=="" (
            set /a "cnt+=1"
            if !cnt! equ 1  set "IP1=%%i"
            if !cnt! equ 2  set "IP2=%%i"
            if !cnt! equ 3  set "IP3=%%i"
            if !cnt! equ 4  set "IP4=%%i"
            if !cnt! equ 5  set "IP5=%%i"
            if !cnt! equ 6  set "IP6=%%i"
            if !cnt! equ 7  set "IP7=%%i"
            if !cnt! equ 8  set "IP8=%%i"
            if !cnt! equ 9  set "IP9=%%i"
            if !cnt! equ 10 set "IP10=%%i"
        )
    )
)

REM =============================================
REM VERIFICAR HERRAMIENTAS ESENCIALES
REM =============================================
if not exist "%ADB%" (
    color 0C
    call :show_error "No se encontro adb.exe en esta carpeta.\nDescargalo desde: https://developer.android.com/tools/releases/platform-tools"
    pause
    popd >nul 2>&1
    exit /b 1
)

if not exist "%SCRCPY%" (
    color 0C
    call :show_error "No se encontro scrcpy.exe en esta carpeta.\nDescargalo desde: https://github.com/Genymobile/scrcpy/releases"
    pause
    popd >nul 2>&1
    exit /b 1
)

REM =============================================
REM DETECTAR VERSIONES DE HERRAMIENTAS
REM =============================================
REM Detectar versión de scrcpy
for /f "tokens=2" %%v in ('"%SCRCPY%" --version 2^>^&1 ^| findstr /i /c:"scrcpy "') do (
    if "!SCRCPY_VERSION!"=="Desconocida" set "SCRCPY_VERSION=%%v"
)
REM Si aún es "Desconocida", intentar otro patrón
if "!SCRCPY_VERSION!"=="Desconocida" (
    for /f "tokens=2 delims= " %%v in ('"%SCRCPY%" --version 2^>^&1') do (
        if "!SCRCPY_VERSION!"=="Desconocida" set "SCRCPY_VERSION=%%v"
    )
)

REM Detectar versión de adb
for /f "tokens=5" %%v in ('"%ADB%" version 2^>^&1 ^| findstr /i "version"') do (
    if "!ADB_VERSION!"=="Desconocida" set "ADB_VERSION=%%v"
)
if "!ADB_VERSION!"=="Desconocida" (
    for /f "tokens=2 delims= " %%v in ('"%ADB%" version 2^>^&1') do (
        if "!ADB_VERSION!"=="Desconocida" set "ADB_VERSION=%%v"
    )
)

REM =============================================
REM BACKUP AUTOMATICO DE CONFIGURACION
REM =============================================
if exist "%CONFIG_FILE%" (
    copy /y "%CONFIG_FILE%" "%BACKUP_FILE%" >nul 2>&1
)

REM =============================================
REM CREAR DIRECTORIO DE CAPTURAS SI NO EXISTE
REM =============================================
if not exist "%SCREENSHOT_DIR%" mkdir "%SCREENSHOT_DIR%" >nul 2>&1

:menu
cls
color 0B
echo.
echo ================================================
echo       SCRCPY - Conexion facil Premium 
echo ================================================
echo.
echo   [1]  Ver dispositivos ADB
echo   [2]  Activar modo TCP/IP (USB requerido)
echo   [3]  Conectar por IP (WiFi)
echo   [4]  Iniciar scrcpy directamente
echo   [5]  Conexion completa automatica (RECOMENDADO)
echo   [6]  Configurar scrcpy
echo   [7]  Limpiar dispositivos offline
echo   [8]  Ver log de errores
echo   [9]  Borrar historial y configuracion
echo   [0]  Salir
echo.
echo ------------------------------------------------
echo            CONFIGURACION ACTUAL GUARDADA
echo ------------------------------------------------
echo   Resolucion maxima   : !MAX_SIZE! px
echo   Bitrate de video    : !VIDEO_BITRATE!
echo   Audio               : !AUDIO_STATUS!
if "!BRIGHTNESS!"=="" (
    echo   Brillo guardado     : No configurado
) else (
    echo   Brillo guardado     : !BRIGHTNESS!
)
echo   Pantalla activa     : !STAY_AWAKE_STATUS!
echo   Pantalla apagada    : !SCREEN_OFF_STATUS!
echo   Siempre encima      : !ALWAYS_ON_TOP_STATUS!
if "!ANGLE_VALUE!"=="0" (
    echo   Rotacion            : Sin rotacion
) else (
    echo   Rotacion            : !ANGLE_VALUE!°
)
if "!DEVICE_SERIAL!"=="" (
    echo   Dispositivo         : Auto-seleccion
) else (
    echo   Dispositivo fijo    : !DEVICE_SERIAL!
)
echo   Puerto TCP          : !TCP_PORT!
echo   Ping antes conectar : !PING_BEFORE_CONNECT_STATUS!
echo ================================================
echo.
set /p "opcion=  >  Elige una opcion (0-9): "

set "opcion=!opcion: =!"

if "%opcion%"=="1" goto devices
if "%opcion%"=="2" goto tcpip
if "%opcion%"=="3" goto connect
if "%opcion%"=="4" goto scrcpy
if "%opcion%"=="5" goto auto
if "%opcion%"=="6" goto config
if "%opcion%"=="7" goto clean
if "%opcion%"=="8" goto view_log
if "%opcion%"=="9" goto reset_all
if "%opcion%"=="0" goto end
goto menu

REM =============================================
REM GUARDAR CONFIGURACION
REM =============================================
:save_config
(
    echo MAX_SIZE=!MAX_SIZE!
    echo VIDEO_BITRATE=!VIDEO_BITRATE!
    echo AUDIO_FLAG=!AUDIO_FLAG!
    echo AUDIO_STATUS=!AUDIO_STATUS!
    echo STAY_AWAKE_FLAG=!STAY_AWAKE_FLAG!
    echo STAY_AWAKE_STATUS=!STAY_AWAKE_STATUS!
    echo BRIGHTNESS=!BRIGHTNESS!
    echo SCREEN_OFF_FLAG=!SCREEN_OFF_FLAG!
    echo SCREEN_OFF_STATUS=!SCREEN_OFF_STATUS!
    echo ALWAYS_ON_TOP_FLAG=!ALWAYS_ON_TOP_FLAG!
    echo ALWAYS_ON_TOP_STATUS=!ALWAYS_ON_TOP_STATUS!
    echo ANGLE_VALUE=!ANGLE_VALUE!
    echo ANGLE_FLAG=!ANGLE_FLAG!
    echo AUDIO_BITRATE_VALUE=!AUDIO_BITRATE_VALUE!
    echo AUDIO_BITRATE_FLAG=!AUDIO_BITRATE_FLAG!
    echo AUDIO_BUFFER_VALUE=!AUDIO_BUFFER_VALUE!
    echo AUDIO_BUFFER_FLAG=!AUDIO_BUFFER_FLAG!
    echo AUDIO_CODEC_VALUE=!AUDIO_CODEC_VALUE!
    echo AUDIO_CODEC_FLAG=!AUDIO_CODEC_FLAG!
    echo FULLSCREEN_FLAG=!FULLSCREEN_FLAG!
    echo FULLSCREEN_STATUS=!FULLSCREEN_STATUS!
    echo BORDERLESS_FLAG=!BORDERLESS_FLAG!
    echo BORDERLESS_STATUS=!BORDERLESS_STATUS!
    echo WINDOW_TITLE=!WINDOW_TITLE!
    echo WINDOW_TITLE_FLAG=!WINDOW_TITLE_FLAG!
    echo WINDOW_X=!WINDOW_X!
    echo WINDOW_X_FLAG=!WINDOW_X_FLAG!
    echo WINDOW_Y=!WINDOW_Y!
    echo WINDOW_Y_FLAG=!WINDOW_Y_FLAG!
    echo WINDOW_WIDTH=!WINDOW_WIDTH!
    echo WINDOW_WIDTH_FLAG=!WINDOW_WIDTH_FLAG!
    echo WINDOW_HEIGHT=!WINDOW_HEIGHT!
    echo WINDOW_HEIGHT_FLAG=!WINDOW_HEIGHT_FLAG!
    echo MAX_FPS=!MAX_FPS!
    echo MAX_FPS_FLAG=!MAX_FPS_FLAG!
    echo VIDEO_CODEC_VALUE=!VIDEO_CODEC_VALUE!
    echo VIDEO_CODEC_FLAG=!VIDEO_CODEC_FLAG!
    echo VIDEO_BUFFER=!VIDEO_BUFFER!
    echo VIDEO_BUFFER_FLAG=!VIDEO_BUFFER_FLAG!
    echo SHOW_TOUCHES_FLAG=!SHOW_TOUCHES_FLAG!
    echo SHOW_TOUCHES_STATUS=!SHOW_TOUCHES_STATUS!
    echo NO_CONTROL_FLAG=!NO_CONTROL_FLAG!
    echo NO_CONTROL_STATUS=!NO_CONTROL_STATUS!
    echo POWER_OFF_ON_CLOSE_FLAG=!POWER_OFF_ON_CLOSE_FLAG!
    echo POWER_OFF_ON_CLOSE_STATUS=!POWER_OFF_ON_CLOSE_STATUS!
    echo TIME_LIMIT=!TIME_LIMIT!
    echo TIME_LIMIT_FLAG=!TIME_LIMIT_FLAG!
    echo PUSH_TARGET=!PUSH_TARGET!
    echo PUSH_TARGET_FLAG=!PUSH_TARGET_FLAG!
    echo CROP=!CROP!
    echo CROP_FLAG=!CROP_FLAG!
    echo KEYBOARD_MODE=!KEYBOARD_MODE!
    echo KEYBOARD_FLAG=!KEYBOARD_FLAG!
    echo MOUSE_MODE=!MOUSE_MODE!
    echo MOUSE_FLAG=!MOUSE_FLAG!
    echo OTG_FLAG=!OTG_FLAG!
    echo OTG_STATUS=!OTG_STATUS!
    echo SHORTCUT_MOD=!SHORTCUT_MOD!
    echo SHORTCUT_MOD_FLAG=!SHORTCUT_MOD_FLAG!
    echo RECORD_FILE=!RECORD_FILE!
    echo RECORD_FLAG=!RECORD_FLAG!
    echo NO_PLAYBACK_FLAG=!NO_PLAYBACK_FLAG!
    echo NO_PLAYBACK_STATUS=!NO_PLAYBACK_STATUS!
    echo AUDIO_SOURCE=!AUDIO_SOURCE!
    echo AUDIO_SOURCE_FLAG=!AUDIO_SOURCE_FLAG!
    echo NO_WINDOW_FLAG=!NO_WINDOW_FLAG!
    echo NO_WINDOW_STATUS=!NO_WINDOW_STATUS!

    REM Nuevas variables segunda ampliación
    echo VIDEO_SOURCE=!VIDEO_SOURCE!
    echo VIDEO_SOURCE_FLAG=!VIDEO_SOURCE_FLAG!
    echo CAMERA_ID=!CAMERA_ID!
    echo CAMERA_ID_FLAG=!CAMERA_ID_FLAG!
    echo CAMERA_FACING=!CAMERA_FACING!
    echo CAMERA_FACING_FLAG=!CAMERA_FACING_FLAG!
    echo CAMERA_SIZE=!CAMERA_SIZE!
    echo CAMERA_SIZE_FLAG=!CAMERA_SIZE_FLAG!
    echo CAMERA_AR=!CAMERA_AR!
    echo CAMERA_AR_FLAG=!CAMERA_AR_FLAG!
    echo CAMERA_FPS=!CAMERA_FPS!
    echo CAMERA_FPS_FLAG=!CAMERA_FPS_FLAG!
    echo CAMERA_HIGH_SPEED_FLAG=!CAMERA_HIGH_SPEED_FLAG!
    echo CAMERA_HIGH_SPEED_STATUS=!CAMERA_HIGH_SPEED_STATUS!
    echo DISPLAY_ID=!DISPLAY_ID!
    echo DISPLAY_ID_FLAG=!DISPLAY_ID_FLAG!
    echo NEW_DISPLAY=!NEW_DISPLAY!
    echo NEW_DISPLAY_FLAG=!NEW_DISPLAY_FLAG!
    echo NO_VD_DESTROY_CONTENT_FLAG=!NO_VD_DESTROY_CONTENT_FLAG!
    echo NO_VD_DESTROY_CONTENT_STATUS=!NO_VD_DESTROY_CONTENT_STATUS!
    echo NO_VD_SYSTEM_DECORATIONS_FLAG=!NO_VD_SYSTEM_DECORATIONS_FLAG!
    echo NO_VD_SYSTEM_DECORATIONS_STATUS=!NO_VD_SYSTEM_DECORATIONS_STATUS!
    echo GAMEPAD_MODE=!GAMEPAD_MODE!
    echo GAMEPAD_FLAG=!GAMEPAD_FLAG!
    echo MOUSE_BIND=!MOUSE_BIND!
    echo MOUSE_BIND_FLAG=!MOUSE_BIND_FLAG!
    echo NO_KEY_REPEAT_FLAG=!NO_KEY_REPEAT_FLAG!
    echo NO_KEY_REPEAT_STATUS=!NO_KEY_REPEAT_STATUS!
    echo NO_MOUSE_HOVER_FLAG=!NO_MOUSE_HOVER_FLAG!
    echo NO_MOUSE_HOVER_STATUS=!NO_MOUSE_HOVER_STATUS!
    echo PREFER_TEXT_FLAG=!PREFER_TEXT_FLAG!
    echo PREFER_TEXT_STATUS=!PREFER_TEXT_STATUS!
    echo RAW_KEY_EVENTS_FLAG=!RAW_KEY_EVENTS_FLAG!
    echo RAW_KEY_EVENTS_STATUS=!RAW_KEY_EVENTS_STATUS!
    echo NO_CLIPBOARD_AUTOSYNC_FLAG=!NO_CLIPBOARD_AUTOSYNC_FLAG!
    echo NO_CLIPBOARD_AUTOSYNC_STATUS=!NO_CLIPBOARD_AUTOSYNC_STATUS!
    echo LEGACY_PASTE_FLAG=!LEGACY_PASTE_FLAG!
    echo LEGACY_PASTE_STATUS=!LEGACY_PASTE_STATUS!
    echo RECORD_FORMAT=!RECORD_FORMAT!
    echo RECORD_FORMAT_FLAG=!RECORD_FORMAT_FLAG!
    echo RECORD_ORIENTATION=!RECORD_ORIENTATION!
    echo RECORD_ORIENTATION_FLAG=!RECORD_ORIENTATION_FLAG!
    echo KILL_ADB_ON_CLOSE_FLAG=!KILL_ADB_ON_CLOSE_FLAG!
    echo KILL_ADB_ON_CLOSE_STATUS=!KILL_ADB_ON_CLOSE_STATUS!
    echo NO_CLEANUP_FLAG=!NO_CLEANUP_FLAG!
    echo NO_CLEANUP_STATUS=!NO_CLEANUP_STATUS!
    echo NO_POWER_ON_FLAG=!NO_POWER_ON_FLAG!
    echo NO_POWER_ON_STATUS=!NO_POWER_ON_STATUS!
    echo PAUSE_ON_EXIT=!PAUSE_ON_EXIT!
    echo PAUSE_ON_EXIT_FLAG=!PAUSE_ON_EXIT_FLAG!
    echo SCREEN_OFF_TIMEOUT=!SCREEN_OFF_TIMEOUT!
    echo SCREEN_OFF_TIMEOUT_FLAG=!SCREEN_OFF_TIMEOUT_FLAG!
    echo DISABLE_SCREENSAVER_FLAG=!DISABLE_SCREENSAVER_FLAG!
    echo DISABLE_SCREENSAVER_STATUS=!DISABLE_SCREENSAVER_STATUS!
    echo FORCE_ADB_FORWARD_FLAG=!FORCE_ADB_FORWARD_FLAG!
    echo FORCE_ADB_FORWARD_STATUS=!FORCE_ADB_FORWARD_STATUS!
    echo TUNNEL_HOST=!TUNNEL_HOST!
    echo TUNNEL_HOST_FLAG=!TUNNEL_HOST_FLAG!
    echo TUNNEL_PORT=!TUNNEL_PORT!
    echo TUNNEL_PORT_FLAG=!TUNNEL_PORT_FLAG!
    echo PORT=!PORT!
    echo PORT_FLAG=!PORT_FLAG!
    echo AUDIO_DUP_FLAG=!AUDIO_DUP_FLAG!
    echo AUDIO_DUP_STATUS=!AUDIO_DUP_STATUS!
    echo AUDIO_ENCODER=!AUDIO_ENCODER!
    echo AUDIO_ENCODER_FLAG=!AUDIO_ENCODER_FLAG!
    echo AUDIO_CODEC_OPTIONS=!AUDIO_CODEC_OPTIONS!
    echo AUDIO_CODEC_OPTIONS_FLAG=!AUDIO_CODEC_OPTIONS_FLAG!
    echo AUDIO_OUTPUT_BUFFER=!AUDIO_OUTPUT_BUFFER!
    echo AUDIO_OUTPUT_BUFFER_FLAG=!AUDIO_OUTPUT_BUFFER_FLAG!
    echo REQUIRE_AUDIO_FLAG=!REQUIRE_AUDIO_FLAG!
    echo REQUIRE_AUDIO_STATUS=!REQUIRE_AUDIO_STATUS!
    echo CAPTURE_ORIENTATION=!CAPTURE_ORIENTATION!
    echo CAPTURE_ORIENTATION_FLAG=!CAPTURE_ORIENTATION_FLAG!
    echo DISPLAY_ORIENTATION=!DISPLAY_ORIENTATION!
    echo DISPLAY_ORIENTATION_FLAG=!DISPLAY_ORIENTATION_FLAG!
    echo VIDEO_ENCODER=!VIDEO_ENCODER!
    echo VIDEO_ENCODER_FLAG=!VIDEO_ENCODER_FLAG!
    echo VIDEO_CODEC_OPTIONS=!VIDEO_CODEC_OPTIONS!
    echo VIDEO_CODEC_OPTIONS_FLAG=!VIDEO_CODEC_OPTIONS_FLAG!
    echo NO_DOWNSIZE_ON_ERROR_FLAG=!NO_DOWNSIZE_ON_ERROR_FLAG!
    echo NO_DOWNSIZE_ON_ERROR_STATUS=!NO_DOWNSIZE_ON_ERROR_STATUS!
    echo NO_MIPMAPS_FLAG=!NO_MIPMAPS_FLAG!
    echo NO_MIPMAPS_STATUS=!NO_MIPMAPS_STATUS!
    echo RENDER_DRIVER=!RENDER_DRIVER!
    echo RENDER_DRIVER_FLAG=!RENDER_DRIVER_FLAG!
    echo START_APP=!START_APP!
    echo START_APP_FLAG=!START_APP_FLAG!
    echo PRINT_FPS_FLAG=!PRINT_FPS_FLAG!
    echo PRINT_FPS_STATUS=!PRINT_FPS_STATUS!
    echo VERBOSITY=!VERBOSITY!
    echo VERBOSITY_FLAG=!VERBOSITY_FLAG!

    REM Variables 
    echo TCP_PORT=!TCP_PORT!
    echo DEVICE_SERIAL=!DEVICE_SERIAL!
    echo DEVICE_SERIAL_FLAG=!DEVICE_SERIAL_FLAG!
    echo PING_BEFORE_CONNECT=!PING_BEFORE_CONNECT!
    echo PING_BEFORE_CONNECT_STATUS=!PING_BEFORE_CONNECT_STATUS!
    echo SCREENSHOT_DIR=!SCREENSHOT_DIR!
) > "%CONFIG_FILE%" 2>nul

if errorlevel 1 (
    color 0E
    echo [AVISO] No se pudo guardar la configuracion. Verifica permisos de escritura.
    call :log_error "Fallo al guardar CONFIG_FILE"
    color 0B
) else (
    echo Configuracion guardada correctamente.
)
goto :eof

REM =============================================
REM LOG DE ERRORES Y PANTALLA DE ERROR VISUAL
REM =============================================
:log_error
set "msg=%~1"
>> "%LOG_FILE%" echo [%date% %time%] %msg%
goto :eof

:show_error
echo.
echo ================================================
echo                    [!]  ERROR  [!]
echo ================================================
echo   %~1
echo ================================================
echo.
goto :eof

:view_log
cls
color 0E
echo.
echo ================================================
echo                    LOG DE ERRORES
echo ================================================
if not exist "%LOG_FILE%" (
    echo   No hay errores registrados.
) else (
    type "%LOG_FILE%"
    echo.
    echo ------------------------------------------------
    set /p "clear_log=  >  ¿Limpiar log? (S/N): "
    if /i "!clear_log!"=="S" (
        del "%LOG_FILE%" >nul 2>&1
        echo   Log borrado.
    )
)
echo ================================================
echo.
pause
goto menu

REM =============================================
REM ELEGIR IP CON HISTORIAL (AMPLIADO A 10)
REM =============================================
:choose_ip
set "selected_ip="
cls
color 0A
echo.
echo ================================================
echo        SELECCION DE IP - Ultimas direcciones usadas
echo ================================================
if defined IP1  echo   [1]  !IP1!  (mas reciente)
if defined IP2  echo   [2]  !IP2!
if defined IP3  echo   [3]  !IP3!
if defined IP4  echo   [4]  !IP4!
if defined IP5  echo   [5]  !IP5!
if defined IP6  echo   [6]  !IP6!
if defined IP7  echo   [7]  !IP7!
if defined IP8  echo   [8]  !IP8!
if defined IP9  echo   [9]  !IP9!
if defined IP10 echo   [10] !IP10!
echo.
echo   [0]  Ingresar nueva IP
echo ================================================
echo.
set /p "choice=  >  Selecciona (0-10): "
set "choice=!choice: =!"

if "%choice%"=="1"  if defined IP1  (set "selected_ip=!IP1!"  & goto choose_ip_end)
if "%choice%"=="2"  if defined IP2  (set "selected_ip=!IP2!"  & goto choose_ip_end)
if "%choice%"=="3"  if defined IP3  (set "selected_ip=!IP3!"  & goto choose_ip_end)
if "%choice%"=="4"  if defined IP4  (set "selected_ip=!IP4!"  & goto choose_ip_end)
if "%choice%"=="5"  if defined IP5  (set "selected_ip=!IP5!"  & goto choose_ip_end)
if "%choice%"=="6"  if defined IP6  (set "selected_ip=!IP6!"  & goto choose_ip_end)
if "%choice%"=="7"  if defined IP7  (set "selected_ip=!IP7!"  & goto choose_ip_end)
if "%choice%"=="8"  if defined IP8  (set "selected_ip=!IP8!"  & goto choose_ip_end)
if "%choice%"=="9"  if defined IP9  (set "selected_ip=!IP9!"  & goto choose_ip_end)
if "%choice%"=="10" if defined IP10 (set "selected_ip=!IP10!" & goto choose_ip_end)
if "%choice%"=="0" goto choose_new_ip

echo Opcion invalida.
timeout /t 1 >nul
goto choose_ip

:choose_new_ip
set /p "selected_ip=  >  Ingresa la nueva IP (ej: 192.168.1.105) o Enter para cancelar: "
if "!selected_ip!"=="" (
    echo Operacion cancelada.
    timeout /t 2 >nul
    goto choose_ip_end
)

set "selected_ip=!selected_ip: =!"
echo !selected_ip! | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
if errorlevel 1 (
    color 0E
    echo [AVISO] El formato ingresado no parece una direccion IP valida.
    color 0A
    set /p "proceed=¿Deseas usar esta direccion de todas formas? (S/N): "
    if /i not "!proceed!"=="S" (
        set "selected_ip="
        goto choose_ip_end
    )
)

call :update_history "!selected_ip!"
:choose_ip_end
goto :eof

:update_history
set "new_ip=%~1"
if "%new_ip%"=="" goto :eof
if "%new_ip%"=="!IP1!" goto save_history

if "%new_ip%"=="!IP2!"  (set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP3!"  (set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP4!"  (set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP5!"  (set "IP5=!IP4!"  & set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP6!"  (set "IP6=!IP5!"  & set "IP5=!IP4!"  & set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP7!"  (set "IP7=!IP6!"  & set "IP6=!IP5!"  & set "IP5=!IP4!"  & set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP8!"  (set "IP8=!IP7!"  & set "IP7=!IP6!"  & set "IP6=!IP5!"  & set "IP5=!IP4!"  & set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP9!"  (set "IP9=!IP8!"  & set "IP8=!IP7!"  & set "IP7=!IP6!"  & set "IP6=!IP5!"  & set "IP5=!IP4!"  & set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)
if "%new_ip%"=="!IP10!" (set "IP10=!IP9!" & set "IP9=!IP8!"  & set "IP8=!IP7!"  & set "IP7=!IP6!"  & set "IP6=!IP5!"  & set "IP5=!IP4!"  & set "IP4=!IP3!"  & set "IP3=!IP2!"  & set "IP2=!IP1!"  & set "IP1=!new_ip!" & goto save_history)

set "IP10=!IP9!" & set "IP9=!IP8!" & set "IP8=!IP7!" & set "IP7=!IP6!" & set "IP6=!IP5!"
set "IP5=!IP4!"  & set "IP4=!IP3!" & set "IP3=!IP2!" & set "IP2=!IP1!" & set "IP1=!new_ip!"

:save_history
(
    if defined IP1  echo !IP1!
    if defined IP2  echo !IP2!
    if defined IP3  echo !IP3!
    if defined IP4  echo !IP4!
    if defined IP5  echo !IP5!
    if defined IP6  echo !IP6!
    if defined IP7  echo !IP7!
    if defined IP8  echo !IP8!
    if defined IP9  echo !IP9!
    if defined IP10 echo !IP10!
) > "%HISTORY_FILE%" 2>nul

if errorlevel 1 (
    color 0E
    echo [AVISO] No se pudo guardar el historial. Verifica permisos de escritura.
    call :log_error "Fallo al guardar HISTORY_FILE"
    color 0A
)
goto :eof

REM =============================================
REM APLICAR BRILLO GUARDADO
REM =============================================
:apply_brightness
if "!BRIGHTNESS!"=="" goto :eof

"%ADB%" devices | findstr /i /r "device$" >nul
if errorlevel 1 (
    echo [AVISO] No hay dispositivo ADB para aplicar el brillo guardado.
    call :log_error "apply_brightness: sin dispositivo ADB"
    goto :eof
)

echo Aplicando brillo guardado: !BRIGHTNESS! ...
"%ADB%" !DEVICE_SERIAL_FLAG! shell settings put system screen_brightness_mode 0 >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! shell settings put secure screen_brightness_mode 0 >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! shell settings put system screen_brightness !BRIGHTNESS! >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! shell settings put secure screen_brightness !BRIGHTNESS! >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! shell am broadcast -a android.intent.action.SCREEN_BRIGHTNESS_CHANGED >nul 2>&1

if errorlevel 1 (
    echo [AVISO] No se pudo aplicar el brillo guardado.
    call :log_error "apply_brightness: fallo al aplicar brillo !BRIGHTNESS!"
) else (
    echo Brillo aplicado correctamente.
)
goto :eof

REM =============================================
REM LANZAR SCRCPY CON TODOS LOS PARÁMETROS
REM =============================================
:run_scrcpy
call :apply_brightness

echo.
echo ================================================
echo            EJECUTANDO SCRCPY - Parametros
echo ================================================
echo   --max-size        !MAX_SIZE!
echo   --video-bit-rate  !VIDEO_BITRATE!
if "!AUDIO_FLAG!"=="" (echo   Audio             : Activado) else (echo   Audio             : Desactivado)
if "!STAY_AWAKE_FLAG!"=="" (echo   Pantalla activa   : No) else (echo   Pantalla activa   : Si)
if "!SCREEN_OFF_FLAG!"=="" (echo   Pantalla apagada  : No) else (echo   Pantalla apagada  : Si)
if "!ALWAYS_ON_TOP_FLAG!"=="" (echo   Siempre encima    : No) else (echo   Siempre encima    : Si)
if "!ANGLE_FLAG!"=="" (echo   Rotacion          : Sin rotacion) else (echo   Rotacion          : !ANGLE_VALUE!°)
echo   Audio bitrate     : !AUDIO_BITRATE_VALUE!
echo   Audio buffer      : !AUDIO_BUFFER_VALUE! ms
echo   Audio codec       : !AUDIO_CODEC_VALUE!
if "!FULLSCREEN_FLAG!"=="" (echo   Pantalla completa : No) else (echo   Pantalla completa : Si)
if "!BORDERLESS_FLAG!"=="" (echo   Sin bordes         : No) else (echo   Sin bordes         : Si)
if "!MAX_FPS!"=="" (echo   Max FPS           : Sin limite) else (echo   Max FPS           : !MAX_FPS!)
echo   Video codec       : !VIDEO_CODEC_VALUE!
if "!VIDEO_BUFFER!"=="" (echo   Video buffer      : Sin buffer) else (echo   Video buffer      : !VIDEO_BUFFER! ms)
if "!SHOW_TOUCHES_FLAG!"=="" (echo   Mostrar toques    : No) else (echo   Mostrar toques    : Si)
if "!NO_CONTROL_FLAG!"=="" (echo   Solo mirror       : No) else (echo   Solo mirror       : Si)
if "!POWER_OFF_ON_CLOSE_FLAG!"=="" (echo   Apagar al cerrar  : No) else (echo   Apagar al cerrar  : Si)
if "!TIME_LIMIT!"=="" (echo   Limite tiempo     : Sin limite) else (echo   Limite tiempo     : !TIME_LIMIT! s)
echo   Push target       : !PUSH_TARGET!
if "!DEVICE_SERIAL!"=="" (echo   Dispositivo       : Auto) else (echo   Dispositivo       : !DEVICE_SERIAL!)
echo ================================================
echo.

"%SCRCPY%" !DEVICE_SERIAL_FLAG! --max-size !MAX_SIZE! --video-bit-rate !VIDEO_BITRATE! !AUDIO_FLAG! !STAY_AWAKE_FLAG! !SCREEN_OFF_FLAG! !ALWAYS_ON_TOP_FLAG! !ANGLE_FLAG! !AUDIO_BITRATE_FLAG! !AUDIO_BUFFER_FLAG! !AUDIO_CODEC_FLAG! !FULLSCREEN_FLAG! !BORDERLESS_FLAG! !WINDOW_TITLE_FLAG! !WINDOW_X_FLAG! !WINDOW_Y_FLAG! !WINDOW_WIDTH_FLAG! !WINDOW_HEIGHT_FLAG! !MAX_FPS_FLAG! !VIDEO_CODEC_FLAG! !VIDEO_BUFFER_FLAG! !SHOW_TOUCHES_FLAG! !NO_CONTROL_FLAG! !POWER_OFF_ON_CLOSE_FLAG! !TIME_LIMIT_FLAG! !PUSH_TARGET_FLAG! !CROP_FLAG! !KEYBOARD_FLAG! !MOUSE_FLAG! !OTG_FLAG! !SHORTCUT_MOD_FLAG! !RECORD_FLAG! !NO_PLAYBACK_FLAG! !AUDIO_SOURCE_FLAG! !NO_WINDOW_FLAG! !VIDEO_SOURCE_FLAG! !CAMERA_ID_FLAG! !CAMERA_FACING_FLAG! !CAMERA_SIZE_FLAG! !CAMERA_AR_FLAG! !CAMERA_FPS_FLAG! !CAMERA_HIGH_SPEED_FLAG! !DISPLAY_ID_FLAG! !NEW_DISPLAY_FLAG! !NO_VD_DESTROY_CONTENT_FLAG! !NO_VD_SYSTEM_DECORATIONS_FLAG! !GAMEPAD_FLAG! !MOUSE_BIND_FLAG! !NO_KEY_REPEAT_FLAG! !NO_MOUSE_HOVER_FLAG! !PREFER_TEXT_FLAG! !RAW_KEY_EVENTS_FLAG! !NO_CLIPBOARD_AUTOSYNC_FLAG! !LEGACY_PASTE_FLAG! !RECORD_FORMAT_FLAG! !RECORD_ORIENTATION_FLAG! !KILL_ADB_ON_CLOSE_FLAG! !NO_CLEANUP_FLAG! !NO_POWER_ON_FLAG! !PAUSE_ON_EXIT_FLAG! !SCREEN_OFF_TIMEOUT_FLAG! !DISABLE_SCREENSAVER_FLAG! !FORCE_ADB_FORWARD_FLAG! !TUNNEL_HOST_FLAG! !TUNNEL_PORT_FLAG! !PORT_FLAG! !AUDIO_DUP_FLAG! !AUDIO_ENCODER_FLAG! !AUDIO_CODEC_OPTIONS_FLAG! !AUDIO_OUTPUT_BUFFER_FLAG! !REQUIRE_AUDIO_FLAG! !CAPTURE_ORIENTATION_FLAG! !DISPLAY_ORIENTATION_FLAG! !VIDEO_ENCODER_FLAG! !VIDEO_CODEC_OPTIONS_FLAG! !NO_DOWNSIZE_ON_ERROR_FLAG! !NO_MIPMAPS_FLAG! !RENDER_DRIVER_FLAG! !START_APP_FLAG! !PRINT_FPS_FLAG! !VERBOSITY_FLAG!
set "scrcpy_exit=!errorlevel!"

if not "!scrcpy_exit!"=="0" (
    color 0E
    echo [AVISO] scrcpy termino con codigo de error: !scrcpy_exit!
    call :log_error "scrcpy salio con errorlevel !scrcpy_exit!"
    color 0B
)
goto :eof

REM =============================================
REM RESET TOTAL
REM =============================================
:reset_all
cls
color 0E
echo.
echo ================================================
echo       BORRAR HISTORIAL Y CONFIGURACION (RESET)
echo ================================================
echo   [1]  Solo borrar historial de IPs
echo   [2]  Solo borrar configuracion guardada
echo   [3]  Solo borrar log de errores
echo   [4]  RESET TOTAL (todo lo anterior)
echo   [0]  Cancelar
echo ================================================
echo.
set /p "reset_op=  >  Elige opcion: "
set "reset_op=!reset_op: =!"

if "%reset_op%"=="0" goto menu
if "%reset_op%"=="1" goto reset_only_history
if "%reset_op%"=="2" goto reset_only_config
if "%reset_op%"=="3" goto reset_only_log
if "%reset_op%"=="4" goto reset_total
goto reset_all

:reset_only_history
set /p "confirm=  >  ¿Borrar historial de IPs? (S/N): "
if /i not "!confirm!"=="S" goto menu
if exist "%HISTORY_FILE%" del "%HISTORY_FILE%" >nul 2>&1
set "IP1=" & set "IP2=" & set "IP3=" & set "IP4=" & set "IP5="
set "IP6=" & set "IP7=" & set "IP8=" & set "IP9=" & set "IP10="
echo  [✓] Historial de IPs borrado.
pause
goto menu

:reset_only_config
set /p "confirm=  >  ¿Borrar configuracion guardada? (S/N): "
if /i not "!confirm!"=="S" goto menu
if exist "%CONFIG_FILE%" del "%CONFIG_FILE%" >nul 2>&1
echo  [✓] Configuracion borrada.
pause
goto menu

:reset_only_log
set /p "confirm=  >  ¿Borrar log de errores? (S/N): "
if /i not "!confirm!"=="S" goto menu
if exist "%LOG_FILE%" del "%LOG_FILE%" >nul 2>&1
echo  [✓] Log borrado.
pause
goto menu

:reset_total
set /p "confirm=  >  ¿RESET TOTAL? Esto borra todo. (S/N): "
if /i not "!confirm!"=="S" (
    echo Operacion cancelada.
    pause
    goto menu
)

if exist "%CONFIG_FILE%"  del "%CONFIG_FILE%" >nul 2>&1
if exist "%HISTORY_FILE%" del "%HISTORY_FILE%" >nul 2>&1
if exist "%LOG_FILE%"     del "%LOG_FILE%" >nul 2>&1
if exist "%BACKUP_FILE%"  del "%BACKUP_FILE%" >nul 2>&1

REM Restablecer todas las variables a valores por defecto
set "MAX_SIZE=1024"
set "VIDEO_BITRATE=4M"
set "AUDIO_FLAG="
set "AUDIO_STATUS=Activado"
set "STAY_AWAKE_FLAG="
set "STAY_AWAKE_STATUS=Desactivado"
set "BRIGHTNESS="
set "SCREEN_OFF_FLAG="
set "SCREEN_OFF_STATUS=Desactivado"
set "ALWAYS_ON_TOP_FLAG="
set "ALWAYS_ON_TOP_STATUS=Desactivado"
set "ANGLE_VALUE=0"
set "ANGLE_FLAG="
set "AUDIO_BITRATE_VALUE=128K"
set "AUDIO_BITRATE_FLAG=--audio-bit-rate=128K"
set "AUDIO_BUFFER_VALUE=50"
set "AUDIO_BUFFER_FLAG=--audio-buffer=50"
set "AUDIO_CODEC_VALUE=opus"
set "AUDIO_CODEC_FLAG=--audio-codec=opus"
set "FULLSCREEN_FLAG="
set "FULLSCREEN_STATUS=Desactivado"
set "BORDERLESS_FLAG="
set "BORDERLESS_STATUS=Desactivado"
set "WINDOW_TITLE="
set "WINDOW_TITLE_FLAG="
set "WINDOW_X="
set "WINDOW_X_FLAG="
set "WINDOW_Y="
set "WINDOW_Y_FLAG="
set "WINDOW_WIDTH="
set "WINDOW_WIDTH_FLAG="
set "WINDOW_HEIGHT="
set "WINDOW_HEIGHT_FLAG="
set "MAX_FPS="
set "MAX_FPS_FLAG="
set "VIDEO_CODEC_VALUE=h264"
set "VIDEO_CODEC_FLAG=--video-codec=h264"
set "VIDEO_BUFFER="
set "VIDEO_BUFFER_FLAG="
set "SHOW_TOUCHES_FLAG="
set "SHOW_TOUCHES_STATUS=Desactivado"
set "NO_CONTROL_FLAG="
set "NO_CONTROL_STATUS=Desactivado"
set "POWER_OFF_ON_CLOSE_FLAG="
set "POWER_OFF_ON_CLOSE_STATUS=Desactivado"
set "TIME_LIMIT="
set "TIME_LIMIT_FLAG="
set "PUSH_TARGET=/sdcard/Download/"
set "PUSH_TARGET_FLAG=--push-target=/sdcard/Download/"
set "CROP="
set "CROP_FLAG="
set "KEYBOARD_MODE=sdk"
set "KEYBOARD_FLAG=--keyboard=sdk"
set "MOUSE_MODE=sdk"
set "MOUSE_FLAG=--mouse=sdk"
set "OTG_FLAG="
set "OTG_STATUS=Desactivado"
set "SHORTCUT_MOD=lalt,lsuper"
set "SHORTCUT_MOD_FLAG=--shortcut-mod=lalt,lsuper"
set "RECORD_FILE="
set "RECORD_FLAG="
set "NO_PLAYBACK_FLAG="
set "NO_PLAYBACK_STATUS=Desactivado"
set "AUDIO_SOURCE=output"
set "AUDIO_SOURCE_FLAG=--audio-source=output"
set "NO_WINDOW_FLAG="
set "NO_WINDOW_STATUS=Desactivado"
set "VIDEO_SOURCE=display"
set "VIDEO_SOURCE_FLAG="
set "CAMERA_ID="
set "CAMERA_ID_FLAG="
set "CAMERA_FACING="
set "CAMERA_FACING_FLAG="
set "CAMERA_SIZE="
set "CAMERA_SIZE_FLAG="
set "CAMERA_AR="
set "CAMERA_AR_FLAG="
set "CAMERA_FPS="
set "CAMERA_FPS_FLAG="
set "CAMERA_HIGH_SPEED_FLAG="
set "CAMERA_HIGH_SPEED_STATUS=Desactivado"
set "DISPLAY_ID="
set "DISPLAY_ID_FLAG="
set "NEW_DISPLAY="
set "NEW_DISPLAY_FLAG="
set "NO_VD_DESTROY_CONTENT_FLAG="
set "NO_VD_DESTROY_CONTENT_STATUS=Desactivado"
set "NO_VD_SYSTEM_DECORATIONS_FLAG="
set "NO_VD_SYSTEM_DECORATIONS_STATUS=Desactivado"
set "GAMEPAD_MODE=disabled"
set "GAMEPAD_FLAG=--gamepad=disabled"
set "MOUSE_BIND="
set "MOUSE_BIND_FLAG="
set "NO_KEY_REPEAT_FLAG="
set "NO_KEY_REPEAT_STATUS=Desactivado"
set "NO_MOUSE_HOVER_FLAG="
set "NO_MOUSE_HOVER_STATUS=Desactivado"
set "PREFER_TEXT_FLAG="
set "PREFER_TEXT_STATUS=Desactivado"
set "RAW_KEY_EVENTS_FLAG="
set "RAW_KEY_EVENTS_STATUS=Desactivado"
set "NO_CLIPBOARD_AUTOSYNC_FLAG="
set "NO_CLIPBOARD_AUTOSYNC_STATUS=Desactivado"
set "LEGACY_PASTE_FLAG="
set "LEGACY_PASTE_STATUS=Desactivado"
set "RECORD_FORMAT="
set "RECORD_FORMAT_FLAG="
set "RECORD_ORIENTATION="
set "RECORD_ORIENTATION_FLAG="
set "KILL_ADB_ON_CLOSE_FLAG="
set "KILL_ADB_ON_CLOSE_STATUS=Desactivado"
set "NO_CLEANUP_FLAG="
set "NO_CLEANUP_STATUS=Desactivado"
set "NO_POWER_ON_FLAG="
set "NO_POWER_ON_STATUS=Desactivado"
set "PAUSE_ON_EXIT=false"
set "PAUSE_ON_EXIT_FLAG="
set "SCREEN_OFF_TIMEOUT="
set "SCREEN_OFF_TIMEOUT_FLAG="
set "DISABLE_SCREENSAVER_FLAG="
set "DISABLE_SCREENSAVER_STATUS=Desactivado"
set "FORCE_ADB_FORWARD_FLAG="
set "FORCE_ADB_FORWARD_STATUS=Desactivado"
set "TUNNEL_HOST="
set "TUNNEL_HOST_FLAG="
set "TUNNEL_PORT="
set "TUNNEL_PORT_FLAG="
set "PORT="
set "PORT_FLAG="
set "AUDIO_DUP_FLAG="
set "AUDIO_DUP_STATUS=Desactivado"
set "AUDIO_ENCODER="
set "AUDIO_ENCODER_FLAG="
set "AUDIO_CODEC_OPTIONS="
set "AUDIO_CODEC_OPTIONS_FLAG="
set "AUDIO_OUTPUT_BUFFER="
set "AUDIO_OUTPUT_BUFFER_FLAG="
set "REQUIRE_AUDIO_FLAG="
set "REQUIRE_AUDIO_STATUS=Desactivado"
set "CAPTURE_ORIENTATION="
set "CAPTURE_ORIENTATION_FLAG="
set "DISPLAY_ORIENTATION="
set "DISPLAY_ORIENTATION_FLAG="
set "VIDEO_ENCODER="
set "VIDEO_ENCODER_FLAG="
set "VIDEO_CODEC_OPTIONS="
set "VIDEO_CODEC_OPTIONS_FLAG="
set "NO_DOWNSIZE_ON_ERROR_FLAG="
set "NO_DOWNSIZE_ON_ERROR_STATUS=Desactivado"
set "NO_MIPMAPS_FLAG="
set "NO_MIPMAPS_STATUS=Desactivado"
set "RENDER_DRIVER="
set "RENDER_DRIVER_FLAG="
set "START_APP="
set "START_APP_FLAG="
set "PRINT_FPS_FLAG="
set "PRINT_FPS_STATUS=Desactivado"
set "VERBOSITY=info"
set "VERBOSITY_FLAG=--verbosity=info"
set "TCP_PORT=5555"
set "DEVICE_SERIAL="
set "DEVICE_SERIAL_FLAG="
set "PING_BEFORE_CONNECT=1"
set "PING_BEFORE_CONNECT_STATUS=Activado"
set "IP1="  & set "IP2="  & set "IP3="  & set "IP4="  & set "IP5="
set "IP6="  & set "IP7="  & set "IP8="  & set "IP9="  & set "IP10="

echo.
echo  [✓] Historial, configuracion y log borrados.
echo  [✓] Se restauraron los valores predeterminados.
pause
goto menu

REM =============================================
REM FUNCIONES PRINCIPALES
REM =============================================
:clean
cls
color 0E
echo.
echo ================================================
echo          LIMPIANDO DISPOSITIVOS ADB OFFLINE
echo ================================================
echo   Reiniciando servidor ADB...
"%ADB%" kill-server >nul 2>&1
"%ADB%" start-server >nul 2>&1
timeout /t 2 >nul
echo.
echo   Dispositivos actuales:
"%ADB%" devices
echo.
echo   [✓] Limpieza completada.
echo ================================================
echo.
pause
goto menu

:devices
cls
color 0A
echo.
echo ================================================
echo             DISPOSITIVOS ADB CONECTADOS
echo ================================================
"%ADB%" devices -l
echo ================================================
echo.
pause
goto menu

:tcpip
cls
color 0D
echo.
echo ================================================
echo        ACTIVAR MODO TCP/IP (USB requerido)
echo ================================================
echo   Buscando dispositivo USB...
"%ADB%" devices | findstr /i /r "device$" >nul
if errorlevel 1 (
    color 0E
    echo   [!] No se detecto ningun dispositivo USB conectado.
    call :log_error "tcpip: ningun dispositivo USB detectado"
    color 0D
    pause
    goto menu
)

echo   Puerto TCP a usar: !TCP_PORT!
"%ADB%" !DEVICE_SERIAL_FLAG! tcpip !TCP_PORT!
if errorlevel 1 (
    color 0E
    echo   [!] Fallo al activar modo TCP/IP.
    call :log_error "tcpip: fallo adb tcpip !TCP_PORT!"
    color 0D
) else (
    echo.
    echo   [✓] Listo. Ya puedes desconectar el cable USB.
    echo   [✓] Puerto configurado: !TCP_PORT!
)
echo ================================================
echo.
pause
goto menu

:connect
cls
color 0A
echo.
echo ================================================
echo              CONECTAR POR IP (WiFi)
echo ================================================
call :choose_ip
if not defined selected_ip (
    echo No se selecciono IP.
    pause
    goto menu
)

set "ip=!selected_ip!"

REM Ping opcional antes de conectar
if "!PING_BEFORE_CONNECT!"=="1" (
    echo.
    echo  Verificando conectividad con !ip! ...
    ping -n 2 -w 1000 !ip! >nul 2>&1
    if errorlevel 1 (
        color 0E
        echo  [AVISO] El host !ip! no responde al ping.
        color 0A
        set /p "force_conn=  >  ¿Intentar conectar igualmente? (S/N): "
        if /i not "!force_conn!"=="S" goto menu
    ) else (
        echo  [✓] Host alcanzable.
    )
)

echo.
echo Conectando a !ip!:!TCP_PORT! ...
"%ADB%" connect !ip!:!TCP_PORT!
set "conn_err=!errorlevel!"
timeout /t 2 >nul

if not "!conn_err!"=="0" (
    color 0E
    echo [AVISO] La conexion pudo haber fallado (errorlevel !conn_err!).
    call :log_error "connect: fallo al conectar a !ip!:!TCP_PORT!"
    color 0A
)
echo.
"%ADB%" devices
pause
goto menu

:scrcpy
cls
color 0B
echo.
echo ================================================
echo        INICIANDO SCRCPY - Configuracion actual
echo ================================================
call :run_scrcpy
echo.
echo Scrcpy finalizado.
pause
goto menu

:auto
cls
color 0A
echo.
echo ================================================
echo      MODO AUTOMATICO ROBUSTO (RECOMENDADO)
echo ================================================
echo   Reiniciando servidor ADB...
"%ADB%" kill-server >nul 2>&1
"%ADB%" start-server >nul 2>&1
timeout /t 2 >nul

call :choose_ip
if not defined selected_ip (
    echo   Operacion cancelada.
    pause
    goto menu
)

set "ip=!selected_ip!"

REM Ping antes de conectar si está habilitado
if "!PING_BEFORE_CONNECT!"=="1" (
    echo   Verificando alcance de !ip! ...
    ping -n 2 -w 1000 !ip! >nul 2>&1
    if errorlevel 1 (
        color 0E
        echo   [!] !ip! no responde al ping. La red puede estar inestable.
        call :log_error "auto: ping fallido a !ip!"
        color 0A
        set /p "force_ping=  >  ¿Continuar de todas formas? (S/N): "
        if /i not "!force_ping!"=="S" goto menu
    ) else (
        echo   [✓] Host !ip! alcanzable.
    )
)

echo.
echo   Conectando a !ip!:!TCP_PORT! ...
"%ADB%" connect !ip!:!TCP_PORT!
set "conn_err=!errorlevel!"
timeout /t 3 >nul

if not "!conn_err!"=="0" (
    color 0E
    echo   [!] Posible fallo de conexion. Verifica la red.
    call :log_error "auto: fallo conexion a !ip!:!TCP_PORT! (errorlevel !conn_err!)"
    color 0A
    set /p "force=  >  ¿Intentar iniciar scrcpy de todas formas? (S/N): "
    if /i not "!force!"=="S" goto menu
)

echo.
echo   Dispositivos detectados:
"%ADB%" devices
echo.
echo   Iniciando scrcpy...
echo ================================================
call :run_scrcpy
pause
goto menu

REM =============================================
REM CONFIGURACION PRINCIPAL
REM =============================================
:config
cls
color 0E
echo.
echo ================================================
echo         CONFIGURACION DE SCRCPY (Premium )
echo ================================================
echo   [✓] Resolucion        : !MAX_SIZE! px
echo   [✓] Bitrate           : !VIDEO_BITRATE!
echo   [✓] Audio             : !AUDIO_STATUS!
if "!BRIGHTNESS!"=="" (
    echo   [✓] Brillo guardado   : No configurado
) else (
    echo   [✓] Brillo guardado   : !BRIGHTNESS!
)
echo   [✓] Pantalla activa   : !STAY_AWAKE_STATUS!
echo   [✓] Pantalla apagada  : !SCREEN_OFF_STATUS!
echo   [✓] Siempre encima    : !ALWAYS_ON_TOP_STATUS!
if "!ANGLE_VALUE!"=="0" (
    echo   [✓] Rotacion          : Sin rotacion
) else (
    echo   [✓] Rotacion          : !ANGLE_VALUE!°
)
echo ------------------------------------------------
echo.
echo   [1]  Cambiar resolucion maxima
echo   [2]  Cambiar bitrate de video
echo   [3]  Activar / Desactivar audio
echo   [4]  Alternar pantalla activa (toggle)
echo   [5]  Cambiar brillo de la pantalla (y guardarlo)
echo   [6]  Pantalla apagada (modo ahorro/privacidad)
echo   [7]  Perfiles rapidos recomendados
echo   [8]  Configuracion avanzada
echo   [9]  Miscelaneos (deteccion IP, diagnostico, archivos...)
echo   [0]  Volver al menu principal
echo ================================================
echo.
set /p "subop=  >  Elige una opcion: "
set "subop=!subop: =!"

if "%subop%"=="1" goto set_res
if "%subop%"=="2" goto set_bitrate
if "%subop%"=="3" goto set_audio
if "%subop%"=="4" goto toggle_awake
if "%subop%"=="5" goto set_brightness
if "%subop%"=="6" goto toggle_screen_off
if "%subop%"=="7" goto quick_profiles
if "%subop%"=="8" goto advanced_config
if "%subop%"=="9" goto misc_menu
if "%subop%"=="0" goto menu
goto config

REM =============================================
REM MISCELÁNEOS (funciones A–G en menú numérico)
REM =============================================
:misc_menu
cls
color 0D
echo.
echo ================================================
echo                    MISCELANEOS
echo ================================================
echo   [1]  Detectar IP automaticamente (ADB)
echo   [2]  Diagnostico de red / Ping
echo   [3]  Transferir archivos / Instalar APK
echo   [4]  Captura de pantalla rapida
echo   [5]  Informacion del dispositivo
echo   [6]  Seleccionar dispositivo (multi-ADB)
echo   [7]  Exportar / Importar configuracion
echo   [0]  Volver al menu de configuracion
echo ================================================
echo.
set /p "miscopt=  >  Elige (0-7): "
set "miscopt=!miscopt: =!"

if "%miscopt%"=="1" goto detect_ip_auto
if "%miscopt%"=="2" goto diagnose_net
if "%miscopt%"=="3" goto file_transfer
if "%miscopt%"=="4" goto screenshot_menu
if "%miscopt%"=="5" goto device_info
if "%miscopt%"=="6" goto select_device
if "%miscopt%"=="7" goto export_import_config
if "%miscopt%"=="0" goto config
goto misc_menu

REM =============================================
REM CONFIGURACION AVANZADA (NUEVA ORGANIZACIÓN)
REM =============================================
:advanced_config
cls
color 0D
echo.
echo ================================================
echo              CONFIGURACION AVANZADA
echo ================================================
echo   [V]  Video y Ventana
echo   [A]  Audio
echo   [C]  Control y Entrada
echo   [M]  Camara
echo   [D]  Displays Virtuales
echo   [R]  Grabacion
echo   [N]  Red y ADB
echo   [S]  Sistema y Comportamiento
echo   [O]  Otras opciones
echo   [L]  Listados informativos
echo   [0]  Volver al menu de configuracion
echo ================================================
echo.
set /p "advcat=  >  Elige una categoria: "
set "advcat=!advcat: =!"

if /i "!advcat!"=="V" goto adv_video
if /i "!advcat!"=="A" goto adv_audio
if /i "!advcat!"=="C" goto adv_control
if /i "!advcat!"=="M" goto adv_camera
if /i "!advcat!"=="D" goto adv_display
if /i "!advcat!"=="R" goto adv_recording
if /i "!advcat!"=="N" goto adv_network
if /i "!advcat!"=="S" goto adv_system
if /i "!advcat!"=="O" goto adv_other
if /i "!advcat!"=="L" goto adv_list
if "!advcat!"=="0" goto config
goto advanced_config

REM =============================================
REM SUBMENÚ VIDEO Y VENTANA
REM =============================================
:adv_video
cls
echo.
echo ================================================
echo        CONFIGURACION DE VIDEO Y VENTANA
echo ================================================
echo   [1]  Rotacion: !ANGLE_VALUE!°
echo   [2]  Recorte (crop): !CROP!
echo   [3]  Video codec: !VIDEO_CODEC_VALUE!
echo   [4]  Max FPS: !MAX_FPS!
echo   [5]  Video buffer: !VIDEO_BUFFER! ms
echo   [6]  Pantalla completa: !FULLSCREEN_STATUS!
echo   [7]  Ventana sin bordes: !BORDERLESS_STATUS!
echo   [8]  Ventana siempre encima: !ALWAYS_ON_TOP_STATUS!
echo   [9]  Titulo de ventana: !WINDOW_TITLE!
echo   [10] Posicion/Tamaño inicial de ventana
echo   [11] Sin ventana: !NO_WINDOW_STATUS!
echo   [12] Orientacion de captura: !CAPTURE_ORIENTATION!
echo   [13] Orientacion de display: !DISPLAY_ORIENTATION!
echo   [14] Video encoder: !VIDEO_ENCODER!
echo   [15] Opciones de codec video: !VIDEO_CODEC_OPTIONS!
echo   [16] No reducir en error: !NO_DOWNSIZE_ON_ERROR_STATUS!
echo   [17] No mipmaps: !NO_MIPMAPS_STATUS!
echo   [18] Driver de render: !RENDER_DRIVER!
echo   [0]  Volver
echo ================================================
echo.
set /p "vidopt=  >  Elige (0-18): "
set "vidopt=!vidopt: =!"

if "%vidopt%"=="1"  goto set_angle
if "%vidopt%"=="2"  goto set_crop
if "%vidopt%"=="3"  goto set_video_codec
if "%vidopt%"=="4"  goto set_max_fps
if "%vidopt%"=="5"  goto set_video_buffer
if "%vidopt%"=="6"  goto toggle_fullscreen
if "%vidopt%"=="7"  goto toggle_borderless
if "%vidopt%"=="8"  goto toggle_always_on_top
if "%vidopt%"=="9"  goto set_window_title
if "%vidopt%"=="10" goto set_window_geometry
if "%vidopt%"=="11" goto toggle_no_window
if "%vidopt%"=="12" goto set_capture_orientation
if "%vidopt%"=="13" goto set_display_orientation
if "%vidopt%"=="14" goto set_video_encoder
if "%vidopt%"=="15" goto set_video_codec_options
if "%vidopt%"=="16" goto toggle_no_downsize_on_error
if "%vidopt%"=="17" goto toggle_no_mipmaps
if "%vidopt%"=="18" goto set_render_driver
if "%vidopt%"=="0"  goto advanced_config
goto adv_video

REM =============================================
REM SUBMENÚ AUDIO
REM =============================================
:adv_audio
cls
echo.
echo ================================================
echo                CONFIGURACION DE AUDIO
echo ================================================
echo   [1]  Bitrate: !AUDIO_BITRATE_VALUE!
echo   [2]  Buffer: !AUDIO_BUFFER_VALUE! ms
echo   [3]  Codec: !AUDIO_CODEC_VALUE!
echo   [4]  Origen (source): !AUDIO_SOURCE!
echo   [5]  Duplicar audio: !AUDIO_DUP_STATUS!
echo   [6]  Audio encoder: !AUDIO_ENCODER!
echo   [7]  Opciones codec audio: !AUDIO_CODEC_OPTIONS!
echo   [8]  Buffer salida audio: !AUDIO_OUTPUT_BUFFER! ms
echo   [9]  Requerir audio: !REQUIRE_AUDIO_STATUS!
echo   [0]  Volver
echo ================================================
echo.
set /p "audopt=  >  Elige (0-9): "
set "audopt=!audopt: =!"

if "%audopt%"=="1" goto set_audio_bitrate
if "%audopt%"=="2" goto set_audio_buffer
if "%audopt%"=="3" goto set_audio_codec
if "%audopt%"=="4" goto set_audio_source
if "%audopt%"=="5" goto toggle_audio_dup
if "%audopt%"=="6" goto set_audio_encoder
if "%audopt%"=="7" goto set_audio_codec_options
if "%audopt%"=="8" goto set_audio_output_buffer
if "%audopt%"=="9" goto toggle_require_audio
if "%audopt%"=="0" goto advanced_config
goto adv_audio

REM =============================================
REM SUBMENÚ CONTROL Y ENTRADA
REM =============================================
:adv_control
cls
echo.
echo ================================================
echo            CONTROL Y ENTRADA (TECLADO/RATON)
echo ================================================
echo   [1]  Modo teclado: !KEYBOARD_MODE!
echo   [2]  Modo raton: !MOUSE_MODE!
echo   [3]  Modo gamepad: !GAMEPAD_MODE!
echo   [4]  Modo OTG: !OTG_STATUS!
echo   [5]  Tecla MOD: !SHORTCUT_MOD!
echo   [6]  Mouse bindings: !MOUSE_BIND!
echo   [7]  No repetir teclas: !NO_KEY_REPEAT_STATUS!
echo   [8]  No mouse hover: !NO_MOUSE_HOVER_STATUS!
echo   [9]  Preferir texto: !PREFER_TEXT_STATUS!
echo   [10] Raw key events: !RAW_KEY_EVENTS_STATUS!
echo   [11] Mostrar toques: !SHOW_TOUCHES_STATUS!
echo   [12] Solo mirror (sin control): !NO_CONTROL_STATUS!
echo   [13] Pantalla activa (stay awake): !STAY_AWAKE_STATUS!
echo   [14] Apagar pantalla al cerrar: !POWER_OFF_ON_CLOSE_STATUS!
echo   [0]  Volver
echo ================================================
echo.
set /p "ctrlopt=  >  Elige (0-14): "
set "ctrlopt=!ctrlopt: =!"

if "%ctrlopt%"=="1"  goto set_keyboard_mode
if "%ctrlopt%"=="2"  goto set_mouse_mode
if "%ctrlopt%"=="3"  goto set_gamepad_mode
if "%ctrlopt%"=="4"  goto toggle_otg
if "%ctrlopt%"=="5"  goto set_shortcut_mod
if "%ctrlopt%"=="6"  goto set_mouse_bind
if "%ctrlopt%"=="7"  goto toggle_no_key_repeat
if "%ctrlopt%"=="8"  goto toggle_no_mouse_hover
if "%ctrlopt%"=="9"  goto toggle_prefer_text
if "%ctrlopt%"=="10" goto toggle_raw_key_events
if "%ctrlopt%"=="11" goto toggle_show_touches
if "%ctrlopt%"=="12" goto toggle_no_control
if "%ctrlopt%"=="13" goto toggle_awake
if "%ctrlopt%"=="14" goto toggle_power_off_on_close
if "%ctrlopt%"=="0"  goto advanced_config
goto adv_control

REM =============================================
REM SUBMENÚ CÁMARA
REM =============================================
:adv_camera
cls
echo.
echo ================================================
echo                CONFIGURACION DE CAMARA
echo ================================================
echo   [1]  Fuente de video: !VIDEO_SOURCE!
echo   [2]  Camera ID: !CAMERA_ID!
echo   [3]  Camera facing: !CAMERA_FACING!
echo   [4]  Camera size: !CAMERA_SIZE!
echo   [5]  Camera aspect ratio: !CAMERA_AR!
echo   [6]  Camera FPS: !CAMERA_FPS!
echo   [7]  High speed: !CAMERA_HIGH_SPEED_STATUS!
echo   [0]  Volver
echo ================================================
echo.
set /p "camopt=  >  Elige (0-7): "
set "camopt=!camopt: =!"

if "%camopt%"=="1" goto set_video_source
if "%camopt%"=="2" goto set_camera_id
if "%camopt%"=="3" goto set_camera_facing
if "%camopt%"=="4" goto set_camera_size
if "%camopt%"=="5" goto set_camera_ar
if "%camopt%"=="6" goto set_camera_fps
if "%camopt%"=="7" goto toggle_camera_high_speed
if "%camopt%"=="0" goto advanced_config
goto adv_camera

REM =============================================
REM SUBMENÚ DISPLAYS VIRTUALES
REM =============================================
:adv_display
cls
echo.
echo ================================================
echo             CONFIGURACION DE DISPLAYS
echo ================================================
echo   [1]  Display ID: !DISPLAY_ID!
echo   [2]  Nuevo display virtual: !NEW_DISPLAY!
echo   [3]  No destruir contenido al cerrar: !NO_VD_DESTROY_CONTENT_STATUS!
echo   [4]  Sin decoraciones sistema: !NO_VD_SYSTEM_DECORATIONS_STATUS!
echo   [0]  Volver
echo ================================================
echo.
set /p "disopt=  >  Elige (0-4): "
set "disopt=!disopt: =!"

if "%disopt%"=="1" goto set_display_id
if "%disopt%"=="2" goto set_new_display
if "%disopt%"=="3" goto toggle_no_vd_destroy_content
if "%disopt%"=="4" goto toggle_no_vd_system_decorations
if "%disopt%"=="0" goto advanced_config
goto adv_display

REM =============================================
REM SUBMENÚ GRABACIÓN
REM =============================================
:adv_recording
cls
echo.
echo ================================================
echo                CONFIGURACION DE GRABACION
echo ================================================
echo   [1]  Archivo de grabacion: !RECORD_FILE!
echo   [2]  No mostrar reproduccion: !NO_PLAYBACK_STATUS!
echo   [3]  Limite de tiempo: !TIME_LIMIT! segundos
echo   [4]  Formato de grabacion: !RECORD_FORMAT!
echo   [5]  Orientacion de grabacion: !RECORD_ORIENTATION!
echo   [0]  Volver
echo ================================================
echo.
set /p "recopt=  >  Elige (0-5): "
set "recopt=!recopt: =!"

if "%recopt%"=="1" goto set_record_file
if "%recopt%"=="2" goto toggle_no_playback
if "%recopt%"=="3" goto set_time_limit
if "%recopt%"=="4" goto set_record_format
if "%recopt%"=="5" goto set_record_orientation
if "%recopt%"=="0" goto advanced_config
goto adv_recording

REM =============================================
REM SUBMENÚ RED Y ADB
REM =============================================
:adv_network
cls
echo.
echo ================================================
echo                CONFIGURACION DE RED/ADB
echo ================================================
echo   [1]  Forzar adb forward: !FORCE_ADB_FORWARD_STATUS!
echo   [2]  Tunnel host: !TUNNEL_HOST!
echo   [3]  Tunnel port: !TUNNEL_PORT!
echo   [4]  Puerto local: !PORT!
echo   [5]  Puerto TCP/IP: !TCP_PORT!
echo   [6]  Ping antes de conectar: !PING_BEFORE_CONNECT_STATUS!
echo   [0]  Volver
echo ================================================
echo.
set /p "netopt=  >  Elige (0-6): "
set "netopt=!netopt: =!"

if "%netopt%"=="1" goto toggle_force_adb_forward
if "%netopt%"=="2" goto set_tunnel_host
if "%netopt%"=="3" goto set_tunnel_port
if "%netopt%"=="4" goto set_port
if "%netopt%"=="5" goto set_tcp_port
if "%netopt%"=="6" goto toggle_ping_before_connect
if "%netopt%"=="0" goto advanced_config
goto adv_network

REM =============================================
REM SUBMENÚ SISTEMA Y COMPORTAMIENTO
REM =============================================
:adv_system
cls
echo.
echo ================================================
echo            SISTEMA Y COMPORTAMIENTO
echo ================================================
echo   [1]  Kill ADB al cerrar: !KILL_ADB_ON_CLOSE_STATUS!
echo   [2]  No limpiar al salir: !NO_CLEANUP_STATUS!
echo   [3]  No encender dispositivo: !NO_POWER_ON_STATUS!
echo   [4]  Pausa al salir: !PAUSE_ON_EXIT!
echo   [5]  Screen off timeout: !SCREEN_OFF_TIMEOUT! s
echo   [6]  Desactivar salvapantallas: !DISABLE_SCREENSAVER_STATUS!
echo   [7]  No sincro portapapeles: !NO_CLIPBOARD_AUTOSYNC_STATUS!
echo   [8]  Legacy paste: !LEGACY_PASTE_STATUS!
echo   [9]  Verbosity: !VERBOSITY!
echo   [10] Print FPS: !PRINT_FPS_STATUS!
echo   [11] Start app: !START_APP!
echo   [0]  Volver
echo ================================================
echo.
set /p "sysopt=  >  Elige (0-11): "
set "sysopt=!sysopt: =!"

if "%sysopt%"=="1"  goto toggle_kill_adb_on_close
if "%sysopt%"=="2"  goto toggle_no_cleanup
if "%sysopt%"=="3"  goto toggle_no_power_on
if "%sysopt%"=="4"  goto set_pause_on_exit
if "%sysopt%"=="5"  goto set_screen_off_timeout
if "%sysopt%"=="6"  goto toggle_disable_screensaver
if "%sysopt%"=="7"  goto toggle_no_clipboard_autosync
if "%sysopt%"=="8"  goto toggle_legacy_paste
if "%sysopt%"=="9"  goto set_verbosity
if "%sysopt%"=="10" goto toggle_print_fps
if "%sysopt%"=="11" goto set_start_app
if "%sysopt%"=="0"  goto advanced_config
goto adv_system

REM =============================================
REM SUBMENÚ OTRAS OPCIONES
REM =============================================
:adv_other
cls
echo.
echo ================================================
echo                   OTRAS OPCIONES
echo ================================================
echo   [1]  Directorio push: !PUSH_TARGET!
echo   [2]  Pantalla apagada al iniciar: !SCREEN_OFF_STATUS!
echo   [3]  Brillo guardado: !BRIGHTNESS!
echo   [0]  Volver
echo ================================================
echo.
set /p "othopt=  >  Elige (0-3): "
set "othopt=!othopt: =!"

if "%othopt%"=="1" goto set_push_target
if "%othopt%"=="2" goto toggle_screen_off
if "%othopt%"=="3" goto set_brightness
if "%othopt%"=="0" goto advanced_config
goto adv_other

REM =============================================
REM LISTADOS INFORMATIVOS
REM =============================================
:adv_list
cls
echo.
echo ================================================
echo                LISTADOS INFORMATIVOS
echo ================================================
echo   [1]  --list-cameras
echo   [2]  --list-camera-sizes
echo   [3]  --list-displays
echo   [4]  --list-encoders
echo   [5]  --list-apps
echo   [0]  Volver
echo ================================================
echo.
set /p "listopt=  >  Elige (0-5): "
set "listopt=!listopt: =!"

if "%listopt%"=="1" "%SCRCPY%" !DEVICE_SERIAL_FLAG! --list-cameras & pause & goto advanced_config
if "%listopt%"=="2" "%SCRCPY%" !DEVICE_SERIAL_FLAG! --list-camera-sizes & pause & goto advanced_config
if "%listopt%"=="3" "%SCRCPY%" !DEVICE_SERIAL_FLAG! --list-displays & pause & goto advanced_config
if "%listopt%"=="4" "%SCRCPY%" !DEVICE_SERIAL_FLAG! --list-encoders & pause & goto advanced_config
if "%listopt%"=="5" "%SCRCPY%" !DEVICE_SERIAL_FLAG! --list-apps & pause & goto advanced_config
if "%listopt%"=="0" goto advanced_config
goto adv_list

REM =============================================
REM IMPLEMENTACIÓN DE FUNCIONES DE CÁMARA
REM =============================================
:set_video_source
cls
echo.
echo ================================================
echo        FUENTE DE VIDEO (--video-source)
echo ================================================
echo   Opciones: display, camera
echo   Actual: !VIDEO_SOURCE!
set /p "newvs=  >  Nuevo valor (Enter para cancelar): "
if "!newvs!"=="" goto adv_camera
set "VIDEO_SOURCE=!newvs!"
if /i "!VIDEO_SOURCE!"=="display" (set "VIDEO_SOURCE_FLAG=") else (set "VIDEO_SOURCE_FLAG=--video-source=!VIDEO_SOURCE!")
call :save_config
echo  [✓] Video source actualizado a !VIDEO_SOURCE!.
pause
goto adv_camera

:set_camera_id
set /p "newcid=  >  Camera ID (Enter para cancelar): "
if "!newcid!"=="" goto adv_camera
set "CAMERA_ID=!newcid!"
set "CAMERA_ID_FLAG=--camera-id=!newcid!"
call :save_config
echo  [✓] Camera ID actualizado.
pause
goto adv_camera

:set_camera_facing
set /p "newcf=  >  Camera facing (front/back/external, Enter cancelar): "
if "!newcf!"=="" goto adv_camera
set "CAMERA_FACING=!newcf!"
set "CAMERA_FACING_FLAG=--camera-facing=!newcf!"
call :save_config
echo  [✓] Camera facing actualizado.
pause
goto adv_camera

:set_camera_size
set /p "newcsz=  >  Camera size (WxH, Enter cancelar): "
if "!newcsz!"=="" goto adv_camera
set "CAMERA_SIZE=!newcsz!"
set "CAMERA_SIZE_FLAG=--camera-size=!newcsz!"
call :save_config
echo  [✓] Camera size actualizado.
pause
goto adv_camera

:set_camera_ar
set /p "newcar=  >  Camera AR (ej: 4:3, Enter cancelar): "
if "!newcar!"=="" goto adv_camera
set "CAMERA_AR=!newcar!"
set "CAMERA_AR_FLAG=--camera-ar=!newcar!"
call :save_config
echo  [✓] Camera AR actualizado.
pause
goto adv_camera

:set_camera_fps
set /p "newcfps=  >  Camera FPS (Enter cancelar): "
if "!newcfps!"=="" goto adv_camera
set "CAMERA_FPS=!newcfps!"
set "CAMERA_FPS_FLAG=--camera-fps=!newcfps!"
call :save_config
echo  [✓] Camera FPS actualizado.
pause
goto adv_camera

:toggle_camera_high_speed
if "%CAMERA_HIGH_SPEED_STATUS%"=="Activado" (
    set "CAMERA_HIGH_SPEED_FLAG="
    set "CAMERA_HIGH_SPEED_STATUS=Desactivado"
) else (
    set "CAMERA_HIGH_SPEED_FLAG=--camera-high-speed"
    set "CAMERA_HIGH_SPEED_STATUS=Activado"
)
call :save_config
echo  [✓] High speed: !CAMERA_HIGH_SPEED_STATUS!
timeout /t 2 >nul
goto adv_camera

:set_display_id
set /p "newdid=  >  Display ID (Enter cancelar): "
if "!newdid!"=="" goto adv_display
set "DISPLAY_ID=!newdid!"
set "DISPLAY_ID_FLAG=--display-id=!newdid!"
call :save_config
echo  [✓] Display ID actualizado.
pause
goto adv_display

:set_new_display
set /p "newvd=  >  New display [WxH][/DPI] (Enter cancelar): "
if "!newvd!"=="" ( set "NEW_DISPLAY=" & set "NEW_DISPLAY_FLAG=" ) else (
    set "NEW_DISPLAY=!newvd!"
    set "NEW_DISPLAY_FLAG=--new-display=!newvd!"
)
call :save_config
echo  [✓] New display actualizado.
pause
goto adv_display

:toggle_no_vd_destroy_content
if "%NO_VD_DESTROY_CONTENT_STATUS%"=="Activado" (
    set "NO_VD_DESTROY_CONTENT_FLAG="
    set "NO_VD_DESTROY_CONTENT_STATUS=Desactivado"
) else (
    set "NO_VD_DESTROY_CONTENT_FLAG=--no-vd-destroy-content"
    set "NO_VD_DESTROY_CONTENT_STATUS=Activado"
)
call :save_config
echo  [✓] No VD destroy content: !NO_VD_DESTROY_CONTENT_STATUS!
timeout /t 2 >nul
goto adv_display

:toggle_no_vd_system_decorations
if "%NO_VD_SYSTEM_DECORATIONS_STATUS%"=="Activado" (
    set "NO_VD_SYSTEM_DECORATIONS_FLAG="
    set "NO_VD_SYSTEM_DECORATIONS_STATUS=Desactivado"
) else (
    set "NO_VD_SYSTEM_DECORATIONS_FLAG=--no-vd-system-decorations"
    set "NO_VD_SYSTEM_DECORATIONS_STATUS=Activado"
)
call :save_config
echo  [✓] No VD system decorations: !NO_VD_SYSTEM_DECORATIONS_STATUS!
timeout /t 2 >nul
goto adv_display

:set_gamepad_mode
set /p "newgm=  >  Modo gamepad (disabled/uhid/aoa): "
if "!newgm!"=="" goto adv_control
set "GAMEPAD_MODE=!newgm!"
set "GAMEPAD_FLAG=--gamepad=!newgm!"
call :save_config
echo  [✓] Gamepad mode: !GAMEPAD_MODE!
pause
goto adv_control

:set_mouse_bind
set /p "newmb=  >  Mouse bindings (ej: bhsn:++++): "
if "!newmb!"=="" ( set "MOUSE_BIND=" & set "MOUSE_BIND_FLAG=" ) else (
    set "MOUSE_BIND=!newmb!"
    set "MOUSE_BIND_FLAG=--mouse-bind=!newmb!"
)
call :save_config
echo  [✓] Mouse bind actualizado.
pause
goto adv_control

:toggle_no_key_repeat
if "%NO_KEY_REPEAT_STATUS%"=="Activado" (
    set "NO_KEY_REPEAT_FLAG="
    set "NO_KEY_REPEAT_STATUS=Desactivado"
) else (
    set "NO_KEY_REPEAT_FLAG=--no-key-repeat"
    set "NO_KEY_REPEAT_STATUS=Activado"
)
call :save_config
echo  [✓] No key repeat: !NO_KEY_REPEAT_STATUS!
timeout /t 2 >nul
goto adv_control

:toggle_no_mouse_hover
if "%NO_MOUSE_HOVER_STATUS%"=="Activado" (
    set "NO_MOUSE_HOVER_FLAG="
    set "NO_MOUSE_HOVER_STATUS=Desactivado"
) else (
    set "NO_MOUSE_HOVER_FLAG=--no-mouse-hover"
    set "NO_MOUSE_HOVER_STATUS=Activado"
)
call :save_config
echo  [✓] No mouse hover: !NO_MOUSE_HOVER_STATUS!
timeout /t 2 >nul
goto adv_control

:toggle_prefer_text
if "%PREFER_TEXT_STATUS%"=="Activado" (
    set "PREFER_TEXT_FLAG="
    set "PREFER_TEXT_STATUS=Desactivado"
) else (
    set "PREFER_TEXT_FLAG=--prefer-text"
    set "PREFER_TEXT_STATUS=Activado"
)
call :save_config
echo  [✓] Prefer text: !PREFER_TEXT_STATUS!
timeout /t 2 >nul
goto adv_control

:toggle_raw_key_events
if "%RAW_KEY_EVENTS_STATUS%"=="Activado" (
    set "RAW_KEY_EVENTS_FLAG="
    set "RAW_KEY_EVENTS_STATUS=Desactivado"
) else (
    set "RAW_KEY_EVENTS_FLAG=--raw-key-events"
    set "RAW_KEY_EVENTS_STATUS=Activado"
)
call :save_config
echo  [✓] Raw key events: !RAW_KEY_EVENTS_STATUS!
timeout /t 2 >nul
goto adv_control

:toggle_no_clipboard_autosync
if "%NO_CLIPBOARD_AUTOSYNC_STATUS%"=="Activado" (
    set "NO_CLIPBOARD_AUTOSYNC_FLAG="
    set "NO_CLIPBOARD_AUTOSYNC_STATUS=Desactivado"
) else (
    set "NO_CLIPBOARD_AUTOSYNC_FLAG=--no-clipboard-autosync"
    set "NO_CLIPBOARD_AUTOSYNC_STATUS=Activado"
)
call :save_config
echo  [✓] No clipboard autosync: !NO_CLIPBOARD_AUTOSYNC_STATUS!
timeout /t 2 >nul
goto adv_system

:toggle_legacy_paste
if "%LEGACY_PASTE_STATUS%"=="Activado" (
    set "LEGACY_PASTE_FLAG="
    set "LEGACY_PASTE_STATUS=Desactivado"
) else (
    set "LEGACY_PASTE_FLAG=--legacy-paste"
    set "LEGACY_PASTE_STATUS=Activado"
)
call :save_config
echo  [✓] Legacy paste: !LEGACY_PASTE_STATUS!
timeout /t 2 >nul
goto adv_system

:set_record_format
set /p "newrf=  >  Formato (mp4/mkv/m4a...): "
if "!newrf!"=="" ( set "RECORD_FORMAT=" & set "RECORD_FORMAT_FLAG=" ) else (
    set "RECORD_FORMAT=!newrf!"
    set "RECORD_FORMAT_FLAG=--record-format=!newrf!"
)
call :save_config
echo  [✓] Record format actualizado.
pause
goto adv_recording

:set_record_orientation
set /p "newro=  >  Orientacion (0/90/180/270): "
if "!newro!"=="" ( set "RECORD_ORIENTATION=" & set "RECORD_ORIENTATION_FLAG=" ) else (
    set "RECORD_ORIENTATION=!newro!"
    set "RECORD_ORIENTATION_FLAG=--record-orientation=!newro!"
)
call :save_config
echo  [✓] Record orientation actualizado.
pause
goto adv_recording

:toggle_kill_adb_on_close
if "%KILL_ADB_ON_CLOSE_STATUS%"=="Activado" (
    set "KILL_ADB_ON_CLOSE_FLAG="
    set "KILL_ADB_ON_CLOSE_STATUS=Desactivado"
) else (
    set "KILL_ADB_ON_CLOSE_FLAG=--kill-adb-on-close"
    set "KILL_ADB_ON_CLOSE_STATUS=Activado"
)
call :save_config
echo  [✓] Kill ADB on close: !KILL_ADB_ON_CLOSE_STATUS!
timeout /t 2 >nul
goto adv_system

:toggle_no_cleanup
if "%NO_CLEANUP_STATUS%"=="Activado" (
    set "NO_CLEANUP_FLAG="
    set "NO_CLEANUP_STATUS=Desactivado"
) else (
    set "NO_CLEANUP_FLAG=--no-cleanup"
    set "NO_CLEANUP_STATUS=Activado"
)
call :save_config
echo  [✓] No cleanup: !NO_CLEANUP_STATUS!
timeout /t 2 >nul
goto adv_system

:toggle_no_power_on
if "%NO_POWER_ON_STATUS%"=="Activado" (
    set "NO_POWER_ON_FLAG="
    set "NO_POWER_ON_STATUS=Desactivado"
) else (
    set "NO_POWER_ON_FLAG=--no-power-on"
    set "NO_POWER_ON_STATUS=Activado"
)
call :save_config
echo  [✓] No power on: !NO_POWER_ON_STATUS!
timeout /t 2 >nul
goto adv_system

:set_pause_on_exit
set /p "newpoe=  >  Valor (true/false/if-error): "
if "!newpoe!"=="" goto adv_system
set "PAUSE_ON_EXIT=!newpoe!"
if /i "!newpoe!"=="false" (set "PAUSE_ON_EXIT_FLAG=") else (set "PAUSE_ON_EXIT_FLAG=--pause-on-exit=!newpoe!")
call :save_config
echo  [✓] Pause on exit: !PAUSE_ON_EXIT!
pause
goto adv_system

:set_screen_off_timeout
set /p "newsot=  >  Segundos (Enter cancelar): "
if "!newsot!"=="" ( set "SCREEN_OFF_TIMEOUT=" & set "SCREEN_OFF_TIMEOUT_FLAG=" ) else (
    set "SCREEN_OFF_TIMEOUT=!newsot!"
    set "SCREEN_OFF_TIMEOUT_FLAG=--screen-off-timeout=!newsot!"
)
call :save_config
echo  [✓] Screen off timeout actualizado.
pause
goto adv_system

:toggle_disable_screensaver
if "%DISABLE_SCREENSAVER_STATUS%"=="Activado" (
    set "DISABLE_SCREENSAVER_FLAG="
    set "DISABLE_SCREENSAVER_STATUS=Desactivado"
) else (
    set "DISABLE_SCREENSAVER_FLAG=--disable-screensaver"
    set "DISABLE_SCREENSAVER_STATUS=Activado"
)
call :save_config
echo  [✓] Disable screensaver: !DISABLE_SCREENSAVER_STATUS!
timeout /t 2 >nul
goto adv_system

:toggle_force_adb_forward
if "%FORCE_ADB_FORWARD_STATUS%"=="Activado" (
    set "FORCE_ADB_FORWARD_FLAG="
    set "FORCE_ADB_FORWARD_STATUS=Desactivado"
) else (
    set "FORCE_ADB_FORWARD_FLAG=--force-adb-forward"
    set "FORCE_ADB_FORWARD_STATUS=Activado"
)
call :save_config
echo  [✓] Force ADB forward: !FORCE_ADB_FORWARD_STATUS!
timeout /t 2 >nul
goto adv_network

:set_tunnel_host
set /p "newth=  >  Tunnel host (Enter cancelar): "
if "!newth!"=="" ( set "TUNNEL_HOST=" & set "TUNNEL_HOST_FLAG=" ) else (
    set "TUNNEL_HOST=!newth!"
    set "TUNNEL_HOST_FLAG=--tunnel-host=!newth!"
)
call :save_config
echo  [✓] Tunnel host actualizado.
pause
goto adv_network

:set_tunnel_port
set /p "newtp=  >  Tunnel port (Enter cancelar): "
if "!newtp!"=="" ( set "TUNNEL_PORT=" & set "TUNNEL_PORT_FLAG=" ) else (
    set "TUNNEL_PORT=!newtp!"
    set "TUNNEL_PORT_FLAG=--tunnel-port=!newtp!"
)
call :save_config
echo  [✓] Tunnel port actualizado.
pause
goto adv_network

:set_port
set /p "newport=  >  Puerto local (Enter cancelar): "
if "!newport!"=="" ( set "PORT=" & set "PORT_FLAG=" ) else (
    set "PORT=!newport!"
    set "PORT_FLAG=--port=!newport!"
)
call :save_config
echo  [✓] Puerto local actualizado.
pause
goto adv_network

REM Puerto TCP/IP personalizable
:set_tcp_port
set /p "newtcp=  >  Puerto TCP/IP para ADB WiFi (actual: !TCP_PORT!, Enter cancelar): "
if "!newtcp!"=="" goto adv_network
set /a "tcpcheck=!newtcp!"
if !tcpcheck! lss 1024 (
    echo [AVISO] Puerto demasiado bajo. Usa un valor entre 1024 y 65535.
    pause
    goto adv_network
)
if !tcpcheck! gtr 65535 (
    echo [AVISO] Puerto fuera de rango. Usa un valor entre 1024 y 65535.
    pause
    goto adv_network
)
set "TCP_PORT=!newtcp!"
call :save_config
echo  [✓] Puerto TCP/IP actualizado a !TCP_PORT!
pause
goto adv_network

REM Toggle ping antes de conectar
:toggle_ping_before_connect
if "!PING_BEFORE_CONNECT!"=="1" (
    set "PING_BEFORE_CONNECT=0"
    set "PING_BEFORE_CONNECT_STATUS=Desactivado"
) else (
    set "PING_BEFORE_CONNECT=1"
    set "PING_BEFORE_CONNECT_STATUS=Activado"
)
call :save_config
echo  [✓] Ping antes de conectar: !PING_BEFORE_CONNECT_STATUS!
timeout /t 2 >nul
goto adv_network

:toggle_audio_dup
if "%AUDIO_DUP_STATUS%"=="Activado" (
    set "AUDIO_DUP_FLAG="
    set "AUDIO_DUP_STATUS=Desactivado"
) else (
    set "AUDIO_DUP_FLAG=--audio-dup"
    set "AUDIO_DUP_STATUS=Activado"
)
call :save_config
echo  [✓] Audio dup: !AUDIO_DUP_STATUS!
timeout /t 2 >nul
goto adv_audio

:set_audio_encoder
set /p "newae=  >  Audio encoder (Enter cancelar): "
if "!newae!"=="" ( set "AUDIO_ENCODER=" & set "AUDIO_ENCODER_FLAG=" ) else (
    set "AUDIO_ENCODER=!newae!"
    set "AUDIO_ENCODER_FLAG=--audio-encoder=!newae!"
)
call :save_config
echo  [✓] Audio encoder actualizado.
pause
goto adv_audio

:set_audio_codec_options
set /p "newaco=  >  Opciones (ej: bitrate=128000): "
if "!newaco!"=="" ( set "AUDIO_CODEC_OPTIONS=" & set "AUDIO_CODEC_OPTIONS_FLAG=" ) else (
    set "AUDIO_CODEC_OPTIONS=!newaco!"
    set "AUDIO_CODEC_OPTIONS_FLAG=--audio-codec-options=!newaco!"
)
call :save_config
echo  [✓] Audio codec options actualizado.
pause
goto adv_audio

:set_audio_output_buffer
set /p "newaob=  >  Buffer salida audio (ms): "
if "!newaob!"=="" ( set "AUDIO_OUTPUT_BUFFER=" & set "AUDIO_OUTPUT_BUFFER_FLAG=" ) else (
    set "AUDIO_OUTPUT_BUFFER=!newaob!"
    set "AUDIO_OUTPUT_BUFFER_FLAG=--audio-output-buffer=!newaob!"
)
call :save_config
echo  [✓] Audio output buffer actualizado.
pause
goto adv_audio

:toggle_require_audio
if "%REQUIRE_AUDIO_STATUS%"=="Activado" (
    set "REQUIRE_AUDIO_FLAG="
    set "REQUIRE_AUDIO_STATUS=Desactivado"
) else (
    set "REQUIRE_AUDIO_FLAG=--require-audio"
    set "REQUIRE_AUDIO_STATUS=Activado"
)
call :save_config
echo  [✓] Require audio: !REQUIRE_AUDIO_STATUS!
timeout /t 2 >nul
goto adv_audio

:set_capture_orientation
set /p "newco=  >  Orientacion (0/90/180/270/flip...): "
if "!newco!"=="" ( set "CAPTURE_ORIENTATION=" & set "CAPTURE_ORIENTATION_FLAG=" ) else (
    set "CAPTURE_ORIENTATION=!newco!"
    set "CAPTURE_ORIENTATION_FLAG=--capture-orientation=!newco!"
)
call :save_config
echo  [✓] Capture orientation actualizado.
pause
goto adv_video

:set_display_orientation
set /p "newdo=  >  Display orientation: "
if "!newdo!"=="" ( set "DISPLAY_ORIENTATION=" & set "DISPLAY_ORIENTATION_FLAG=" ) else (
    set "DISPLAY_ORIENTATION=!newdo!"
    set "DISPLAY_ORIENTATION_FLAG=--display-orientation=!newdo!"
)
call :save_config
echo  [✓] Display orientation actualizado.
pause
goto adv_video

:set_video_encoder
set /p "newve=  >  Video encoder: "
if "!newve!"=="" ( set "VIDEO_ENCODER=" & set "VIDEO_ENCODER_FLAG=" ) else (
    set "VIDEO_ENCODER=!newve!"
    set "VIDEO_ENCODER_FLAG=--video-encoder=!newve!"
)
call :save_config
echo  [✓] Video encoder actualizado.
pause
goto adv_video

:set_video_codec_options
set /p "newvco=  >  Opciones codec video: "
if "!newvco!"=="" ( set "VIDEO_CODEC_OPTIONS=" & set "VIDEO_CODEC_OPTIONS_FLAG=" ) else (
    set "VIDEO_CODEC_OPTIONS=!newvco!"
    set "VIDEO_CODEC_OPTIONS_FLAG=--video-codec-options=!newvco!"
)
call :save_config
echo  [✓] Video codec options actualizado.
pause
goto adv_video

:toggle_no_downsize_on_error
if "%NO_DOWNSIZE_ON_ERROR_STATUS%"=="Activado" (
    set "NO_DOWNSIZE_ON_ERROR_FLAG="
    set "NO_DOWNSIZE_ON_ERROR_STATUS=Desactivado"
) else (
    set "NO_DOWNSIZE_ON_ERROR_FLAG=--no-downsize-on-error"
    set "NO_DOWNSIZE_ON_ERROR_STATUS=Activado"
)
call :save_config
echo  [✓] No downsize on error: !NO_DOWNSIZE_ON_ERROR_STATUS!
timeout /t 2 >nul
goto adv_video

:toggle_no_mipmaps
if "%NO_MIPMAPS_STATUS%"=="Activado" (
    set "NO_MIPMAPS_FLAG="
    set "NO_MIPMAPS_STATUS=Desactivado"
) else (
    set "NO_MIPMAPS_FLAG=--no-mipmaps"
    set "NO_MIPMAPS_STATUS=Activado"
)
call :save_config
echo  [✓] No mipmaps: !NO_MIPMAPS_STATUS!
timeout /t 2 >nul
goto adv_video

:set_render_driver
set /p "newrd=  >  Render driver: "
if "!newrd!"=="" ( set "RENDER_DRIVER=" & set "RENDER_DRIVER_FLAG=" ) else (
    set "RENDER_DRIVER=!newrd!"
    set "RENDER_DRIVER_FLAG=--render-driver=!newrd!"
)
call :save_config
echo  [✓] Render driver actualizado.
pause
goto adv_video

:set_start_app
set /p "newsa=  >  Package name (opcional +?): "
if "!newsa!"=="" ( set "START_APP=" & set "START_APP_FLAG=" ) else (
    set "START_APP=!newsa!"
    set "START_APP_FLAG=--start-app=!newsa!"
)
call :save_config
echo  [✓] Start app actualizado.
pause
goto adv_system

:toggle_print_fps
if "%PRINT_FPS_STATUS%"=="Activado" (
    set "PRINT_FPS_FLAG="
    set "PRINT_FPS_STATUS=Desactivado"
) else (
    set "PRINT_FPS_FLAG=--print-fps"
    set "PRINT_FPS_STATUS=Activado"
)
call :save_config
echo  [✓] Print FPS: !PRINT_FPS_STATUS!
timeout /t 2 >nul
goto adv_system

:set_verbosity
set /p "newv=  >  Nivel (verbose/debug/info/warn/error): "
if "!newv!"=="" goto adv_system
set "VERBOSITY=!newv!"
set "VERBOSITY_FLAG=--verbosity=!newv!"
call :save_config
echo  [✓] Verbosity actualizado.
pause
goto adv_system

REM =============================================
REM FUNCIONES DE CONFIGURACION ORIGINALES
REM =============================================
:set_res
cls
set /p "newsize=  >  Nuevo valor (solo numero, Enter para cancelar): "
if "!newsize!"=="" goto config
set "newsize=!newsize: =!"
echo(!newsize!| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 ( echo [!] Ingresa solo numeros enteros. & pause & goto set_res )
set "MAX_SIZE=!newsize!"
call :save_config
echo  [✓] Resolucion actualizada a !MAX_SIZE! px y guardada.
pause
goto config

:set_bitrate
cls
set /p "newbit=  >  Nuevo valor (ej: 8M, Enter para cancelar): "
if "!newbit!"=="" goto config
set "newbit=!newbit: =!"
set "VIDEO_BITRATE=!newbit!"
call :save_config
echo  [✓] Bitrate actualizado a !VIDEO_BITRATE! y guardado.
pause
goto config

:set_audio
cls
echo  Estado actual: !AUDIO_STATUS!
echo  [1] Activar audio
echo  [2] Desactivar audio
echo  [3] Cancelar
set /p "audioop=  >  Elige: "
set "audioop=!audioop: =!"
if "%audioop%"=="1" (set "AUDIO_FLAG=" & set "AUDIO_STATUS=Activado")
if "%audioop%"=="2" (set "AUDIO_FLAG=--no-audio" & set "AUDIO_STATUS=Desactivado")
if "%audioop%"=="3" goto config
call :save_config
echo  [✓] Audio: !AUDIO_STATUS!
pause
goto config

:toggle_awake
if "%STAY_AWAKE_STATUS%"=="Activado" ( set "STAY_AWAKE_FLAG=" & set "STAY_AWAKE_STATUS=Desactivado" ) else ( set "STAY_AWAKE_FLAG=--stay-awake" & set "STAY_AWAKE_STATUS=Activado" )
call :save_config
echo  [✓] Pantalla activa: !STAY_AWAKE_STATUS!
timeout /t 2 >nul
goto config

:set_brightness
cls
set /p "newbright=  >  Nuevo nivel de brillo (0-255, Enter para cancelar): "
if "!newbright!"=="" goto config
set /a nb=!newbright!
if !nb! lss 0 set nb=0
if !nb! gtr 255 set nb=255
set "BRIGHTNESS=!nb!"
call :save_config
echo  [✓] Brillo guardado: !BRIGHTNESS!
pause
goto config

:toggle_screen_off
if "%SCREEN_OFF_STATUS%"=="Activado" ( set "SCREEN_OFF_FLAG=" & set "SCREEN_OFF_STATUS=Desactivado" ) else ( set "SCREEN_OFF_FLAG=--turn-screen-off" & set "SCREEN_OFF_STATUS=Activado" )
call :save_config
echo  [✓] Pantalla apagada: !SCREEN_OFF_STATUS!
timeout /t 2 >nul
goto config

:quick_profiles
cls
echo ================================================
echo           PERFILES RAPIDOS RECOMENDADOS
echo ================================================
echo  [1] Ultra baja latencia ( 720 px  -  2M  - 60fps )
echo  [2] Muy Fluido          ( 800 px  -  3M )
echo  [3] Balanceado          (1024 px  -  4M )
echo  [4] Buena calidad       (1280 px  -  6M )
echo  [5] Alta calidad        (1600 px  -  8M )
echo  [6] Maxima calidad      (1920 px  - 12M )
echo  [7] Volver
echo ================================================
set /p "prof=  >  Selecciona perfil (1-7): "
set "prof=!prof: =!"
if "%prof%"=="1" (set "MAX_SIZE=720"  & set "VIDEO_BITRATE=2M" & set "MAX_FPS=60" & set "MAX_FPS_FLAG=--max-fps=60")
if "%prof%"=="2" (set "MAX_SIZE=800"  & set "VIDEO_BITRATE=3M" & set "MAX_FPS=" & set "MAX_FPS_FLAG=")
if "%prof%"=="3" (set "MAX_SIZE=1024" & set "VIDEO_BITRATE=4M" & set "MAX_FPS=" & set "MAX_FPS_FLAG=")
if "%prof%"=="4" (set "MAX_SIZE=1280" & set "VIDEO_BITRATE=6M" & set "MAX_FPS=" & set "MAX_FPS_FLAG=")
if "%prof%"=="5" (set "MAX_SIZE=1600" & set "VIDEO_BITRATE=8M" & set "MAX_FPS=" & set "MAX_FPS_FLAG=")
if "%prof%"=="6" (set "MAX_SIZE=1920" & set "VIDEO_BITRATE=12M" & set "MAX_FPS=" & set "MAX_FPS_FLAG=")
if "%prof%"=="7" goto config
call :save_config
echo  [✓] Perfil aplicado y guardado.
pause
goto config

:set_angle
set /p "newangle=  >  Nuevo angulo (0-359, Enter cancelar): "
if "!newangle!"=="" goto adv_video
set /a na=!newangle!
set "ANGLE_VALUE=!na!"
if !na! equ 0 ( set "ANGLE_FLAG=" ) else ( set "ANGLE_FLAG=--angle=!na!" )
call :save_config
echo  [✓] Rotacion: !na!°
pause
goto adv_video

:set_crop
set /p "newcrop=  >  Crop (ancho:alto:x:y): "
if "!newcrop!"=="" ( set "CROP=" & set "CROP_FLAG=" ) else ( set "CROP=!newcrop!" & set "CROP_FLAG=--crop=!newcrop!" )
call :save_config
echo  [✓] Crop actualizado.
pause
goto adv_video

:set_video_codec
set /p "newvcodec=  >  Codec (h264/h265/av1): "
if "!newvcodec!"=="" goto adv_video
set "VIDEO_CODEC_VALUE=!newvcodec!"
set "VIDEO_CODEC_FLAG=--video-codec=!newvcodec!"
call :save_config
echo  [✓] Video codec: !VIDEO_CODEC_VALUE!
pause
goto adv_video

:set_max_fps
set /p "newfps=  >  Max FPS: "
if "!newfps!"=="" ( set "MAX_FPS=" & set "MAX_FPS_FLAG=" ) else ( set "MAX_FPS=!newfps!" & set "MAX_FPS_FLAG=--max-fps=!newfps!" )
call :save_config
echo  [✓] Max FPS actualizado.
pause
goto adv_video

:set_video_buffer
set /p "newvbuf=  >  Video buffer (ms): "
if "!newvbuf!"=="" ( set "VIDEO_BUFFER=" & set "VIDEO_BUFFER_FLAG=" ) else ( set "VIDEO_BUFFER=!newvbuf!" & set "VIDEO_BUFFER_FLAG=--video-buffer=!newvbuf!" )
call :save_config
echo  [✓] Video buffer actualizado.
pause
goto adv_video

:toggle_fullscreen
if "%FULLSCREEN_STATUS%"=="Activado" ( set "FULLSCREEN_FLAG=" & set "FULLSCREEN_STATUS=Desactivado" ) else ( set "FULLSCREEN_FLAG=--fullscreen" & set "FULLSCREEN_STATUS=Activado" )
call :save_config
echo  [✓] Fullscreen: !FULLSCREEN_STATUS!
timeout /t 2 >nul
goto adv_video

:toggle_borderless
if "%BORDERLESS_STATUS%"=="Activado" ( set "BORDERLESS_FLAG=" & set "BORDERLESS_STATUS=Desactivado" ) else ( set "BORDERLESS_FLAG=--window-borderless" & set "BORDERLESS_STATUS=Activado" )
call :save_config
echo  [✓] Borderless: !BORDERLESS_STATUS!
timeout /t 2 >nul
goto adv_video

:toggle_always_on_top
if "%ALWAYS_ON_TOP_STATUS%"=="Activado" ( set "ALWAYS_ON_TOP_FLAG=" & set "ALWAYS_ON_TOP_STATUS=Desactivado" ) else ( set "ALWAYS_ON_TOP_FLAG=--always-on-top" & set "ALWAYS_ON_TOP_STATUS=Activado" )
call :save_config
echo  [✓] Always on top: !ALWAYS_ON_TOP_STATUS!
timeout /t 2 >nul
goto adv_video

:set_window_title
set /p "newtitle=  >  Titulo: "
if "!newtitle!"=="" ( set "WINDOW_TITLE=" & set "WINDOW_TITLE_FLAG=" ) else ( set "WINDOW_TITLE=!newtitle!" & set "WINDOW_TITLE_FLAG=--window-title=!newtitle!" )
call :save_config
echo  [✓] Titulo actualizado.
pause
goto adv_video

:set_window_geometry
set /p "wx=  >  X: "
if "!wx!"=="" ( set "WINDOW_X=" & set "WINDOW_X_FLAG=" ) else ( set "WINDOW_X=!wx!" & set "WINDOW_X_FLAG=--window-x=!wx!" )
set /p "wy=  >  Y: "
if "!wy!"=="" ( set "WINDOW_Y=" & set "WINDOW_Y_FLAG=" ) else ( set "WINDOW_Y=!wy!" & set "WINDOW_Y_FLAG=--window-y=!wy!" )
set /p "ww=  >  Ancho: "
if "!ww!"=="" ( set "WINDOW_WIDTH=" & set "WINDOW_WIDTH_FLAG=" ) else ( set "WINDOW_WIDTH=!ww!" & set "WINDOW_WIDTH_FLAG=--window-width=!ww!" )
set /p "wh=  >  Alto: "
if "!wh!"=="" ( set "WINDOW_HEIGHT=" & set "WINDOW_HEIGHT_FLAG=" ) else ( set "WINDOW_HEIGHT=!wh!" & set "WINDOW_HEIGHT_FLAG=--window-height=!wh!" )
call :save_config
echo  [✓] Geometria actualizada.
pause
goto adv_video

:toggle_no_window
if "%NO_WINDOW_STATUS%"=="Activado" ( set "NO_WINDOW_FLAG=" & set "NO_WINDOW_STATUS=Desactivado" ) else ( set "NO_WINDOW_FLAG=--no-window" & set "NO_WINDOW_STATUS=Activado" )
call :save_config
echo  [✓] No window: !NO_WINDOW_STATUS!
timeout /t 2 >nul
goto adv_video

:set_audio_bitrate
set /p "newbitrate=  >  Audio bitrate (ej: 128K): "
if "!newbitrate!"=="" goto adv_audio
set "AUDIO_BITRATE_VALUE=!newbitrate!"
set "AUDIO_BITRATE_FLAG=--audio-bit-rate=!newbitrate!"
call :save_config
echo  [✓] Audio bitrate: !AUDIO_BITRATE_VALUE!
pause
goto adv_audio

:set_audio_buffer
set /p "newbuffer=  >  Audio buffer (ms): "
if "!newbuffer!"=="" goto adv_audio
set "AUDIO_BUFFER_VALUE=!newbuffer!"
set "AUDIO_BUFFER_FLAG=--audio-buffer=!newbuffer!"
call :save_config
echo  [✓] Audio buffer: !AUDIO_BUFFER_VALUE! ms
pause
goto adv_audio

:set_audio_codec
set /p "newcodec=  >  Codec (opus/aac/flac/raw): "
if "!newcodec!"=="" goto adv_audio
set "AUDIO_CODEC_VALUE=!newcodec!"
set "AUDIO_CODEC_FLAG=--audio-codec=!newcodec!"
call :save_config
echo  [✓] Audio codec: !AUDIO_CODEC_VALUE!
pause
goto adv_audio

:set_audio_source
set /p "newasrc=  >  Audio source: "
if "!newasrc!"=="" goto adv_audio
set "AUDIO_SOURCE=!newasrc!"
set "AUDIO_SOURCE_FLAG=--audio-source=!newasrc!"
call :save_config
echo  [✓] Audio source: !AUDIO_SOURCE!
pause
goto adv_audio

:set_keyboard_mode
set /p "newkbd=  >  Modo teclado: "
if "!newkbd!"=="" goto adv_control
set "KEYBOARD_MODE=!newkbd!"
set "KEYBOARD_FLAG=--keyboard=!newkbd!"
call :save_config
echo  [✓] Keyboard mode: !KEYBOARD_MODE!
pause
goto adv_control

:set_mouse_mode
set /p "newmouse=  >  Modo raton: "
if "!newmouse!"=="" goto adv_control
set "MOUSE_MODE=!newmouse!"
set "MOUSE_FLAG=--mouse=!newmouse!"
call :save_config
echo  [✓] Mouse mode: !MOUSE_MODE!
pause
goto adv_control

:toggle_otg
if "%OTG_STATUS%"=="Activado" ( set "OTG_FLAG=" & set "OTG_STATUS=Desactivado" ) else ( set "OTG_FLAG=--otg" & set "OTG_STATUS=Activado" )
call :save_config
echo  [✓] OTG: !OTG_STATUS!
timeout /t 2 >nul
goto adv_control

:set_shortcut_mod
set /p "newmod=  >  Tecla MOD (lalt,lsuper,...): "
if "!newmod!"=="" goto adv_control
set "SHORTCUT_MOD=!newmod!"
set "SHORTCUT_MOD_FLAG=--shortcut-mod=!newmod!"
call :save_config
echo  [✓] Shortcut MOD: !SHORTCUT_MOD!
pause
goto adv_control

:toggle_show_touches
if "%SHOW_TOUCHES_STATUS%"=="Activado" ( set "SHOW_TOUCHES_FLAG=" & set "SHOW_TOUCHES_STATUS=Desactivado" ) else ( set "SHOW_TOUCHES_FLAG=--show-touches" & set "SHOW_TOUCHES_STATUS=Activado" )
call :save_config
echo  [✓] Show touches: !SHOW_TOUCHES_STATUS!
timeout /t 2 >nul
goto adv_control

:toggle_no_control
if "%NO_CONTROL_STATUS%"=="Activado" ( set "NO_CONTROL_FLAG=" & set "NO_CONTROL_STATUS=Desactivado" ) else ( set "NO_CONTROL_FLAG=--no-control" & set "NO_CONTROL_STATUS=Activado" )
call :save_config
echo  [✓] No control: !NO_CONTROL_STATUS!
timeout /t 2 >nul
goto adv_control

:toggle_power_off_on_close
if "%POWER_OFF_ON_CLOSE_STATUS%"=="Activado" ( set "POWER_OFF_ON_CLOSE_FLAG=" & set "POWER_OFF_ON_CLOSE_STATUS=Desactivado" ) else ( set "POWER_OFF_ON_CLOSE_FLAG=--power-off-on-close" & set "POWER_OFF_ON_CLOSE_STATUS=Activado" )
call :save_config
echo  [✓] Power off on close: !POWER_OFF_ON_CLOSE_STATUS!
timeout /t 2 >nul
goto adv_control

:set_time_limit
set /p "newlimit=  >  Limite (segundos): "
if "!newlimit!"=="" ( set "TIME_LIMIT=" & set "TIME_LIMIT_FLAG=" ) else ( set "TIME_LIMIT=!newlimit!" & set "TIME_LIMIT_FLAG=--time-limit=!newlimit!" )
call :save_config
echo  [✓] Time limit actualizado.
pause
goto adv_recording

:set_push_target
set /p "newpush=  >  Directorio push: "
if "!newpush!"=="" goto adv_other
set "PUSH_TARGET=!newpush!"
set "PUSH_TARGET_FLAG=--push-target=!newpush!"
call :save_config
echo  [✓] Push target actualizado.
pause
goto adv_other

:set_record_file
set /p "newrec=  >  Ruta archivo grabacion: "
if "!newrec!"=="" ( set "RECORD_FILE=" & set "RECORD_FLAG=" ) else ( set "RECORD_FILE=!newrec!" & set "RECORD_FLAG=--record=!newrec!" )
call :save_config
echo  [✓] Record file actualizado.
pause
goto adv_recording

:toggle_no_playback
if "%NO_PLAYBACK_STATUS%"=="Activado" ( set "NO_PLAYBACK_FLAG=" & set "NO_PLAYBACK_STATUS=Desactivado" ) else ( set "NO_PLAYBACK_FLAG=--no-playback" & set "NO_PLAYBACK_STATUS=Activado" )
call :save_config
echo  [✓] No playback: !NO_PLAYBACK_STATUS!
timeout /t 2 >nul
goto adv_recording

REM =============================================
REM DETECCIÓN AUTOMÁTICA DE IP VÍA ADB
REM =============================================
:detect_ip_auto
cls
color 0A
echo.
echo ================================================
echo      DETECTAR IP DEL DISPOSITIVO (via ADB)
echo ================================================
echo   Buscando dispositivo USB conectado...
"%ADB%" devices | findstr /i /r "device$" >nul
if errorlevel 1 (
    color 0E
    echo   [!] No se detecto ningun dispositivo USB.
    call :log_error "detect_ip_auto: ningun dispositivo USB"
    color 0A
    echo ================================================
    echo.
    pause
    goto misc_menu
)

echo   Obteniendo direccion IP del dispositivo...
set "detected_ip="

REM Método 1: ip route
for /f "tokens=9" %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell "ip route 2>/dev/null | grep wlan" 2^>nul') do (
    if "!detected_ip!"=="" (
        echo %%i | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
        if not errorlevel 1 set "detected_ip=%%i"
    )
)

REM Método 2: ip addr (si el primero falló)
if "!detected_ip!"=="" (
    for /f "tokens=2 delims=/ " %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell "ip addr show wlan0 2>/dev/null | grep inet " 2^>nul') do (
        if "!detected_ip!"=="" (
            echo %%i | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
            if not errorlevel 1 set "detected_ip=%%i"
        )
    )
)

if "!detected_ip!"=="" (
    color 0E
    echo   [!] No se pudo detectar la IP automaticamente.
    echo       Asegurate de que el WiFi este activo.
    call :log_error "detect_ip_auto: no se pudo detectar IP"
    color 0A
    echo ================================================
    echo.
    pause
    goto misc_menu
)

echo.
echo   [✓] IP detectada: !detected_ip!
echo ================================================
echo.
set /p "use_ip=  >  ¿Usar esta IP y agregar al historial? (S/N): "
if /i "!use_ip!"=="S" (
    call :update_history "!detected_ip!"
    echo  [✓] IP !detected_ip! agregada al historial.
)
echo.
pause
goto misc_menu

REM =============================================
REM DIAGNÓSTICO DE RED / PING
REM =============================================
:diagnose_net
cls
color 0A
echo.
echo ================================================
echo          DIAGNOSTICO DE RED Y CONECTIVIDAD
echo ================================================
call :choose_ip
if not defined selected_ip (
    echo No se selecciono IP. Cancelando.
    pause
    goto misc_menu
)

set "diag_ip=!selected_ip!"
echo.
echo   Realizando ping a !diag_ip! (4 paquetes)...
echo ------------------------------------------------
ping -n 4 !diag_ip!
echo ------------------------------------------------
echo   Verificando puerto ADB (!TCP_PORT!)...
"%ADB%" connect !diag_ip!:!TCP_PORT! >nul 2>&1
"%ADB%" devices | findstr /i "!diag_ip!" >nul 2>&1
if errorlevel 1 (
    echo   [!] El puerto ADB !TCP_PORT! no responde.
    echo       Activa el modo TCP/IP desde USB primero.
    call :log_error "diagnose_net: puerto !TCP_PORT! no responde en !diag_ip!"
) else (
    echo   [✓] ADB responde en !diag_ip!:!TCP_PORT!
)
echo ------------------------------------------------
echo   ADB version: !ADB_VERSION!
echo   scrcpy version: !SCRCPY_VERSION!
echo ================================================
echo.
pause
goto misc_menu

REM =============================================
REM TRANSFERENCIA DE ARCHIVOS / INSTALAR APK
REM =============================================
:file_transfer
cls
color 0A
echo.
echo ================================================
echo      TRANSFERENCIA DE ARCHIVOS / INSTALAR APK
echo ================================================
echo   [1]  Instalar APK (adb install)
echo   [2]  Enviar archivo al dispositivo (adb push)
echo   [3]  Recibir archivo del dispositivo (adb pull)
echo   [4]  Desinstalar aplicacion (adb uninstall)
echo   [0]  Volver al menu principal
echo ================================================
echo.
set /p "ftop=  >  Elige (0-4): "
set "ftop=!ftop: =!"

if "%ftop%"=="1" goto ft_install_apk
if "%ftop%"=="2" goto ft_push
if "%ftop%"=="3" goto ft_pull
if "%ftop%"=="4" goto ft_uninstall
if "%ftop%"=="0" goto misc_menu
goto file_transfer

:ft_install_apk
cls
echo.
echo ================================================
echo                 INSTALAR APK
echo ================================================
echo   Introduce la ruta completa al archivo .apk
echo   (o arrastralo aqui y presiona Enter)
echo ================================================
echo.
set /p "apk_path=  >  Ruta APK (Enter cancelar): "
if "!apk_path!"=="" goto file_transfer

REM Quitar comillas si el usuario las incluyó
set "apk_path=!apk_path:"=!"

if not exist "!apk_path!" (
    echo [AVISO] El archivo no existe: !apk_path!
    call :log_error "ft_install_apk: archivo no encontrado !apk_path!"
    pause
    goto file_transfer
)

echo.
echo  Instalando: !apk_path! ...
"%ADB%" !DEVICE_SERIAL_FLAG! install -r "!apk_path!"
if errorlevel 1 (
    color 0E
    echo [AVISO] Fallo al instalar el APK. Verifica que el dispositivo este conectado.
    call :log_error "ft_install_apk: fallo al instalar !apk_path!"
    color 0A
) else (
    echo [✓] APK instalado correctamente.
)
pause
goto file_transfer

:ft_push
cls
echo.
echo ================================================
echo          ENVIAR ARCHIVO AL DISPOSITIVO (push)
echo ================================================
echo   Directorio destino actual: !PUSH_TARGET!
echo ================================================
echo.
set /p "push_src=  >  Ruta del archivo local (Enter cancelar): "
if "!push_src!"=="" goto file_transfer
set "push_src=!push_src:"=!"

if not exist "!push_src!" (
    echo [AVISO] El archivo no existe: !push_src!
    pause
    goto file_transfer
)

set /p "push_dst=  >  Destino en dispositivo (Enter=!PUSH_TARGET!): "
if "!push_dst!"=="" set "push_dst=!PUSH_TARGET!"

echo.
echo  Enviando: !push_src! -> !push_dst!
"%ADB%" !DEVICE_SERIAL_FLAG! push "!push_src!" "!push_dst!"
if errorlevel 1 (
    color 0E
    echo [AVISO] Fallo al enviar el archivo.
    call :log_error "ft_push: fallo push !push_src! -> !push_dst!"
    color 0A
) else (
    echo [✓] Archivo enviado correctamente.
)
pause
goto file_transfer

:ft_pull
cls
echo.
echo ================================================
echo        RECIBIR ARCHIVO DEL DISPOSITIVO (pull)
echo ================================================
echo.
set /p "pull_src=  >  Ruta en el dispositivo (Enter cancelar): "
if "!pull_src!"=="" goto file_transfer

set /p "pull_dst=  >  Destino local (Enter=%BASE_DIR%): "
if "!pull_dst!"=="" set "pull_dst=!BASE_DIR!"

echo.
echo  Descargando: !pull_src! -> !pull_dst!
"%ADB%" !DEVICE_SERIAL_FLAG! pull "!pull_src!" "!pull_dst!"
if errorlevel 1 (
    color 0E
    echo [AVISO] Fallo al recibir el archivo.
    call :log_error "ft_pull: fallo pull !pull_src! -> !pull_dst!"
    color 0A
) else (
    echo [✓] Archivo recibido en: !pull_dst!
)
pause
goto file_transfer

:ft_uninstall
cls
echo.
echo ================================================
echo            DESINSTALAR APLICACION
echo ================================================
echo.
set /p "pkg_name=  >  Nombre del paquete (ej: com.example.app, Enter cancelar): "
if "!pkg_name!"=="" goto file_transfer

echo.
echo  Desinstalando: !pkg_name! ...
"%ADB%" !DEVICE_SERIAL_FLAG! uninstall "!pkg_name!"
if errorlevel 1 (
    color 0E
    echo [AVISO] Fallo al desinstalar. Verifica el nombre del paquete.
    call :log_error "ft_uninstall: fallo uninstall !pkg_name!"
    color 0A
) else (
    echo [✓] Aplicacion desinstalada correctamente.
)
pause
goto file_transfer

REM =============================================
REM CAPTURA DE PANTALLA RÁPIDA
REM =============================================
:screenshot_menu
cls
color 0A
echo.
echo ================================================
echo            CAPTURA DE PANTALLA (Screenshot)
echo ================================================
echo   Directorio de guardado: !SCREENSHOT_DIR!
echo.
echo   [1]  Captura rapida (nombre automatico)
echo   [2]  Captura con nombre personalizado
echo   [3]  Cambiar directorio de capturas
echo   [4]  Abrir directorio de capturas
echo   [0]  Volver
echo ================================================
echo.
set /p "ssopt=  >  Elige (0-4): "
set "ssopt=!ssopt: =!"

if "%ssopt%"=="1" goto ss_quick
if "%ssopt%"=="2" goto ss_named
if "%ssopt%"=="3" goto ss_change_dir
if "%ssopt%"=="4" start "" "!SCREENSHOT_DIR!" & goto screenshot_menu
if "%ssopt%"=="0" goto misc_menu
goto screenshot_menu

:ss_quick
cls
"%ADB%" devices | findstr /i /r "device$" >nul
if errorlevel 1 (
    color 0E
    echo [AVISO] No hay dispositivo ADB conectado.
    call :log_error "ss_quick: sin dispositivo ADB"
    color 0A
    pause
    goto screenshot_menu
)

REM Generar nombre con fecha/hora
set "ss_date=%date:~6,4%%date:~3,2%%date:~0,2%"
set "ss_time=%time:~0,2%%time:~3,2%%time:~6,2%"
set "ss_time=!ss_time: =0!"
set "ss_filename=screenshot_!ss_date!_!ss_time!.png"
set "ss_local=!SCREENSHOT_DIR!\!ss_filename!"

echo  Capturando pantalla...
"%ADB%" !DEVICE_SERIAL_FLAG! shell screencap -p /sdcard/tmp_scrcpy_ss.png >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! pull /sdcard/tmp_scrcpy_ss.png "!ss_local!" >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! shell rm /sdcard/tmp_scrcpy_ss.png >nul 2>&1

if exist "!ss_local!" (
    echo  [✓] Captura guardada: !ss_local!
) else (
    color 0E
    echo [AVISO] No se pudo guardar la captura.
    call :log_error "ss_quick: fallo al guardar captura"
    color 0A
)
pause
goto screenshot_menu

:ss_named
cls
"%ADB%" devices | findstr /i /r "device$" >nul
if errorlevel 1 (
    color 0E
    echo [AVISO] No hay dispositivo ADB conectado.
    color 0A
    pause
    goto screenshot_menu
)

set /p "ss_custom=  >  Nombre de archivo (sin .png, Enter cancelar): "
if "!ss_custom!"=="" goto screenshot_menu
set "ss_local=!SCREENSHOT_DIR!\!ss_custom!.png"

echo  Capturando pantalla...
"%ADB%" !DEVICE_SERIAL_FLAG! shell screencap -p /sdcard/tmp_scrcpy_ss.png >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! pull /sdcard/tmp_scrcpy_ss.png "!ss_local!" >nul 2>&1
"%ADB%" !DEVICE_SERIAL_FLAG! shell rm /sdcard/tmp_scrcpy_ss.png >nul 2>&1

if exist "!ss_local!" (
    echo  [✓] Captura guardada: !ss_local!
) else (
    color 0E
    echo [AVISO] No se pudo guardar la captura.
    call :log_error "ss_named: fallo al guardar !ss_local!"
    color 0A
)
pause
goto screenshot_menu

:ss_change_dir
set /p "new_ss_dir=  >  Nuevo directorio de capturas (Enter cancelar): "
if "!new_ss_dir!"=="" goto screenshot_menu
set "new_ss_dir=!new_ss_dir:"=!"
set "SCREENSHOT_DIR=!new_ss_dir!"
if not exist "!SCREENSHOT_DIR!" mkdir "!SCREENSHOT_DIR!" >nul 2>&1
call :save_config
echo  [✓] Directorio de capturas actualizado: !SCREENSHOT_DIR!
pause
goto screenshot_menu

REM =============================================
REM INFORMACIÓN DEL DISPOSITIVO (CORREGIDO v2 - SIN ERRORES)
REM =============================================
:device_info
cls
color 0A
echo.
echo ================================================
echo              INFORMACION DEL DISPOSITIVO
echo ================================================
"%ADB%" devices 2>nul | findstr /i /r "device$" >nul
if errorlevel 1 (
    color 0E
    echo   [!] No hay dispositivo ADB conectado.
    echo ================================================
    color 0A
    pause
    goto misc_menu
)

REM --- Variables temporales ---
set "model="
set "manu="
set "android="
set "sdk="
set "build="
set "battery_level=?"
set "res="
set "dpi="
set "tempfile=%TEMP%\scrcpy_dev_info.tmp"

REM --- Obtener propiedades básicas (funcionan bien) ---
for /f "delims=" %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell getprop ro.product.model 2^>nul') do set "model=%%i"
for /f "delims=" %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell getprop ro.product.manufacturer 2^>nul') do set "manu=%%i"
for /f "delims=" %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell getprop ro.build.version.release 2^>nul') do set "android=%%i"
for /f "delims=" %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell getprop ro.build.version.sdk 2^>nul') do set "sdk=%%i"
for /f "delims=" %%i in ('"%ADB%" !DEVICE_SERIAL_FLAG! shell getprop ro.build.display.id 2^>nul') do set "build=%%i"

REM --- Obtener nivel de batería (robusto con archivo temporal) ---
"%ADB%" !DEVICE_SERIAL_FLAG! shell dumpsys battery > "%tempfile%" 2>nul
for /f "tokens=2 delims=: " %%a in ('type "%tempfile%" ^| findstr /i "level:"') do set "battery_level=%%a"
if "!battery_level!"=="?" (
    for /f "tokens=2 delims==" %%a in ('type "%tempfile%" ^| findstr /i "level="') do set "battery_level=%%a"
)
if "!battery_level!"=="?" (
    for /f "tokens=*" %%a in ('type "%tempfile%" ^| findstr /i "level"') do (
        set "line=%%a"
        for /f "tokens=2 delims=:=" %%b in ("!line!") do set "battery_level=%%b"
    )
)
for /f "tokens=1 delims= " %%a in ("!battery_level!") do set "battery_level=%%a"

REM --- Obtener resolución (wm size) usando archivo temporal ---
"%ADB%" !DEVICE_SERIAL_FLAG! shell wm size > "%tempfile%" 2>nul
for /f "tokens=*" %%a in ('type "%tempfile%" ^| findstr /r "[0-9][0-9]*x[0-9][0-9]*"') do (
    set "line=%%a"
    for /f "tokens=3 delims=: " %%b in ("!line!") do set "res=%%b"
    if "!res!"=="" for /f "tokens=2 delims=: " %%b in ("!line!") do set "res=%%b"
)
if "!res!"=="" (
    for /f "tokens=*" %%a in ('type "%tempfile%"') do set "line=%%a"
    if "!line!" neq "" (
        for /f "tokens=2 delims=:" %%b in ("!line!") do set "res=%%b"
        for /f "tokens=1" %%c in ("!res!") do set "res=%%c"
    )
)

REM --- Obtener densidad DPI (wm density) usando archivo temporal ---
"%ADB%" !DEVICE_SERIAL_FLAG! shell wm density > "%tempfile%" 2>nul
for /f "tokens=*" %%a in ('type "%tempfile%" ^| findstr /r "[0-9][0-9]*"') do (
    set "line=%%a"
    for /f "tokens=3 delims=: " %%b in ("!line!") do set "dpi=%%b"
    if "!dpi!"=="" for /f "tokens=2 delims=: " %%b in ("!line!") do set "dpi=%%b"
)
if "!dpi!"=="" (
    for /f "tokens=*" %%a in ('type "%tempfile%"') do set "line=%%a"
    if "!line!" neq "" (
        for /f "tokens=2 delims=:" %%b in ("!line!") do set "dpi=%%b"
        for /f "tokens=1" %%c in ("!dpi!") do set "dpi=%%c"
    )
)

REM Eliminar archivo temporal
del "%tempfile%" >nul 2>&1

REM --- Mostrar resultados ---
echo   Modelo         : 
echo                     !model!
echo   Fabricante     : 
echo                     !manu!
echo   Android        : 
echo                     !android!
echo   SDK            : 
echo                     !sdk!
echo   Build          : 
echo                     !build!
echo   Bateria (%%)   : !battery_level!
echo   Resolucion     : 
if defined res (echo                     !res!) else (echo                     No detectada)
echo   Densidad DPI   : 
if defined dpi (echo                     !dpi!) else (echo                     No detectada)
echo.
echo   --- Herramientas ---
echo   scrcpy v: !SCRCPY_VERSION!
echo   adb v   : !ADB_VERSION!
echo ================================================
echo.
pause
goto misc_menu

REM =============================================
REM SELECCIONAR DISPOSITIVO (MULTI-ADB)
REM =============================================
:select_device
cls
color 0D
echo.
echo ================================================
echo        SELECCIONAR DISPOSITIVO (Multi-ADB)
echo ================================================
echo   Dispositivos actualmente conectados:
echo.
"%ADB%" devices -l
echo.
echo   Dispositivo actualmente seleccionado:
if "!DEVICE_SERIAL!"=="" (
    echo   Auto (primer dispositivo disponible)
) else (
    echo   !DEVICE_SERIAL!
)
echo.
echo ------------------------------------------------
echo   [1]  Ingresar serial / IP:puerto manualmente
echo   [2]  Limpiar seleccion (volver a auto)
echo   [0]  Volver
echo ================================================
echo.
set /p "seldev=  >  Elige (0-2): "
set "seldev=!seldev: =!"

if "%seldev%"=="1" goto select_device_manual
if "%seldev%"=="2" goto select_device_clear
if "%seldev%"=="0" goto misc_menu
goto select_device

:select_device_manual
set /p "new_serial=  >  Serial o IP:puerto (Enter cancelar): "
if "!new_serial!"=="" goto select_device
set "DEVICE_SERIAL=!new_serial!"
set "DEVICE_SERIAL_FLAG=-s !new_serial!"
call :save_config
echo  [✓] Dispositivo fijado: !DEVICE_SERIAL!
pause
goto misc_menu

:select_device_clear
set "DEVICE_SERIAL="
set "DEVICE_SERIAL_FLAG="
call :save_config
echo  [✓] Seleccion de dispositivo limpiada. Modo auto activo.
pause
goto misc_menu

REM =============================================
REM EXPORTAR / IMPORTAR CONFIGURACIÓN
REM =============================================
:export_import_config
cls
color 0D
echo.
echo ================================================
echo        EXPORTAR / IMPORTAR CONFIGURACION
echo ================================================
echo   [1]  Exportar configuracion actual a archivo externo
echo   [2]  Importar configuracion desde archivo externo
echo   [3]  Restaurar desde backup automatico
echo   [4]  Ver ruta del archivo de configuracion actual
echo   [0]  Volver
echo ================================================
echo.
set /p "eiop=  >  Elige (0-4): "
set "eiop=!eiop: =!"

if "%eiop%"=="1" goto ei_export
if "%eiop%"=="2" goto ei_import
if "%eiop%"=="3" goto ei_restore_backup
if "%eiop%"=="4" (echo   Ruta: %CONFIG_FILE% & pause & goto export_import_config)
if "%eiop%"=="0" goto misc_menu
goto export_import_config

:ei_export
cls
echo.
set /p "export_path=  >  Ruta de destino del archivo (Enter=%BASE_DIR%\config_export.txt): "
if "!export_path!"=="" set "export_path=!BASE_DIR!\config_export.txt"
set "export_path=!export_path:"=!"

if not exist "%CONFIG_FILE%" (
    echo [AVISO] No hay configuracion guardada para exportar.
    pause
    goto export_import_config
)

copy /y "%CONFIG_FILE%" "!export_path!" >nul 2>&1
if errorlevel 1 (
    color 0E
    echo [AVISO] No se pudo exportar la configuracion.
    call :log_error "ei_export: fallo al exportar a !export_path!"
    color 0D
) else (
    echo [✓] Configuracion exportada a: !export_path!
)
pause
goto export_import_config

:ei_import
cls
echo.
set /p "import_path=  >  Ruta del archivo de configuracion a importar (Enter cancelar): "
if "!import_path!"=="" goto export_import_config
set "import_path=!import_path:"=!"

if not exist "!import_path!" (
    echo [AVISO] El archivo no existe: !import_path!
    pause
    goto export_import_config
)

set /p "confirm_import=  >  ¿Importar esta configuracion? Esto reemplazara la actual. (S/N): "
if /i not "!confirm_import!"=="S" goto export_import_config

REM Hacer backup antes de importar
copy /y "%CONFIG_FILE%" "%BACKUP_FILE%" >nul 2>&1

copy /y "!import_path!" "%CONFIG_FILE%" >nul 2>&1
if errorlevel 1 (
    color 0E
    echo [AVISO] No se pudo importar la configuracion.
    call :log_error "ei_import: fallo al importar desde !import_path!"
    color 0D
) else (
    echo [✓] Configuracion importada. Reinicia el script para aplicar los cambios.
)
pause
goto export_import_config

:ei_restore_backup
cls
echo.
if not exist "%BACKUP_FILE%" (
    echo [AVISO] No hay backup disponible.
    pause
    goto export_import_config
)

set /p "confirm_restore=  >  ¿Restaurar configuracion desde backup automatico? (S/N): "
if /i not "!confirm_restore!"=="S" goto export_import_config

copy /y "%BACKUP_FILE%" "%CONFIG_FILE%" >nul 2>&1
if errorlevel 1 (
    color 0E
    echo [AVISO] No se pudo restaurar el backup.
    call :log_error "ei_restore_backup: fallo al restaurar"
    color 0D
) else (
    echo [✓] Configuracion restaurada desde backup. Reinicia el script para aplicar.
)
pause
goto export_import_config

REM =============================================
REM FIN DEL SCRIPT
REM =============================================
:end
popd >nul 2>&1
endlocal
exit /b 0

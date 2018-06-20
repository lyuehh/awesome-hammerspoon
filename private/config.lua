-- Specify Spoons which will be loaded
hspoon_list = {
    "AClock",
    "BingDaily",
    -- "Calendar",
    "CircleClock",
    "ClipShow",
    "CountDown",
    "FnMate",
    "HCalendar",
    -- "HSaria2",
    "HSearch",
    -- "KSheet",
    "SpeedMenu",
    -- "TimeFlow",
    -- "UnsplashZ",
    "WinWin",
}

-- appM environment keybindings. Bundle `id` is prefered, but application `name` will be ok.
hsapp_list = {
    {key = 'q', name = 'QQ'},
    {key = 'g', id = 'com.google.Chrome'},
    {key = 'r', name = 'Safari'},
    {key = 'b', name = 'Mail'},
    {key = 'x', name = 'xScope'},
    {key = 's', name = 'Skim'},
    {key = 'f', name = 'firefox'},
    {key = 'u', name = 'iTerm'},
    {key = 'e', name = 'Evernote'},
    {key = 'n', name = 'Finder'},
    {key = 'k', name = 'Dash'},
    {key = 'v', id = 'com.apple.ActivityMonitor'},
    {key = 'y', id = 'com.apple.systempreferences'},
}

-- Modal supervisor keybinding, which can be used to temporarily disable ALL modal environments.
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- Reload Hammerspoon configuration
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- Toggle help panel of this configuration.
hshelp_keys = {{"alt", "shift"}, "/"}

-- aria2 RPC host address
hsaria2_host = "http://localhost:6800/jsonrpc"
-- aria2 RPC host secret
hsaria2_secret = "token"

----------------------------------------------------------------------------------------------------
-- Those keybindings below could be disabled by setting to {"", ""} or {{}, ""}

-- Window hints keybinding: Focuse to any window you want
hswhints_keys = {"alt", "tab"}

-- appM environment keybinding: Application Launcher
hsappM_keys = {"alt", "A"}

-- clipshowM environment keybinding: System clipboard reader
hsclipsM_keys = {"alt", "C"}

-- Toggle the display of aria2 frontend
hsaria2_keys = {"alt", "D"}

-- Launch Hammerspoon Search
hsearch_keys = {"alt", "G"}

-- Read Hammerspoon and Spoons API manual in default browser
hsman_keys = {"alt", "H"}

-- countdownM environment keybinding: Visual countdown
hscountdM_keys = {"alt", "I"}

-- Lock computer's screen
-- hslock_keys = {"alt", "L"}

-- resizeM environment keybinding: Windows manipulation
hsresizeM_keys = {"alt", "R"}

-- cheatsheetM environment keybinding: Cheatsheet copycat
hscheats_keys = {"alt", "S"}

-- Show digital clock above all windows
hsaclock_keys = {"alt", "T"}

-- Type the URL and title of the frontmost web page open in Google Chrome or Safari.
hstype_keys = {"alt", "V"}

-- Toggle Hammerspoon console
hsconsole_keys = {"alt", "Z"}


-- my window keys
local hyper = {'alt', 'cmd'}
local hyperCtrl = {'ctrl', 'alt', 'cmd'}

hs.hotkey.bind(hyper, "right", function() resize(1, 0, 2, 1) end)
hs.hotkey.bind(hyper, "left", function() resize(0, 0, 2, 1) end)
hs.hotkey.bind(hyper, "up", function() fullscreen() end)
hs.hotkey.bind(hyper, "down", function() center() end)
-- hs.hotkey.bind(hyper, "down", function() resize(0, 1, 1, 2) end)
-- hs.hotkey.bind(hyper, "up", function() resize(0, 0, 1, 2) end)
-- hs.hotkey.bind(hyper, "a", function() resize(0, 0, 1, 1) end)

hs.hotkey.bind(hyper, "1", function() resize(0, 0, 2, 2) end)
hs.hotkey.bind(hyper, "2", function() resize(1, 0, 2, 2) end)


hs.hotkey.bind(hyperCtrl, "right", function() hs.window.focusedWindow():moveOneScreenEast(0) end)
hs.hotkey.bind(hyperCtrl, "left", function() hs.window.focusedWindow():moveOneScreenWest(0) end)

-- hs.hotkey.bind(hyperCtrl, "l", function() hs.caffeinate.lockScreen(); end)
-- use Cmd + Ctrl + Q
hs.hotkey.bind(hyperCtrl, "e", function() hs.applescript.applescript('tell app \"Finder\" to empty the trash') end)
-- hs.hotkey.bind(hyperCtrl, "s", function() hs.caffeinate.startScreensaver() end)

-- Hints
hs.hotkey.bind(hyper, "h", function() hs.hints.windowHints() end)

-- pomodoro key binding
-- hs.hotkey.bind(hyper, '9', function() pom_enable() end)
-- hs.hotkey.bind(hyper, '0', function() pom_disable() end)

function tolerance(a, b) return math.abs(a - b) < 32 end

function resize(x, y, w, h)
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()
    local ww = max.w / w
    local hh = max.h / h
    local xx = max.x + (x * ww)
    local yy = max.y + (y * hh)

    if tolerance(f.x, xx) and tolerance(f.y, yy) and tolerance(f.w, ww) and tolerance(f.h, hh) then
        if w > h then
            x = (x + 1) % w
            elseif h > w then
                y = (y + 1) % h
            else
                x = (x == 0) and 0.9999 or 0
                y = (y == 0) and 0.9999 or 0
            end
            return resize(x, y, w, h)
        end
        f.x = xx
        f.y = yy
        f.w = ww
        f.h = hh
        return win:setFrame(f)
end

function fullscreen()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    f.x = max.x
    f.w = max.w
    f.y = max.y
    f.h = max.h
    win:setFrame(f)
end

function center()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()
    f.x = 150
    f.y = 150
    f.w = max.w / 8 * 6
    f.h = max.h / 8 * 6
    win:setFrame(f)
end


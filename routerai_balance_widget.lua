-- name = "RouterAI Balance"
-- type = "widget"
-- description = "Shows your RouterAI credit balance"

-- URL and endpoint
local API_URL = "https://routerai.ru/api/v1/credits"

-- Load / create the preference key for the token
prefs = prefs or {}
prefs.token = prefs.token or ""

-- Triggered when the widget first loads and on alarm refresh
function on_alarm()
    if prefs.token == "" or prefs.token == nil then
        ui:show_text("⚠️ No token set\nTap to configure")
    else
        ui:show_text("⏳ Loading...")
        -- Set the auth header for the next request
        http:set_headers({
            "Authorization: Bearer " .. prefs.token,
            "Accept: application/json"
        })
        http:get(API_URL, "balance")
    end
end

-- Called automatically when the network request returns
function on_network_result(body, code, id)
    if id ~= "balance" then return end

    if code ~= 200 or body == nil or body == "" then
        ui:show_text("❌ Error " .. tostring(code))
        return
    end

    local json = require "json"
    local ok, data = pcall(json.decode, body)

    if not ok or not data then
        ui:show_text("❌ JSON error")
        return
    end

    -- RouterAI returns credits as a plain number (float / int)
    local balance = data.credits or data.balance or data

    -- If the response itself is just a number, `data` is it.
    if type(data) == "number" then
        balance = data
    end

    if type(balance) == "number" then
        ui:show_text("🪙 " .. tostring(balance))
    else
        ui:show_text("⚠️ Unexpected format")
    end
end

-- Tap the widget to open settings so you can paste your Bearer token
function on_click()
    prefs:show_dialog()
end

-- Optional: refresh on resume too
function on_resume()
    on_alarm()
end

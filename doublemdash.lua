-- Pandoc Lua filter to create double em-dash with controlled spacing
-- Uses individual spans for each em-dash with margin to pull them together

function Inlines(inlines)
  local result = {}
  local i = 1

  while i <= #inlines do
    -- Look for consecutive em-dashes in a single Str element (e.g., "——" or "——.")
    if inlines[i].t == "Str" and inlines[i].text:match("——") then
      local before, after = inlines[i].text:match("(.*)——(.*)")

      -- Add the "before" part if it exists
      if before and before ~= "" then
        table.insert(result, pandoc.Str(before))
      end

      -- Add two em-dashes: first normal, second with negative margin to pull it left
      table.insert(result, pandoc.RawInline('html', '<span style="display: inline-block;">—<span style="margin-left: -0.1em;">—</span></span>'))

      -- Add the "after" part if it exists
      if after and after ~= "" then
        table.insert(result, pandoc.Str(after))
      end

      i = i + 1
    else
      table.insert(result, inlines[i])
      i = i + 1
    end
  end

  return result
end

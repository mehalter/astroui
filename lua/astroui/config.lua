-- AstroNvim UI Configuration
--
-- This module simply defines the configuration table structure for `opts` used in:
--
--    require("astroui").setup(opts)
--
-- copyright 2023
-- license GNU General Public License v3.0

---@alias StringMap table<string,string>
---@alias AstroUIIconHighlight (fun(self:table):boolean)|boolean

---@class AstroUIFileIconHighlights
---@field tabline AstroUIIconHighlight? enable or disabling file icon highlighting in the tabline
---@field statusline AstroUIIconHighlight? enable or disable file icon highlighting in the statusline

---@class AstroUIIconHighlights
---@field breadcrumbs AstroUIIconHighlight? enable or disable breadcrumb icon highlighting
---Enable or disable the highlighting of filetype icons both in the statusline and tabline
---Example:
---
---```lua
---file_icon = {
---  tabline = function(self) return self.is_active or self.is_visible end,
---  statusline = true,
---}
---```
---@field file_icon AstroUIFileIconHighlights?

---@class AstroUISeparators
---@field none string[]? placeholder separator for elements with "no" separator, typically two empty strings
---@field left string[]? Separators used for elements designated as being on the left of the statusline
---@field right string[]? Separators used for elements designated as being on the right of the statusline
---@field center string[]? Separators used for elements designated as being in the center of the statusline
---@field tab string[]? Separators used for tabs rendered in the tabline
---@field breadcrumbs string? Separator used in between symbols in the breadcrumbs
---@field path string? Separator used in between symbols in a file path

---@class AstroUIStatusOpts
---Configure attributes of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names, this applies to colors that have `_fg` and/or `_bg` names with the suffix removed (ex. `git_branch_fg` as attributes from `git_branch`).
---Example:
---
---```lua
---attributes = {
---  git_branch = { bold = true },
---}
---```
---@field attributes table<string,table>?
---**MEANT FOR INTERNAL USE ONLY**
---A table of functions used for matching buffers to various attributes
---@field buf_matchers table<string,fun(pattern_list:string[],bufnr:integer):boolean>?
---Configure colors of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names.
---Example:
---
---```lua
---colors = {
---  git_branch_fg = "#ABCDEF",
---}
---```
---@field colors (StringMap|(fun(colors:StringMap):StringMap))?
---**MEANT FOR INTERNAL USE ONLY**
---A table of fallback colors if a colorscheme used by the user does not have a highlight group, the entry point to this are typically through the `status.colors` option.
---@field fallback_colors StringMap?
---Configure which icons that are highlighted based on context
---Example:
---
---```lua
---icon_highlights = {
---  breadcrumbs = false,
---  file_icon = {
---    tabline = function(self) return self.is_active or self.is_visible end,
---    statusline = true,
---  }
---}
---```
---@field icon_highlights AstroUIIconHighlights?
---**MEANT FOR INTERNAL USE ONLY**
---Conversion table of vim mode text to readable text and color name to be used
---Example:
---
---```lua
---modes = {
---  ["n"] = {
---    "NORMAL", -- readable name
---    "normal", -- color name
---  },
---  ["no"] = {
---    "OP",     -- readable name
---    "normal", -- color name
---  }
---}
---```
---@field modes table<string,string[]>?
---Configure characters used as separators for various elements
---Example:
---
---```lua
---separators = {
---  none = { "", "" },
---  left = { "", "  " },
---  right = { "  ", "" },
---  center = { "  ", "  " },
---  tab = { "", "" },
---  breadcrumbs = "  ",
---  path = "  ",
---}
---```
---@field separators AstroUISeparators?
---**MEANT FOR INTERNAL USE ONLY**
---Function used for setting up colors in Heirline, the entry point to this are typically through the `status.colors` option.
---@field setup_colors (fun():table)?
---**MEANT FOR INTERNAL USE ONLY**
---A collection of click handlers for internal heirline components such as `gitsigns`, `diagnostics`, and `dap`
---@field sign_handlers table<string,fun(args:table)>?

---@class AstroUIOpts
---Colorscheme set on startup, a string that is used with `:colorscheme astrodark`
---Example:
---
---```lua
---colorscheme = "astrodark"
---```
---@field colorscheme string?
---Override highlights in any colorscheme
---Keys can be:
---  `init`: table of highlights to apply to all colorschemes
---  `<colorscheme_name>` override highlights in the colorscheme with name: `<colorscheme_name>`
---Example:
---
---```lua
---highlights = {
---     -- this table overrides highlights in all colorschemes
---     init = {
---       Normal = { bg = "#000000" },
---     },
---     -- a table of overrides/changes when applying astrotheme
---     astrotheme = {
---       Normal = { bg = "#000000" },
---     },
---}
---```
---@field highlights  table<string,(table<string,table>|fun():table<string,table>)>?
---A table of icons in the UI using NERD fonts
---Example:
---
---```lua
---icons = {
---  GitAdd = "",
---}
---```
---@field icons StringMap?
--- A table of only text "icons" used when icons are disabled
---Example:
---
---```lua
---text_icons = {
---  GitAdd = "[+]",
---}
---```
---@field text_icons StringMap?
---Configuration options for the AstroNvim lines and bars built with the `status` API.
---Example:
---
---```lua
---status = {
---  attributes = {
---    git_branch = { bold = true },
---  },
---  colors = {
---    git_branch_fg = "#ABCDEF",
---  },
---  icon_highlights = {
---    breadcrumbs = false,
---    file_icon = {
---      tabline = function(self) return self.is_active or self.is_visible end,
---      statusline = true
---    }
---  },
---  separators = {
---    tab = { "", "" }
---  }
---}
---```
---@field status AstroUIStatusOpts?

---@type AstroUIOpts
local M = {
  colorscheme = nil,
  highlights = {},
  icons = {},
  text_icons = {},
  status = {
    attributes = {},
    buf_matchers = {},
    colors = {},
    fallback_colors = {},
    icon_highlights = {},
    modes = {},
    separators = {},
    setup_colors = nil,
    sign_handlers = {},
  },
}

return M

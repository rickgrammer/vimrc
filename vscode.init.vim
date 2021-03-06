{
    "editor.minimap.enabled": false,
    "editor.lineNumbers": "relative",
    "editor.scrollBeyondLastLine": true,
    "vim.leader": "<space>",
    "vim.hlsearch": true,
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": ["leader", "n"],
            "commands": [
                ":nohls"
            ]
        },
        {
            "before": ["leader", "r"],
            "commands": [
                ":set relativenumber!"
            ]
        },
        {
            "before": ["leader", "k"],
            "after": [
                "m", "i", "O", "<Esc>", "0", "D", "`", "i"
            ]
        },
        {
            "before": ["leader", "j"],
            "after": [
                "m", "i", "o", "<Esc>", "0", "D", "`", "i"
            ]
        }
    ],
    "emmet.showAbbreviationSuggestions": true,
    "emmet.showExpandedAbbreviation": "always",
    "emmet.includeLanguages": {
        "vue-html": "html",
        "vue": "html"
    },
    "vim.insertModeKeyBindings": [
        {
            "before": ["j", "k"],
            "after": ["<Esc>"]
        }
    ],
    "files.autoSave": "afterDelay",
    "explorer.confirmDelete": false,
    "window.zoomLevel": -1,
    "editor.cursorBlinking": "solid",
    "vim.useSystemClipboard": true
}

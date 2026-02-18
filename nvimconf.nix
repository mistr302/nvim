lib: {
  # TODO: modularize
  # configure dashboard
  vim = {
    theme = {
      enable = true;
      name = "dracula";
      # style = "dark" # Type: one of “dark”, “darker”, “cool”, “deep”, “warm”, “warmer”
      # transparent = true;
    };
    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      # providers.wl-copy.package = pkgs.wl-clipboard;
      registers = "unnamedplus";
    };
    options = {
      tabstop = 4; # Width of tab character
      shiftwidth = 4; # Size of indentation
      softtabstop = 4; # Spaces inserted when pressing <Tab>
      expandtab = true; # Convert tabs to spaces
    };
    # lsp settings
    lsp = {
      enable = true;
      inlayHints.enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };
    languages = {
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix.enable = true;
      rust.enable = true;
      markdown.enable = true;
      python.enable = true;
      bash.enable = true;
      clang.enable = true;
    };
    autocomplete = {
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        mappings.confirm = "<C-;>";
      };
    };
    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
        signs = true;
        update_in_insert = false;
      };
    };
    # Fuzzy‑finder & filetree
    telescope.enable = true;
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        window = {
          position = "left";
          width = 35;
          mappings = {
            l = "open"; # Map 'l' to open files/directories
          };
        };
        filesystem = {
          filtered_items = {
            # TODO: if i figure out how to toggle ts would be great
            hide_dotfiles = false; # Show hidden files
            hide_gitignored = false; # Hide gitignored files
          };
        };
        git_status = {
          show_untracked = true; # Show untracked files
        };
      };
    };
    # Movement utilities
    utility.motion.flash-nvim = {
      enable = true;
    };
    # Tabs
    tabline.nvimBufferline = {
      enable = true;
      mappings = {
        cycleNext = "<S-l>";
        cyclePrevious = "<S-h>";
        moveNext = "<C-S-l>";
        movePrevious = "<C-S-h>";
        closeCurrent = "<C-q>";
      };
      setupOpts.options = {
        diagnostics = false;
        buffer_close_icon = ""; # or set to "" if you don’t want it
        close_icon = ""; # same here
        modified_icon = "●"; # shown when buffer is unsaved
        max_name_length = 18;
        tab_size = 18;
        numbers = "none";
        indicator.style = "none";
      };
    };
    # mappings for window change
    luaConfigPost = lib.mkAfter ''
      -- Stop replacing default register on paste in visual mode
      vim.keymap.set('x', 'p', '"_dP', { noremap = true, silent = true })

      -- Don't yank deleted character when pressing x
      vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })
      vim.keymap.set('x', 'x', '"_x', { noremap = true, silent = true })

      -- Window movement mapping
      vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap=true, silent=true })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap=true, silent=true })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap=true, silent=true })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap=true, silent=true })

      -- Neotree toggle
      vim.keymap.set("n", "<space>e", "<Cmd>Neotree toggle<CR>")

      -- dont exit visual mode when indenting/unindenting
      vim.keymap.set("x", "<", "<gv")
      vim.keymap.set("x", ">", ">gv")

      --  Shift+Tab to unindent
      vim.keymap.set("x", "<S-Tab>", "<gv")
      vim.keymap.set("i", "<S-Tab>", "<C-D>")
    '';

    git = {
      enable = true;
      # to see commit changes
      gitsigns.enable = true;
    };

    # visual settings
    statusline.lualine.enable = true;
    visuals = {
      nvim-web-devicons.enable = true; # file‑type icons
      indent-blankline.enable = true; # guideline columns
      nvim-cursorline.enable = true; # highlight current line
    };
    notes.todo-comments.enable = true;
    notes.todo-comments.mappings.telescope = "<space>ft";
    # to see the options when pressing a key
    binds.whichKey.enable = true;
    # commenting code
    comments.comment-nvim.enable = true;
    # notifications
    notify.nvim-notify.enable = true;
    ui.noice.enable = true;
  };
}

{ ... }: {
  home-manager.users.tom = {
    imports = [ ./plugins ./set.nix ];
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      clipboard.register = "unnamedplus";
      colorschemes.catppuccin.enable = true;

      plugins = {
        auto-save.enable = true;
        web-devicons.enable = true;
        presence-nvim = {
          enable = true;
          mainImage = "file";
        };
        bufferline = {
          enable = true;
          settings.options.separator_style = "slope";
        };
        treesitter = {
          enable = true;
          settings.indent.enable = true;
          nixvimInjections = true;
        };
        treesitter-context.enable = true;
        nvim-tree = {
          enable = true;
          renderer.groupEmpty = true;
        };
        lualine.enable = true;
      };

      keymaps = [
        {
          mode = "n";
          key = "<C-n>";
          action = "<cmd>NvimTreeToggle<CR>";
        }
        {
          mode = "n";
          key = "<leader>rn";
          action = ":IncRename ";
        }
        {
          mode = "n";
          key = "<Tab>";
          action = "<cmd>bnext<CR>";
        }
        {
          mode = "n";
          key = "<leader>x";
          action = "<cmd>bd<CR><cmd>bprevious<CR>";
        }
      ];
    };
  };
}

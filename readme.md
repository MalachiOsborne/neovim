step 1: make an nvim dir inside .config
step 2: in the shell, do 'nvim .' after cding into .config/nvim
step 3: d to make a directory/ % to make a file
step 4: make an init.lua inside .config/nvim using %
step 5: 'Ex' opens the explorer
step 6: write a print statement (without semicolons) and use ':so' to test (stands for source
step 7: inside the explorer, make a lua dir then a config dir then a options.lua file
step 8: have the init.lua point to the options.lua file by doing ':e init.lua' inside the options file
step 9: do 'require('config.options')' inside init.lua
step 10: do the same thing but make a 'keybinds.lua' file for keybinds so as to separate the configuration (% in :Ex then :e inside keybinds.lua to link to init.lua)
step 11: make a lazy.lua file along with the keybinds.lua and options.lua
step 12: go to the website 'lazy.folke.io/installation' and copy the installation block (removing the keybinds) then linking the file as previously mentioned
step 13: read some of the comments in 'nvim/lua/config/plugins/colours.lua' (i don't really know what's happening)

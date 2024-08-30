return {
  '0x00-ketsu/autosave.nvim',
  -- lazy-loading on events
  event = { 'BufLeave' },
  config = function()
    require('autosave').setup {

      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      write_all_buffers = true,
      on_off_commands = true,
      debounce_delay = 0,
    }
  end,
}

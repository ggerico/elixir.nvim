function! s:RequireElixirHost(host)
  try
    let channel_id = rpcstart(globpath(&rtp, 'tools/nvim_elixir_host'),[])
    if rpcrequest(channel_id, 'poll') == 'ok'
      return channel_id
    endif
  catch
  endtry
  throw 'Failed to load elixir host.' .
    \ " Maybe Erlang is missing"
endfunction

call remote#host#Register('elixir', '*.e[zx]', function('s:RequireElixirHost'))

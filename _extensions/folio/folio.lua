local allowed = { light = true, dark = true, paper = true }

function Meta(meta)
  if not quarto.doc.is_format("html") then return nil end
  local mode = "light"
  if meta["folio-mode"] then
    local m = pandoc.utils.stringify(meta["folio-mode"]):lower()
    if allowed[m] then mode = m end
  end
  quarto.doc.include_text("in-header", string.format([[
<script>(function(){var m="%s";try{var s=localStorage.getItem("folio-mode");if(s==="light"||s==="dark"||s==="paper")m=s;}catch(e){}document.documentElement.dataset.mode=m;})();</script>
]], mode))
  return nil
end

local M = {}

local escape = function(char)
  -- prepare tex4ht special for entity with unicode value
  return string.format("t4ht@+&{35}x%x{59}", char)
end

local make_node = function(data)
  -- make special whathsit
  local n = node.new(8,3)
  n.data = data
  return n
end

local xchar = string.byte("x")

function M.char_to_entity(head)
  -- traverse characters
  for n in node.traverse_id(37, head) do
    local char = n.char
    if char > 127 then
      local new = escape(char)
      local x = make_node(new)
      -- insert tex4ht special before char, it will replace the char
      node.insert_before(head, n, x)
      -- in standard tex4ht accented characters are replaced with "x" char. they are later removed anyway
      -- maybe we don't need to do that, but we can, so why not?
      n.char = xchar
      print(new)
    end
  end
  return head
end

return M


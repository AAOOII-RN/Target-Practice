return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 800,
  height = 450,
  tilewidth = 1,
  tileheight = 1,
  nextlayerid = 3,
  nextobjectid = 4,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      draworder = "index",
      id = 2,
      name = "Main Menu",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "Play",
          type = "button",
          shape = "rectangle",
          x = 19.3333,
          y = 392,
          width = 95.3333,
          height = 43.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["Color"] = "brown2",
            ["Goto"] = "Gamemode"
          }
        },
        {
          id = 3,
          name = "Exit",
          type = "button",
          shape = "rectangle",
          x = 688.333,
          y = 390,
          width = 95.3333,
          height = 43.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["Color"] = "brown2",
            ["Goto"] = "Gamemode"
          }
        }
      }
    }
  }
}

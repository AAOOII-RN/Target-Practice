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
  nextobjectid = 5,
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
          id = 3,
          name = "Exit",
          type = "button",
          shape = "rectangle",
          x = 688.75,
          y = 389,
          width = 95.3333,
          height = 43.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["Color"] = "brown2",
            ["Goto"] = "Gamemode",
            ["Roundness"] = "16"
          }
        },
        {
          id = 1,
          name = "Play",
          type = "button",
          shape = "rectangle",
          x = 351.75,
          y = 191.25,
          width = 95.3333,
          height = 43.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["Color"] = "brown2",
            ["Goto"] = "Gamemode",
            ["Roundness"] = "16"
          }
        },
        {
          id = 4,
          name = "",
          type = "text",
          shape = "text",
          x = 284.25,
          y = 213.75,
          width = 80,
          height = 17,
          rotation = 0,
          visible = true,
          text = "Hello World",
          wrap = true,
          properties = {
            ["Scale"] = "16"
          }
        }
      }
    }
  }
}

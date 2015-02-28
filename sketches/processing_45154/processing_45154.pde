
// User Parameters
public float mean_coord_range = 0;
public float sd_coord_range = 0;
public float mean_spawntime = 5;
public float sd_spawntime = 0;
public float mean_lifetime = 0.5;
public float sd_lifetime = 0.2;

// Other
public boolean info = false; // Display information
public boolean bounded = true; // Bounded within world
public boolean debug = false; // Display viewing fields and more
 

void controlUI()  {
  // Position offsets
  int xoffset = 10;
  int yoffset = 15;
  int canvasoffset = 10;
  int worldoffset = 60;
  int deviationoffset = 130;
  int steeroffset = 230;
  int flockoffset = 345;
  int weightoffset = 415;
  controlP5 = new ControlP5(this);
  ControlGroup ui = controlP5.addGroup("SIMULATION", 585, 10, 215);
  ui.setBackgroundColor(color(0, 200));
  ui.setBackgroundHeight(590);
  ui.mousePressed(); // Menu is hidden by default
  
   Textlabel textWorld = controlP5.addTextlabel("USER MEAN VALUES", "MEAN", xoffset, worldoffset);
  textWorld.setColorValue(color(200));
  Slider coord_range = controlP5.addSlider("COORDINATE MEAN", 0, 500, mean_coord_range, xoffset, worldoffset + yoffset*1, 100, 10);
  Slider spawn_mean = controlP5.addSlider("SPAWN MEAN", 0, 10,  mean_spawntime, xoffset, worldoffset + yoffset*2, 100, 10);
  Slider lifetime_range = controlP5.addSlider("LIFETIME MEAN", 0, 1, mean_lifetime, xoffset, worldoffset + yoffset*3, 100, 10);
  
  Textlabel textDev = controlP5.addTextlabel("USER DEVIATION VALUES", "DEVIATION ", xoffset, deviationoffset);
  Slider sd_coord = controlP5.addSlider("COORDINATE SD", 1, 200, sd_coord_range, xoffset, deviationoffset + yoffset*1, 100, 10);
  Slider sd_spawn = controlP5.addSlider("SPAWN SD", 1, 10, sd_spawntime, xoffset, deviationoffset + yoffset*2, 100, 10);
  Slider sd_lifetime_range = controlP5.addSlider("LIFETIME SD", 0, 1, sd_lifetime, xoffset, deviationoffset + yoffset*3, 100, 10);
  
  // Distribution settings and more
  Textlabel textCanvas = controlP5.addTextlabel("DISTRIBUTION", "DISTRIBUTION", xoffset, canvasoffset);
  textCanvas.setColorValue(color(200));
  Toggle toggleInfo = controlP5.addToggle("Info", info, xoffset + 0, canvasoffset + yoffset*1, 10, 10);
  Toggle toggleBound = controlP5.addToggle("Bound", bounded, xoffset + 45, canvasoffset + yoffset*1, 10, 10);
  Toggle toggleDebug = controlP5.addToggle("Debug", debug, xoffset + 90, canvasoffset + yoffset*1, 10, 10);
  
  
  // set id for each menu item
  coord_range.setId(1);
  spawn_mean.setId(2);
  lifetime_range.setId(3);
  sd_coord.setId(4);
  sd_spawn.setId(5);
  sd_lifetime_range.setId(6);
  
  
  
  // add all menu items to the groups
  coord_range.setGroup(ui);
  textWorld.setGroup(ui);
  textCanvas.setGroup(ui);
  textDev.setGroup(ui);
  toggleBound.setGroup(ui);
  toggleDebug.setGroup(ui);
  spawn_mean.setGroup(ui);
  lifetime_range.setGroup(ui);
  sd_coord.setGroup(ui);
  sd_spawn.setGroup(ui);
  sd_lifetime_range.setGroup(ui);
}

// Event handler
void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {
    case 1:
    mean_coord_range = theEvent.controller().value();
    break;
    case 2:
    mean_spawntime = theEvent.controller().value();
    break;
    case 3:
    mean_lifetime = theEvent.controller().value();
    break;
    case 4:
    sd_coord_range = theEvent.controller().value();
    break;    
    case 5:
    sd_spawntime = theEvent.controller().value();
    break;    
    case 6:
    sd_lifetime = theEvent.controller().value();
    break;
  }
}
  
  
  










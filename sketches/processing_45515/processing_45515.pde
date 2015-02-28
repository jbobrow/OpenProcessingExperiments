
// User Parameters
import controlP5.*;
public float mean_coord_range = 0;
public float sd_coord_range = 0;
public float mean_nexttime = 1;
public float sd_nexttime = 0.3;
public boolean nexttime_random = false;
public float mean_lifetime = 1;
public float sd_lifetime = 0.2;
public boolean lifetime_random = false;
public float mean_spawntime = 1;
public boolean spawntime_random = false;
public boolean backgroundOn = true;
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
  
   Textlabel textNext = controlP5.addTextlabel("next", "NEXTTIME (sec)", xoffset, worldoffset);
  textNext.setColorValue(color(200));
  Slider next_sd = controlP5.addSlider("DEVIATION", 0, 10, sd_nexttime, xoffset, worldoffset + yoffset*1, 100, 10);
  Slider next_mean = controlP5.addSlider("MEAN", 0, 10,  mean_nexttime, xoffset, worldoffset + yoffset*2, 100, 10);
  Radio rb = controlP5.addRadio("radioBothModels", 10, 150, 10 ,10, 4);  
  
  Textlabel textLife = controlP5.addTextlabel("lifetime", "LIFETIME (sec))", xoffset, deviationoffset);
  Slider lifetime_sd = controlP5.addSlider("DEVIATION", 0, 10, sd_lifetime, xoffset, deviationoffset + yoffset*1, 100, 10);
  Slider lifetime_mean = controlP5.addSlider("MEAN", 0, 10, mean_lifetime , xoffset, deviationoffset + yoffset*2, 100, 10);
  
  Textlabel textSpawn = controlP5.addTextlabel("spawn", "SPAWNTIME (sec))", xoffset, steeroffset);
  Slider spawn_mean = controlP5.addSlider("MEAN", 0, 10, mean_spawntime, xoffset, steeroffset + yoffset*1, 100, 10);
  
  // Distribution settings and more
  Textlabel textCanvas = controlP5.addTextlabel("DISTRIBUTION", "DISTRIBUTION", xoffset, canvasoffset);
  textCanvas.setColorValue(color(200));
  Toggle toggleBackground = controlP5.addToggle("BACKGROUND", backgroundOn, xoffset + 60, canvasoffset + yoffset*1, 10, 10);
  
  
  // set id for each menu item  
  spawn_mean.setId(1);
  next_mean.setId(2);
  lifetime_mean.setId(3);
  next_sd.setId(5);
  lifetime_sd.setId(6);
  rb.setId(7);
  toggleBackground.setId(8);
  
  
  
  // add all menu items to the groups
  textNext.setGroup(ui);
  textSpawn.setGroup(ui);
  textCanvas.setGroup(ui);
  textLife.setGroup(ui);
  toggleBackground.setGroup(ui);
  //toggleDebug.setGroup(ui);
  next_mean.setGroup(ui);
  lifetime_mean.setGroup(ui);
  next_sd.setGroup(ui);
  lifetime_sd.setGroup(ui);
  spawn_mean.setGroup(ui);
  rb.setGroup(ui);
}

// Event handler
void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {
    case 1:
    mean_spawntime = theEvent.controller().value();
    break;
    case 2:
    mean_nexttime = theEvent.controller().value();
    break;
    case 3:
    mean_lifetime = theEvent.controller().value();
    break;
    case 4:
    sd_coord_range = theEvent.controller().value();
    break;    
    case 5:
    sd_nexttime = theEvent.controller().value();
    break;    
    case 6:
    sd_lifetime = theEvent.controller().value();
    break;
    case 8:
    if((int)theEvent.controller().value() == 1)
    {
      backgroundOn = true;
    }
    else
    {
      backgroundOn = false;
    }
    break;
  }
}
  
  
  










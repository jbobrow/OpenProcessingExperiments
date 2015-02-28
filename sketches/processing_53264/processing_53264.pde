
/*
  toDoBackground
  2/22/12
  Bringing the two together
*/

String[] lineTasks = loadStrings("/Users/nate/Documents/Everything Else/Processing/toDoBackgroundV4/toDo.txt");
String[] tasks;

// Loading Resources
PFont font;
PImage filterBG;
color[] paletteBG = new color[5];
int paletteSwitch;
//------------------

// Time Variables
int currentTask=0;
int timer=0;
int lastSavedTime;
//------------------


void setup(){
  smooth();
  size(900, 800);
  
  lastSavedTime = millis();
  
  //------------------------
  paletteBG[0]= color(204, 51, 51);    // Red
  paletteBG[1]= color(255, 173, 34);  // Yellow
  paletteBG[2]= color(0, 153, 51);     // Green
  paletteBG[3]= color(102, 51, 204);   // Purple
  paletteBG[4]= color(0, 102, 204);    // Blue 
  paletteSwitch = int(random(0, 5));
  //------------------------
  
  String joinedTasks = join(lineTasks, "");
  tasks = split(joinedTasks, '*');
  
  font = loadFont("BebasNeue-180.vlw");
  textAlign(CENTER);
  fill(230);
  textFont(font, 48);
  text("Loading your tasks", width/2, height/2+50);
  textFont(font, 90);
  fill(255);
  text("Get ready!", width/2, height/2+11);  
}

void draw()
{
  background(paletteBG[paletteSwitch]);
  filterBG = loadImage("filterBG.png");
  image(filterBG, 0, 0);
  
  timer=millis()-lastSavedTime;
  
  if(currentTask<=tasks.length-2)
  {
    runCounter();
  }
  else{
    finished();
  }
}

void runCounter()
{
  if (timer < int(tasks[currentTask+1])*1000)
  {
    fill(0);
    text(tasks[currentTask], width/2, height/2+11);
    fill(255);
    text(tasks[currentTask], width/2, height/2+10);
  }
  else
  {
    lastSavedTime=millis();
    currentTask+=2;
    int oldPalette = paletteSwitch;    
    paletteSwitch = int(random(0,5));
    if(oldPalette == paletteSwitch)
    {
      paletteSwitch++;
      if(paletteSwitch>5)
      {paletteSwitch = int(random(0,5));}
    }
  }
}

void finished()
{
  text("You're finished!", width/2, height/2);
}
  
  



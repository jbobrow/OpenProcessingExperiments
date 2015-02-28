
/* @pjs preload="anthill.png"; */

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15109*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
  (CC) 2010 Forrest Oliphant, http://sembiki.com/
 This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License
 http://creativecommons.org/licenses/by-sa/3.0/
 */

color antColor = color(68, 0, 8);
int DIRT_R = 217;
int DIRT_G = 165;
int DIRT_B = 78;
color DIRT_COLOR = color(DIRT_R, DIRT_G, DIRT_B);
color foodColor;
int HOME_R = 96;
int HOME_G = 85;
int HOME_B = 33;
//color PHER_HOME_COLOR = color(255,0,0);
int FOOD_R = 255;
int FOOD_G = 255;
int FOOD_B = 255;
color PHER_FOOD_COLOR = color(255, 0, 0);
int switchCounter = 1;
int startCounter = 1;
color wallColor = color(100);
PImage anthill;

int w = 50;

Colony col;
Food food;
Map pherHome;
Map pherFood;
Wall theWall;
Map wallMap;
Button switchToggle;
Button startStop;

void setup() 
{  
  size(900, 506, P2D);
  background(DIRT_COLOR);
  noStroke();
  //smooth();

  pherHome = new Map(width, height);
  pherFood = new Map(width, height);
  wallMap = new Map(width, height);
  col = new Colony(100, 100, 50, pherHome, pherFood, wallMap);
  foodColor = color(158, 55, 17);
  food = new Food(width, height);  
  switchToggle = new Button(845, 30, 100, 50, "Set Food");
  startStop = new Button(845, 90, 100, 50, "Stop");
  
  theWall = new Wall(width, height);
  anthill = loadImage("anthill.png");

  // Sprinkle some crumbs around
  for (int i=0; i<10; i++) {
    food.addFood(400+int(random(-50, 50)), 300+int(random(-50, 50)));
  }
}

void draw() 
{
  // Clear bg
  //background(DIRT_COLOR);

  // Add food
  if (mousePressed && switchToggle.says("Set Food"))
  {
    food.addFood(mouseX, mouseY);
  }       
  
  if (mousePressed && switchToggle.says("Build Wall"))
  {
    theWall.buildWall(mouseX, mouseY);
  }  

  loadPixels();
  image(anthill, 75, 78);
  for (int i=0; i<pherHome.length; i++) 
  {
    color pixelColor;
    if (food.getValue(i)) {
      // Draw food
      pixelColor = foodColor;
    } 
    else if (theWall.getValue(i)) {
      // Draw food
      pixelColor = wallColor;
    } 
    else 
    {
      // Draw pheromones
      // I found the direct math to be faster than blendColor()
      float pixelAlpha = pherHome.getPercentage(i);     
      int pixel_r = int(HOME_R * pixelAlpha + DIRT_R * (1-pixelAlpha));
      int pixel_g = int(HOME_G * pixelAlpha + DIRT_G * (1-pixelAlpha));
      int pixel_b = int(HOME_B * pixelAlpha + DIRT_B * (1-pixelAlpha));

      pixelAlpha = pherFood.getPercentage(i);
      pixel_r = int(FOOD_R * pixelAlpha + pixel_r * (1-pixelAlpha));
      pixel_g = int(FOOD_G * pixelAlpha + pixel_g * (1-pixelAlpha));
      pixel_b = int(FOOD_B * pixelAlpha + pixel_b * (1-pixelAlpha));

      // Using bitwise color math instead of color() on the following line
      // upped the framerate from 43 to 58 on my computer
      //pixelColor = color(pixel_r, pixel_g, pixel_b);
      pixelColor = pixel_r << 16 | pixel_g << 8 | pixel_b;
    }
    // Set
    pixels[i] = pixelColor;    
  }
  updatePixels();
   
// Draw ants
  for (int i = 0; i < col.ants.length; i++) {
    Ant thisAnt = col.ants[i];
    
    if (startStop.says("Stop")) {
      thisAnt.step();
    }
    else if (startStop.says("Start")) 
    {
    }
 
    int thisXi = thisAnt.intX;
    int thisYi = thisAnt.intY;
    float thisXf = thisAnt.x;
    float thisYf = thisAnt.y;
    
    antColor = thisAnt.antColor();
    fill(antColor);
    stroke(antColor);
    
    if (theWall.getValue(thisXi, thisYi)) {
      if (thisAnt.dx > 0 && thisAnt.dy > 0) {
        thisAnt.dx -= 2;
        thisAnt.dy -= 2;
      }
      else if (thisAnt.dx > 0 && thisAnt.dy < 0) {
        thisAnt.dx -= 2;
        thisAnt.dy += 2;
      }
      else if (thisAnt.dx < 0 && thisAnt.dy > 0) {
        thisAnt.dx += 2;
        thisAnt.dy -= 2;
      }
      else if (thisAnt.dx < 0 && thisAnt.dy < 0) {
        thisAnt.dx += 2;
        thisAnt.dy += 2;
      }
      else if (thisAnt.dx > 0) thisAnt.x -= 2;
      else if (thisAnt.dx < 0) thisAnt.x += 2;
      else if (thisAnt.dy > 0) thisAnt.y -= 2;
      else if (thisAnt.dy < 0) thisAnt.y += 2;
      else {}
    }
 
    if (thisAnt.hasFood) {
      fill(foodColor);
      if (thisXi>col.x-10 && thisXi<col.x+10 && thisYi>col.y-10 && thisYi<col.y+10) {
        // Close enough to home
        thisAnt.hasFood = false;
        thisAnt.homePher = 100;
      }
    }
    else if(food.getValue(thisXi, thisYi)) {
      thisAnt.hasFood = true;
      thisAnt.foodPher = 100;
      food.bite(thisXi, thisYi);
    }
 
    if (abs(thisAnt.dx) > abs(thisAnt.dy)) {
      // Horizontal ant
      rect(thisXf,thisYf,3,2);
    } else {
      // Vertical ant
      rect(thisXf,thisYf,2,3);
    }
  }

 
  // Evaporate
  pherHome.step();
  pherFood.step();

  // Debug
  //println(frameRate);
  //println(mouseX + " " + mouseY);

  switchToggle.display();
  startStop.display();
 
}

void mouseClicked()
{ 
  if (switchToggle.says("Click Map to \n Clear Wall") && switchToggle.contains(mouseX, mouseY) == false) {
    theWall = new Wall(width, height);
  }
  else if (startStop.contains(mouseX, mouseY)) {
    startCounter++;
    
    if (startCounter == 1) {
      startStop.setText("Stop");
    }
    else if (startCounter == 2) {
      startStop.setText("Start");
      startCounter = 0;
    }
  }
  else if (switchToggle.contains(mouseX, mouseY))
  {
    switchCounter++;

    if (switchCounter == 1)
    {
      switchToggle.setText("Set Food");
    }

    else if (switchCounter == 2)
    {
      switchToggle.setText("Blur Trail");  
    }
    else if (switchCounter == 3)
    {
      switchToggle.setText("Build Wall");  
    }
    else if (switchCounter == 4) {
      switchToggle.setText("Click Map to \n Clear Wall");
      switchCounter = 0;
    }
  }
}
  


void mouseDragged() {
  
   // Blur Trail
  if (switchToggle.says("Blur Trail"))
  {
     pherHome.blur(mouseX,mouseY);
     pherFood.blur(mouseX,mouseY); // white
  }
}    
  


class Ant {
  public float dx = random(-1, 1);
  public float dy = random(-1, 1);
  public float x;
  public float y;
  int intX;
  int intY;
  int lastX;
  int lastY;
  int homeX;
  int homeY;

  boolean hasFood = false;

  float homePher = 100;
  float foodPher = 100;
  private float USE_RATE = .995;
  private float WANDER_CHANCE = .92;

  int bored = 0;

  Map homeMap;
  Map foodMap;
  Map wallMap;
  
  color antColor;

  Ant(int _x, int _y, Map _homePher, Map _foodMap, Map _wallMap) {
    intX = homeX = _x;
    intY = homeY = _y;
    x = float(_x);
    y = float(_y);
    homeMap = _homePher;
    foodMap = _foodMap;
    wallMap = _wallMap;
    antColor = color(random(255), random(255), random(255));
    fill(antColor);
  }
  
  color antColor() {
    return antColor;
  }

  void step() {
    
    // Wander chance .1 
    if (random(1) > WANDER_CHANCE) dx += random(-1, 1);
    if (random(1) > WANDER_CHANCE) dy += random(-1, 1);
    if (random(1) > .99) bored += floor(random(15));
    
    if (bored>0) {
      // Ignore pheromones
      bored--;
    } else {
      // Sniff trails
      if (hasFood) {
        // Look for home 
        int[] direction = homeMap.getStrongest(intX, intY);
        dx += direction[0] * random(1.5);
        dy += direction[1] * random(1.5);
      }
      else
      {
        // Look for food 
        int[] direction = foodMap.getStrongest(intX, intY);
        dx += direction[0] * random(1.5);
        dy += direction[1] * random(1.5);
      }
    }
    // Bounding limits, bounce off of edge
    if (x<2) dx = 1;
    if (x>width-2) dx = -1;
    if (y<2) dy = 1;
    if (y>height-2) dy = -1;

    // Speed limit
    dx = Math.min(dx, 1);
    dx = Math.max(dx, -1);
    dy = Math.min(dy, 1);
    dy = Math.max(dy, -1);
    // Move
    x += dx;
    y += dy;
    intX = floor(x);
    intY = floor(y);

    // Only if ant has moved enough (to another pixel)
    if (lastX!=intX || lastY!=intY) {
      // Leave trails
      if (hasFood) {
        // Leave food pheromone trail
        foodPher = foodPher * USE_RATE;
        foodMap.setValue(intX, intY, foodPher);
      }
      else
      {
        // Leave home pheromone trail
        homePher = homePher * USE_RATE;
        homeMap.setValue(intX, intY, homePher);
      }
    }

    lastX = intX;
    lastY = intY;
  }
  


}

class Button {

  private int x, y, w, h;
  private String textB;

  Button(int _x, int _y, int _w, int _h, String _text) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    textB = _text;
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(textB, x, y);
  }

  boolean contains(int _x, int _y) {
    if ( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
      return true;
    else
      return false;
  }

  boolean says(String s) {
    return textB.equals(s) ? true : false;
  }

  void setText(String _t) {
    textB = _t;
  }
}

class Colony {

  Ant[] ants;
  int x;
  int y;
  
  Colony (int _x, int _y, int count, Map _pherHome, Map _pherFood, Map _wallMap) {
    ants = new Ant[count];
    x = _x;
    y = _y;
   
    for (int i = 0; i < count; i++) 
    { 
      ants[i] = new Ant(x, y, _pherHome, _pherFood, _wallMap);
    }
  }
  
}

class Food 
{
  private boolean[] mapVals;
  public int length;
  private int mapW;
  private int mapH;
  color foodColor;
  
  // A boolean map
  Food (int w, int h)
  {
    mapW = w; 
    mapH = h; 
    length = mapW*mapH;
    mapVals = new boolean[length];
    for (int i = 0; i < mapVals.length; i++) { 
      mapVals[i] = false;
    }
  }

  void addFood(int x, int y) {
    try {
      // 10x10 bit of food
      for (int i=x; i<mapW && i<x+10; i++) {
        for (int j=y; j<mapH && j<y+10; j++) {
          setValue(i, j, true);
        }
      }
    } 
    catch (Throwable t) {
    }
  }

  void setValue(int x, int y, boolean val) {
    try {
      mapVals[y * mapW + x] = val;
    } 
    catch (Throwable t) {
    }
  }

  void bite(int x, int y) {
    setValue(x-1, y-1, false);
    setValue(x-1, y, false);
    setValue(x-1, y+1, false);
    setValue(x, y-1, false);
    setValue(x, y, false);
    setValue(x, y+1, false);
    setValue(x+1, y-1, false);
    setValue(x+1, y, false);
    setValue(x+1, y+1, false);
  }
  
  boolean getValue(int index) {
    return mapVals[index];
  }
  
  boolean getValue(int x, int y) {
    try {
      return mapVals[y * mapW + x];
    } 
    catch (Throwable t) {
      // Off the map
      return false;
    }
  }

}

class Map {

  private float[] mapVals;
  public int length;
  private int mapW;
  private int mapH;

  private float MAX_VAL = 100;
  private float EVAPORATION_RATE = .999;

  float[][] matrix = { 
    { 
      .111, .111, .111
    }
    , 
    { 
      .111, .111, .111
    }
    , 
    { 
      .111, .111, .111
    }
  }; 


  // A float map
  Map (int w, int h) {
    mapW = w; 
    mapH = h;
    length = mapW*mapH;
    mapVals = new float[length];
    for (int i = 0; i < mapVals.length; i++) { 
      mapVals[i] = 0.0;
    }
  }

  // Evaporate
  void step() {
    for (int i=0; i<mapVals.length; i++) {
      mapVals[i] = mapVals[i]*EVAPORATION_RATE;
    }
  }

  void setValue(int x, int y, float val) {
    try {
      int index = y * mapW + x;
      float oldVal = mapVals[index];
      //      mapVals[index] = (oldVal + val)/2;
      if (val>oldVal) {
        mapVals[index] = val;
      }
    } 
    catch (Throwable t) {
    }
  }

  float getPercentage(int index) {
    return mapVals[index]/MAX_VAL;
  }

  float getValue(int index) {
    return mapVals[index];
  }

  float getValue(int x, int y) {
    try {
      return mapVals[y * mapW + x];
    } 
    catch (Throwable t) {
      // Off the map
      return -1;
    }
  }

  /**
   Returns a 2D vector of the strongest direction
   */
  int[] getStrongest(int x, int y) {
    float compare = 0;
    float strongestVal = 0;
    int[] strongest = {
      0, 0
    };

    compare = getValue(x-1, y-1); // up left
    if (compare > strongestVal) {
      strongest[0] = -1;
      strongest[1] = -1;
      strongestVal = compare;
    }
    compare = getValue(x, y-1); // up
    if (compare > strongestVal) {
      strongest[0] = 0;
      strongest[1] = -1;
      strongestVal = compare;
    }
    compare = getValue(x+1, y-1); // up right
    if (compare > strongestVal) {
      strongest[0] = 1;
      strongest[1] = -1;
      strongestVal = compare;
    }
    compare = getValue(x-1, y); // left
    if (compare > strongestVal) {
      strongest[0] = -1;
      strongest[1] = 0;
      strongestVal = compare;
    }
    compare = getValue(x+1, y); // right
    if (compare > strongestVal) {
      strongest[0] = 1;
      strongest[1] = 0;
      strongestVal = compare;
    }
    compare = getValue(x-1, y+1); // down left
    if (compare > strongestVal) {
      strongest[0] = -1;
      strongest[1] = 1;
      strongestVal = compare;
    }
    compare = getValue(x, y+1); // down
    if (compare > strongestVal) {
      strongest[0] = 0;
      strongest[1] = 1;
      strongestVal = compare;
    }
    compare = getValue(x+1, y+1); // down right
    if (compare > strongestVal) {
      strongest[0] = 1;
      strongest[1] = 1;
      strongestVal = compare;
    }

    return strongest;
  }

  void blur(int _x, int _y) {
    int w = 50;
    int xstart = constrain(_x - w/2, 0, width);
    int ystart = constrain(_y - w/2, 0, height);
    int xend = constrain(_x + w/2, 0, width);
    int yend = constrain(_y + w/2, 0, height);
    int matrixsize = 3;
    ////loadPixels();

    // Begin our loop for every pixel in the smaller image
    for (int x = xstart; x < xend; x++) 
      for (int y = ystart; y < yend; y++ ) 
        setValue(x,y, convolve(x, y, matrix, matrixsize));
    ////updatePixels();
  }

  float convolve(int x, int y, float[][] matrix, int matrixsize)
  {
    float atotal = 0.0;
    for (int i = 0; i < matrixsize; i++)
      for (int j= 0; j < matrixsize; j++)
        atotal += (getValue(x-1+i, y-1+i) * matrix[i][j]);
    return atotal;
  }
  
  
}

class Wall 
{
  private boolean[] mapVals;
  public int length;
  private int mapW;
  private int mapH;
  color foodColor;
  
  // A boolean map
  Wall (int w, int h)
  {
    mapW = w; 
    mapH = h; 
    length = mapW*mapH;
    mapVals = new boolean[length];
    for (int i = 0; i < mapVals.length; i++) { 
      mapVals[i] = false;
    }
  }

  void buildWall(int x, int y) {
    try {
      // 10x10 bit of food
      for (int i=x; i<mapW && i<x+5; i++) {
        for (int j=y; j<mapH && j<y+5; j++) {
          setValue(i, j, true);
        }
      }
    } 
    catch (Throwable t) {
    }
  }

  void setValue(int x, int y, boolean val) {
    try {
      mapVals[y * mapW + x] = val;
    } 
    catch (Throwable t) {
    }
  }
  
  boolean getValue(int index) {
    return mapVals[index];
  }
  
  boolean getValue(int x, int y) {
    try {
      return mapVals[y * mapW + x];
    } 
    catch (Throwable t) {
      // Off the map
      return false;
    }
  }

}




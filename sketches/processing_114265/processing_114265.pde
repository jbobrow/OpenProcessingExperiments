
class Ant {
  float dx = random(-1, 1);
  float dy = random(-1, 1);
  float x;
  float y;
  int intX;
  int intY;
  int lastX;
  int lastY;
  int homeX;
  int homeY;
  color ant_color;
 
  boolean hasFood = false;
 
  float homePher = 100;
  float foodPher = 100;
  private float USE_RATE = .995;
  private float WANDER_CHANCE = .92;
 
  int bored = 0;
 
  Map homeMap;
  Map foodMap;
 
  Ant(int _x, int _y, Map _homePher, Map _foodMap) {
    intX = homeX = _x;
    intY = homeY = _y;
    x = float(_x);
    y = float(_y);
    homeMap = _homePher;
    foodMap = _foodMap;
    ant_color = color(random(255),random(255),random(255));
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

/*
  (CC) 2010 Forrest Oliphant, http://sembiki.com/
 This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License
 http://creativecommons.org/licenses/by-sa/3.0/
 */



int DIRT_R = 217;
int DIRT_G = 165;
int DIRT_B = 78;
color DIRT_COLOR = color(DIRT_R, DIRT_G, DIRT_B);
color FOOD_COLOR = color(158, 55, 17);
int HOME_R = 96;
int HOME_G = 85;
int HOME_B = 33;
//color PHER_HOME_COLOR = color(HOME_R, HOME_G, HOME_B);
int FOOD_R = 255;
int FOOD_G = 255;
int FOOD_B = 255;
//color PHER_FOOD_COLOR = color(FOOD_R, FOOD_G, FOOD_B);

Colony col;
Food food;
Map pherHome;
Map pherFood;
StatusBar bar;
String mouseMode;
int brush=50;

void setup() {
  size(900, 506, P2D);
  background(DIRT_COLOR);
  noStroke();
  //smooth();

  pherHome = new Map(width, height);
  pherFood = new Map(width, height);
  col = new Colony(100, 100, 50, pherHome, pherFood);
  food = new Food(width, height);
  // Sprinkle some crumbs around
  for (int i=0; i<10; i++) {
    food.addFood(400+int(random(-50, 50)), 300+int(random(-50, 50)));
  }
  bar = new StatusBar(450, 496, 901, 30);
  mouseMode = "Food";
}

void draw() {
  // Clear bg
  //background(DIRT_COLOR);
  // Add food
  
  if (mousePressed) {
    if (mouseMode == "Food") {
      food.addFood(mouseX, mouseY);
    }
    if (mouseMode == "Add Ant") {
      col.ants.add(new Ant(mouseX, mouseY, pherHome, pherFood));
    }
    if (mouseMode == "Kill Ant"){
      //There will always be atleast 2 ants
      if (col.ants.size() >2){
      for (int i = 0; i < col.ants.size(); i++) {
       if (col.ants.get(i).x >= mouseX-brush/2 &&  col.ants.get(i).x <= mouseX+brush/2){
         if (col.ants.get(i).y >= mouseY-brush/2 &&  col.ants.get(i).y <= mouseY+brush/2){
       col.ants.remove(i);}}
    } 
      
    }
  }}
  if (keyPressed) {
    if (key == 'f' || key == 'F') {
      mouseMode = "Food";
    }
    if (key == 'b' || key == 'B') {
      mouseMode = "Blur Food Trail";
    }
    if (key == 'h' || key == 'H') {
      mouseMode = "Blur Home Trail";
    }
    if (key == 'a' || key == 'A') {
      mouseMode = "Add Ant";
    }
    if (key == 'k' || key == 'K') {
      mouseMode = "Kill Ant";
    }
    if (key == CODED) {
      if (keyCode == UP) {
        brush++;
      }
      if (keyCode == DOWN) {
        if (brush <= 1) {
        }
        else {
          brush--;
        }
      }
    }
  }

  loadPixels();
  for (int i=0; i<pherHome.length; i++) {
    color pixelColor;
    if (food.getValue(i)) {
      // Draw food
      pixelColor = FOOD_COLOR;
    }
    else {
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
  for (int i = 0; i < col.ants.size(); i++) {
    Ant thisAnt = col.ants.get(i);

    thisAnt.step();

    int thisXi = thisAnt.intX;
    int thisYi = thisAnt.intY;
    float thisXf = thisAnt.x;
    float thisYf = thisAnt.y;

    fill(thisAnt.ant_color);

    if (thisAnt.hasFood) {
      fill(FOOD_COLOR);
      if (thisXi>col.x-10 && thisXi<col.x+10 && thisYi>col.y-10 && thisYi<col.y+10) {
        // Close enough to home
        thisAnt.hasFood = false;
        thisAnt.homePher = 100;
      }
    }
    else if (food.getValue(thisXi, thisYi)) {
      thisAnt.hasFood = true;
      thisAnt.foodPher = 100;
      food.bite(thisXi, thisYi);
    }

    if (abs(thisAnt.dx) > abs(thisAnt.dy)) {
      // Horizontal ant
      rect(thisXf, thisYf, 3, 2);
    } 
    else {
      // Vertical ant
      rect(thisXf, thisYf, 2, 3);
    }
  }

  // Evaporate
  pherHome.step();
  pherFood.step();

  // Debug
  //println(frameRate);
  bar.display();
}
void mouseDragged() {

  // Blur Trail
  if (mouseMode =="Blur Food Trail")
  { 
    pherFood.blur(mouseX, mouseY, brush); // white
  }
  if (mouseMode =="Blur Home Trail")
  {
    pherHome.blur(mouseX, mouseY, brush);
  }
}   


class Colony {
 
  ArrayList<Ant> ants;
  int x;
  int y;
 
  Colony (int _x, int _y, int count, Map _pherHome, Map _pherFood) {
    ants = new ArrayList<Ant>();
    x = _x;
    y = _y;
    for (int i = 0; i < count; i++) {
      ants.add(new Ant(x, y, _pherHome, _pherFood));
    }
  }
}

class Food {
 
  private boolean[] mapVals;
  public int length;
  private int mapW;
  private int mapH;
   
  // A boolean map
  Food (int w, int h) {
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
    {.111, .111, .111}, 
    {.111, .111, .111}, 
    {.111, .111, .111}
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
void blur(int _x, int _y, int brush) {
    int w = 50;
    int xstart = constrain(_x - brush/2, 0, width);
    int ystart = constrain(_y - brush/2, 0, height);
    int xend = constrain(_x + brush/2, 0, width);
    int yend = constrain(_y + brush/2, 0, height);
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

class StatusBar {
  
  private int x,y,w,h;
  final static int BOTTOM = 585;
  
  StatusBar(int _x, int _y, int _w, int _h ) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    text("Number of Ants: "+col.ants.size(),30,500);
    text("Cursor mode: "+mouseMode,200,500);
    text("Brush Size: "+brush,500,500);
    text("Frame number: "+frameCount,775,500);
    
   
  }
  
 
  
  

  
}




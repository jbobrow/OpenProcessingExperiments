
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
Button spawnColonyButton;
Button blurToolButton;
boolean spawnColony = false;
boolean blurTool = false;

ArrayList<Colony> colonies;
ArrayList<Map> homeMaps;
ArrayList<Map> foodMaps;

void setup() {
  size(900, 506, P2D);
  frameRate(100);
  background(DIRT_COLOR);
  noStroke();
  //smooth();

  spawnColonyButton = new Button(width-150, 50, 150, 65, "Spawn Ants"); 
  blurToolButton = new Button(width-150, 150, 150, 65, "Blur Tool");
  pherHome = new Map(width, height);
  pherFood = new Map(width, height);
  col = new Colony(100, 100, 50, pherHome, pherFood);
  food = new Food(width, height);

  homeMaps = new ArrayList<Map>();
  foodMaps = new ArrayList<Map>();
  colonies = new ArrayList<Colony>();

  homeMaps.add(pherHome);
  foodMaps.add(pherFood);
  colonies.add(col);

  // Sprinkle some crumbs around
  for (int i=0; i<10; i++) {
    food.addFood(400+int(random(-50, 50)), 300+int(random(-50, 50)));
  }
}

void draw() {
  // Clear bg
  //background(DIRT_COLOR);

  drawMaps();

  // Draw ants
  drawColonies();

  // Evaporate
  drawMapSteps();

  if (blurTool == true && mousePressed)
  {
    for (int i =0; i<homeMaps.size(); i++) {
      homeMaps.get(i).blur(mouseX, mouseY);
      foodMaps.get(i).blur(mouseX, mouseY);
    }
  }

  // Draw Buttons
  spawnColonyButton.display();
  blurToolButton.display();

  // Debug
  println(frameRate);
}

void mouseClicked() {

  if (spawnColonyButton.contains(mouseX, mouseY)) {

    if (spawnColonyButton.says("Spawn Ants")) {
      spawnColony = true;
      spawnColonyButton.setTxt("Reset Ant Spawn");
    } 
    else {
      spawnColony = false;
      spawnColonyButton.setTxt("Spawn Ants");
    }
    blurTool = false;
    blurToolButton.setTxt("Blur Tool");
  } 
  else if (blurToolButton.contains(mouseX, mouseY)) {

    if (blurToolButton.says("Blur Tool")) {
      blurTool = true;
      blurToolButton.setTxt("Reset Blur Tool");
    } 
    else {
      blurTool = false;
      blurToolButton.setTxt("Blur Tool");
    }
    spawnColony = false;
    spawnColonyButton.setTxt("Spawn Ants");
  } 

  if (spawnColony == true && !spawnColonyButton.contains(mouseX, mouseY) && !blurToolButton.contains(mouseX, mouseY) ) {
    homeMaps.add(new Map(width, height));
    foodMaps.add(new Map(width, height));
    colonies.add(new Colony(mouseX, mouseY, 25, homeMaps.get(homeMaps.size()-1), foodMaps.get(foodMaps.size()-1)));
  } 
  else {
    food.addFood(mouseX, mouseY);
  }
}

void drawColonies() {
  for (int i = 0; i<colonies.size(); i++) {
    for (int j = 0; j < colonies.get(i).ants.length; j++) {
      Ant thisAnt = colonies.get(i).ants[j];

      thisAnt.step();

      int thisXi = thisAnt.intX;
      int thisYi = thisAnt.intY;
      float thisXf = thisAnt.x;
      float thisYf = thisAnt.y;

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
  }
}

void drawMaps() {
  for (int i = 0; i<homeMaps.size(); i++) {
    loadPixels();
    for (int j=0; j<homeMaps.get(i).length; j++) {

      color pixelColor;
      if (food.getValue(j)) {
        // Draw food
        pixelColor = FOOD_COLOR;
      }
      else {
        // Draw pheromones
        // I found the direct math to be faster than blendColor()
        float pixelAlpha = homeMaps.get(i).getPercentage(j);
        int pixel_r = int(HOME_R * pixelAlpha + DIRT_R * (1-pixelAlpha));
        int pixel_g = int(HOME_G * pixelAlpha + DIRT_G * (1-pixelAlpha));
        int pixel_b = int(HOME_B * pixelAlpha + DIRT_B * (1-pixelAlpha));

        pixelAlpha = foodMaps.get(i).getPercentage(j);
        pixel_r = int(FOOD_R * pixelAlpha + pixel_r * (1-pixelAlpha));
        pixel_g = int(FOOD_G * pixelAlpha + pixel_g * (1-pixelAlpha));
        pixel_b = int(FOOD_B * pixelAlpha + pixel_b * (1-pixelAlpha));

        // Using bitwise color math instead of color() on the following line
        // upped the framerate from 43 to 58 on my computer
        //pixelColor = color(pixel_r, pixel_g, pixel_b);
        pixelColor = pixel_r << 16 | pixel_g << 8 | pixel_b;
      }
      // Set
      pixels[j] = pixelColor;
    }
    updatePixels();
  }
}


void drawMapSteps() {

  for (int i=0; i<homeMaps.size(); i++) {
    homeMaps.get(i).step();
  } 

  for (int j=0; j<foodMaps.size(); j++) {
    foodMaps.get(j).step();
  }
}

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
  
  color antColor;
 
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
    antColor = color(random(255), random(255), random(255));
    x = float(_x);
    y = float(_y);
    homeMap = _homePher;
    foodMap = _foodMap;
  }
 
  void step() {
    fill(this.antColor);
    
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

 int x, y, w, h;
 String txt;
  
 public Button(int x, int y, int w, int h, String txt){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.txt = txt;
 } 
 
 public void setTxt(String txt) {
   this.txt = txt; 
 }
 
 void display(){
  rectMode(CENTER);
  fill(255);
  rect(x, y, w, h);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(14);
  text(this.txt, x, y);
 }
 
 public boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
 
 public boolean says(String txt) {
  return this.txt.toLowerCase().equals(txt.toLowerCase()); 
 }
  
  
}
class Colony {

  Ant[] ants;
  int x;
  int y;

  Colony (int _x, int _y, int count, Map _pherHome, Map _pherFood) {
    ants = new Ant[count];
    x = _x;
    y = _y;
    for (int i = 0; i < count; i++) {
      ants[i] = new Ant(x, y, _pherHome, _pherFood);
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
  
  // convolution/blur stuff
  int blurWidth = 60;  // box width and height
  float a = 0.111;
  float[][] matrix = { { a, a, a },
                       { a, a, a },
                       { a, a, a } };
 
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
  
  void blur(int _xpos, int _ypos) {
    // Calculate the blur rectangle
    int xstart = constrain(_xpos - blurWidth/2, 0, width);
    int ystart = constrain(_ypos - blurWidth/2, 0, height);
    int xend = constrain(_xpos + blurWidth/2, 0, width);
    int yend = constrain(_ypos + blurWidth/2, 0, height);
    int matrixsize = 3;

    // Begin our loop for every pixel in the smaller image
    for (int x = xstart; x < xend; x++) {
      for (int y = ystart; y < yend; y++) {
        setValue(x, y, convolution(x, y, matrix, matrixsize));
      }
    }
  }
  
  float convolution(int x, int y, float[][] matrix, int matrixsize)
  {
    float atotal = 0.0;
    for (int i = 0; i < matrixsize; i++){
      for (int j= 0; j < matrixsize; j++){
        atotal += (getValue(x-1+i, y-1+i) * matrix[i][j]);
      }
    }
    // Return the resulting color
    return atotal;   
  }
}




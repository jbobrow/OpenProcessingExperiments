
import picking.*; // this is a library that allows for 3d object "picking" (or hit tests on objects). here i also use it for 2D picking
import processing.opengl.*;

// declare object arrays
Photograph[] photographs = new Photograph[21];
Structure[] structures = new Structure[21];

// declare objects
Viewport viewport;
Picker picker;

// declare arrays
String[] sorts = { "year taken", "business name", "city" }; // contains all possible sorts to cycle through on keyPressed

// initialize globals
int sortKey = 0; // the index of the selected sort

// initialize constants
float thumbW = 130; // thumbnail width
float fullW = 350; // full image width
float rowH = 225; // row height
float leftMargin = 21; // left margin
float topMargin = 42; // top margin
float cols = 7; // number of columns in grid
float spacing = 12; // pixels between each grid cell
float damping = 0.1; // damping to make the transitions look more natural
float scaleFactor = 300; // sets scale for zooming in
int selectedIndex = -1; // sets the item to be zoomed into
PFont caption;

void setup() {
  size(1024, 768, OPENGL);
  frameRate(60);
  smooth();
  
  caption = loadFont("HelveticaNeue-Bold-48.vlw");

  // initialize 3D picker
  picker = new Picker(this);

  // initialize viewport
  viewport = new Viewport();
  
  // Structure(String businessName_, String structureType_, String country_, String city_) {
  structures[0] = new Structure("Acme, inc.", "Water Tower", "USA", "New York");
  structures[1] = new Structure("Widget Corp", "Water Tower", "USA", "Los Angeles");
  structures[2] = new Structure("123 Warehousing", "Water Tower", "USA", "Chicago");
  structures[3] = new Structure("Demo Company", "Water Tower", "USA", "Houston");
  structures[4] = new Structure("Smith and Co.", "Water Tower", "USA", "Philadelphia");
  structures[5] = new Structure("Foo Bars", "Water Tower", "USA", "Phoenix");
  structures[6] = new Structure("ABC Telecom", "Water Tower", "USA", "San Antonio");
  structures[7] = new Structure("Fake Brothers", "Water Tower", "USA", "San Diego");
  structures[8] = new Structure("QWERTY Logistics", "Water Tower", "USA", "Dallas");
  structures[9] = new Structure("Demo, inc.", "Water Tower", "USA", "San Jose");
  structures[10] = new Structure("Sample Company", "Water Tower", "USA", "Jacksonville");
  structures[11] = new Structure("Sample, inc", "Water Tower", "USA", "Indianapolis");
  structures[12] = new Structure("Acme Corp", "Water Tower", "USA", "San Francisco");
  structures[13] = new Structure("Allied Biscuit", "Water Tower", "USA", "Austin");
  structures[14] = new Structure("Ankh-Sto Associates", "Water Tower", "USA", "Columbus");
  structures[15] = new Structure("Extensive Enterprise", "Water Tower", "USA", "Fort Worth");
  structures[16] = new Structure("Galaxy Corp", "Water Tower", "USA", "Charlotte");
  structures[17] = new Structure("Globo-Chem", "Water Tower", "USA", "Detroit");
  structures[18] = new Structure("Mr. Sparkle", "Water Tower", "USA", "El Paso");
  structures[19] = new Structure("Globex Corporation", "Water Tower", "USA", "Memphis");
  structures[20] = new Structure("LexCorp", "Water Tower", "USA", "Baltimore");
  
  // Photograph(int yearTaken_, String format_, Structure structure_, String url_, float thumbWidth_, float fullWidth_, float x_, float y_) {
  photographs[0] = new Photograph(1980, "black-and-white photographs", structures[0], "BechersWaterTower_1.png", thumbW, fullW, width/2, height/2);
  photographs[1] = new Photograph(1981, "black-and-white photographs", structures[1], "BechersWaterTower_2.png", thumbW, fullW, width/2, height/2);
  photographs[2] = new Photograph(1982, "black-and-white photographs", structures[2], "BechersWaterTower_3.png", thumbW, fullW, width/2, height/2);
  photographs[3] = new Photograph(1983, "black-and-white photographs", structures[3], "BechersWaterTower_4.png", thumbW, fullW, width/2, height/2);
  photographs[4] = new Photograph(1984, "black-and-white photographs", structures[4], "BechersWaterTower_5.png", thumbW, fullW, width/2, height/2);
  photographs[5] = new Photograph(1985, "black-and-white photographs", structures[5], "BechersWaterTower_6.png", thumbW, fullW, width/2, height/2);
  photographs[6] = new Photograph(1986, "black-and-white photographs", structures[6], "BechersWaterTower_7.png", thumbW, fullW, width/2, height/2);
  photographs[7] = new Photograph(1987, "black-and-white photographs", structures[7], "BechersWaterTower_8.png", thumbW, fullW, width/2, height/2);
  photographs[8] = new Photograph(1988, "black-and-white photographs", structures[8], "BechersWaterTower_9.png", thumbW, fullW, width/2, height/2);
  photographs[9] = new Photograph(1989, "black-and-white photographs", structures[9], "BechersWaterTower_10.png", thumbW, fullW, width/2, height/2);
  photographs[10] = new Photograph(1990, "black-and-white photographs", structures[10], "BechersWaterTower_11.png", thumbW, fullW, width/2, height/2);
  photographs[11] = new Photograph(1991, "black-and-white photographs", structures[11], "BechersWaterTower_12.png", thumbW, fullW, width/2, height/2);
  photographs[12] = new Photograph(1992, "black-and-white photographs", structures[12], "BechersWaterTower_13.png", thumbW, fullW, width/2, height/2);
  photographs[13] = new Photograph(1993, "black-and-white photographs", structures[13], "BechersWaterTower_14.png", thumbW, fullW, width/2, height/2);
  photographs[14] = new Photograph(1994, "black-and-white photographs", structures[14], "BechersWaterTower_15.png", thumbW, fullW, width/2, height/2);
  photographs[15] = new Photograph(1995, "black-and-white photographs", structures[15], "BechersWaterTower_16.png", thumbW, fullW, width/2, height/2);
  photographs[16] = new Photograph(1996, "black-and-white photographs", structures[16], "BechersWaterTower_17.png", thumbW, fullW, width/2, height/2);
  photographs[17] = new Photograph(1997, "black-and-white photographs", structures[17], "BechersWaterTower_18.png", thumbW, fullW, width/2, height/2);
  photographs[18] = new Photograph(1998, "black-and-white photographs", structures[18], "BechersWaterTower_19.png", thumbW, fullW, width/2, height/2);
  photographs[19] = new Photograph(1999, "black-and-white photographs", structures[19], "BechersWaterTower_20.png", thumbW, fullW, width/2, height/2);
  photographs[20] = new Photograph(2000, "black-and-white photographs", structures[20], "BechersWaterTower_21.png", thumbW, fullW, width/2, height/2);

  // load and position images
  for (int i = 0; i < photographs.length; i++) {
    photographs[i].load();
  }
}

void draw() {
  background(0);
  
  pushMatrix();
    
  float endX = 0;
  float endY = 0;
  float endZ = 1;
  
  if (selectedIndex > -1) {
    endX = width/2 - thumbW/2 - photographs[selectedIndex].endX;
    endY = height/2 - rowH/2 - photographs[selectedIndex].endY;
    endZ = scaleFactor; // zooms in along the z-axis
  }
    
  viewport.x = viewport.x + (endX - viewport.x) * damping;
  viewport.y = viewport.y + (endY - viewport.y) * damping;
  viewport.z = viewport.z + (endZ - viewport.z) * damping;
  
  translate(viewport.x, viewport.y, viewport.z);
  
  positionGrid();
  drawGrid();
  testHover();
  
  popMatrix();
}


// position photos in grid
void positionGrid() {
  for (int i = 0; i < photographs.length; i++) { // loop through photographs array
     
    // positioning algorithm      
    float col = i % cols;
    float row = floor(i / cols);
    
    float posX = leftMargin + (thumbW + spacing) * col; // <-- this is why it is useful that arrays start at 0!
    float posY = topMargin + rowH * row;
    
    photographs[i].position(posX, posY);
  }
}

// draw photos in stack order
void drawGrid() {
  
  for (int i = 0; i < photographs.length; i++) {
    
    picker.start(i); // picker needs a variable that corresponds to the photo array.
    photographs[i].display();
  }
}


// test whether a key has been pressed and change sort order
void keyPressed() {
  
  // change sort order
  sortKey = (sortKey + 1) % sorts.length;
    
  // sort view
  Arrays.sort(photographs, new SortObjects(sorts[sortKey]));
  
  positionGrid();
  drawGrid();
}


// test whether mouse clicked and zoom in to full object image
void mouseReleased() { 
  
  int selectedPhotoIndex = picker.get(mouseX, mouseY);
  selectedIndex = selectedPhotoIndex; // assign global variable selectedIndex to picker index
}


// test whether the mouse is over an object
void testHover() {
  
 int isHovered = -1;

  for (int i = photographs.length-1; i >= 0; i--) {

    // set hover to false by default
    photographs[i].isHovered = false; 
  }
  
  // test if mouse over
  int selectedPhotoIndex = picker.get(mouseX, mouseY);
  isHovered = selectedPhotoIndex;
  
  if (selectedPhotoIndex > -1) {
    photographs[selectedPhotoIndex].isHovered = true; 
  }
}



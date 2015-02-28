
import processing.opengl.*;

// declare object arrays
Photograph[] photographs = new Photograph[21];
Structure[] structures = new Structure[21];

// declare arrays
String[] sorts = { "year taken", "business name", "city" }; // contains all possible sorts to cycle through on keyPressed

// initialize globals
int sortKey = 0; // the index of the selected sort

// initialize constants
float thumbW = 130; // thumbnail width
float fullW = 350; // full image width
float rowH = 250; // row height
float leftMargin = 21; // left margin
float topMargin = 21; // top margin
float cols = 7; // number of columns in grid
float spacing = 12; // pixels between each grid cell
float damping = 0.1; // damping to make the transitions look more natural
PFont caption;

void setup() {
  size(1024, 768, OPENGL);
  frameRate(60);
  smooth();
  caption = loadFont("HelveticaNeue-Bold-11.vlw");

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
    photographs[i].stackOrder = i; // set stackOrder variable to determine the order to draw items in
  }
}

void draw() {
  background(0);
  
  testHover();
  positionGrid();
  drawGrid();
}

// test whether the mouse is over an object
void testHover() {
  
 int isHovered = -1;

  for (int i = photographs.length-1; i >= 0; i--) {

    // set hover to false by default
    photographs[i].isHovered = false; 

    // test if mouse over
    if ((isHovered == -1) && (photographs[i].isMouseOver())) {
      isHovered = i;
    }
  }  
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
  int stackIndex = 0;
  while (stackIndex < photographs.length) {
         
    // loop through photos to check for corresponding stackOrder index
    for (int i = 0; i < photographs.length; i++) {
      
      if (photographs[i].stackOrder == stackIndex) { // check if stackOrder of photo matches current index. if so, draw the photo          
        photographs[i].display();
        break;
      }
    }
    stackIndex++;
  }
}

void changeStackOrder(int selectedPhotoIndex) {
    
    /*
      update stack order to move selected item to the top of the drawing stack.
      this includes changing the stackOrder variable for the selected photo, and updating all photos to close the gap in the stack order
      this is conceptually similar to The Snake example in the Shiffman book
    */
    int prevIndex = photographs[selectedPhotoIndex].stackOrder; // first, get old index

    // loop from the previous index position to length of array - 2, and update stackOrder variable for each photo in that range
    int stackIndex = prevIndex;
    while (stackIndex < photographs.length - 1) {
      
      // loop through photos to get corresponding index
      for (int i = 0; i < photographs.length; i++) {
        if (photographs[i].stackOrder == stackIndex + 1) {
          
          photographs[i].stackOrder = stackIndex; // set stack order to previous index in the array, to shuffle array objects.
          photographs[i].isZoomed = false; // zoom out of other photos
          break;
        }
      }
      
      stackIndex++;
    }
    
    // set stack index for selected photo to length of array
    photographs[selectedPhotoIndex].stackOrder = photographs.length - 1;
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
  
  // loop from the previous index position to length of array - 2, and update stackOrder variable for each photo in that range
  int stackIndex = photographs.length-1;
  while (stackIndex >= 0) {
    
    // loop through photos to get corresponding index
    for (int i = 0; i < photographs.length; i++) {
      if (photographs[i].stackOrder == stackIndex) {
        if (photographs[i].isMousePressed()) { // checks if mouse button pressed, and if so assign isZoomed to true
          if (photographs[i].isZoomed) { // checks to see if photo is set to zoom-in    
            changeStackOrder(i); // if so, change the stack order to put the selected photo in front of all the others
          }
          stackIndex = 0; // set stackIndex to zero to exit the while look
          break; // break the for loop, so that no other hit tests fire on objects below the selected object
        }
      }
    }
    stackIndex--;
  }
}


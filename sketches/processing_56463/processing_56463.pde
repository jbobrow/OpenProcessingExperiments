
/*
 * Generate the Robinson Tiling
 * Author: Karl Hiner
 * CS350, Winter 2012
 * see http://en.wikipedia.org/wiki/Aperiodic_tiling for an explanation
 * 
 * This implementation emulates the style of  
 * <a href="http://demonstrations.wolfram.com/RobinsonTiling/">this
    Wolfram Demo Project</a>.
 *
 * Change the grid size using the 'size' dropdown
 * Change the number of tile to draw using the slider, or the arrow keys
 */
 
import controlP5.*;

/*
 * Holds Tile info, and contains a draw method
 */
class Tile {
  int[][] vertices;
  color c;
  public Tile(int[][] vertices, color c) {
    this.vertices = vertices;
    this.c = c;
  }
  void draw() {
    fill(c);
    beginShape();
    for (int[] pos : vertices) {
      vertex(pos[0]*8/dim, pos[1]*8/dim);
    }
    endShape(CLOSE);
    if (++tilesDrawn > numTiles) {
      stopDrawing();
    }
  }
}

Tile tile0 = new Tile(new int[][]{{-1, -6}, {0, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {4, 0}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {0, 4}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-4, 0}, {-6, -1}, {-6, -5}, {-5, -6}},
                      color(255, 120, 0));
Tile tile1 = new Tile(new int[][]{{-1, -6}, {0, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {4, -1}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {0, 4}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-4, -1}, {-6, -1}, {-6, -5}, {-5, -6}},
                      color(84, 153, 179));
Tile tile2 = new Tile(new int[][]{{-1, -6}, {-1, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {4, 0}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {-1, 4}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-4, 0}, {-6, -1}, {-6, -5}, {-5, -6}},
                      color(201, 181, 66));
Tile tile3 = new Tile(new int[][]{{-1, -6}, {-1, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {4, -1}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {-1, 4}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-4, -1}, {-6, -1}, {-6, -5}, {-5, -6}},
                      color(153, 186, 92));
Tile tile4 = new Tile(new int[][]{{-1, -6}, {1, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {4, 0}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {1, 4}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-4, 0}, {-6, -1}, {-6, -5}, {-5, -6}},
                      color(201, 181, 66));
Tile tile5 = new Tile(new int[][]{{-1, -6}, {1, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {4,-1}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {1, 4}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-4, -1}, {-6, -1}, {-6, -5}, {-5, -6}},
                      color(153, 186, 92));
Tile startTile = new Tile(new int[][]{{-1, -6}, {0, -8}, {1, -6}, {5, -6}, {6, -5}, {6, -1}, {8, -1}, {6, 1}, {6, 5}, {5, 6}, {1, 6}, {-1, 8}, {-1, 6}, {-5, 6}, {-6, 5}, {-6, 1}, {-8, 0}, {-6, -1}, {-6, -5}, {-5, -6}},
                          color(122, 28, 143));
Tile endTile = new Tile(new int[][]{{-1, -6}, {0, -8}, {1, -6}, {5, -6}, {6, -7}, {7, -6}, {6, -5}, {6, -1}, {8, -1}, {6, 1}, {6, 5}, {7, 6}, {6, 7}, {5, 6}, {1, 6}, {-1, 8}, {-1, 6}, {-5, 6}, {-6, 7}, {-7, 6}, {-6, 5}, {-6, 1}, {-8, 0}, {-6, -1}, {-6, -5}, {-7, -6}, {-6, -7}, {-5, -6}},
                        color(200));
                        
ControlP5 controlP5;
Slider numTilesSlider;
DropdownList sizeList;
List<Tile> tiles = new ArrayList<Tile>();
int dim, stepLength;
// positions of sides/corners relative to a tile, used for translation
// NW, SW, SE, NE
int[][] corners = {{-1,1}, {-1,-1}, {1,-1}, {1,1}};
int[][] sides = {{-1,0}, {0,-1}, {1,0}, {0,1}};
// this order of rotations is used for drawing corners and sides, as well as the final tiles along the axes
float[] rotates = {-HALF_PI, 0, HALF_PI, PI};
// indices of tiles to the W, S, E, and N of the startTile, to match sides[][] above
int[] tileIndices = {1,1,3,5};
// keep track of how many tiles are drawn, so we can bail after the desired amount
int tilesDrawn = 5;

int numTiles = 1000000;
boolean stopDrawing = false;
boolean play = false;

void setup() {
  size(512, 512);
  frameRate(12);
  tiles.add(tile0);
  tiles.add(tile1);
  tiles.add(tile2);
  tiles.add(tile3);
  tiles.add(tile4);
  tiles.add(tile5);
  tiles.add(startTile);
  tiles.add(endTile);
  controlP5 = new ControlP5(this);
  setupControllers();
  setLengthVars(3);
}  

void draw() {
  tilesDrawn = 0;
  stopDrawing = false;
  if (play) { // automated paramater changing.
     // increase number of tiles to draw by amount relative to the grid size
     numTilesSlider.setValue((numTilesSlider.getValue() + sizeList.getValue() + 1));  
     // after drawing all tiles, go to the next grid size (in a cycle)
     if (numTiles == (int)numTilesSlider.getMax()) {
       sizeList.setValue((sizeList.getValue()+1)%5);
       numTilesSlider.setValue(0);
     }  
  }
  
  // white background
  background(255);
  stroke(0); // black lines
  strokeWeight(2); // line width of 2
  fill(0); // fill black for text
  text("size", 458, 20);
  text("num tiles", 70, 20);
  pushMatrix();
  //start in the middle
  translate(512/2, 512/2);
  drawTiles(dim);
  popMatrix();
}

void stopDrawing() {
  stopDrawing = true;
}

void setLengthVars(int p) {
  dim = 1 << p; // dimension = 2^p
  // stepLength is for translating when drawing
  // 3*2^(5-p) - just how the math works out :)
  stepLength = 3*(1 << 5 - p);
}

/**
 * Initialize the sizeList and numTilesSlider controllers,
 * which provide user control of the size and number of tiles.
 */
void setupControllers() {
  sizeList = controlP5.addDropdownList("sizeList", 455, 45, 30, 15*6)
                      .setBarHeight(15)
                      .setItemHeight(15);
  // args are: label, value
  // where value is the power of two that is sent to setLengthVars(p) above  
  sizeList.addItem("3", 0);
  sizeList.addItem("7", 1);
  sizeList.addItem("15", 2);
  sizeList.addItem("31", 3);
  sizeList.addItem("63", 4);
  sizeList.captionLabel().style().marginTop = 3;
  sizeList.captionLabel().style().marginLeft = 5;
  numTilesSlider = controlP5.addSlider("numTiles", 0, 31*31, numTiles, 70, 29, 360, 15)
                            .setNumberOfTickMarks(31*31)
                            .setLabel("")
                            .snapToTickMarks(true);
  sizeList.setValue(3);
  Button play = controlP5.addButton("play", 1, 15, 25, 30, 20);
}

/**
 * Recursively draw all of the tiles.
 * Start with startTile in the center, 
 * draw endTiles to each corner of startTile 
 * followed by the sides next to startTile,
 * and finally fill in the spaces along the axes with the appropriate
 * tiles in drawAxesTiles()
 */
void drawTiles(int n) {
  if (stopDrawing) return;
  startTile.draw();
  drawCorners(n);
  if (n == 1)
    drawSides();
  else {
    drawAxesTiles(n);
  }
}

/**
 * Translate to each corner, and draw the endTile if we are at the
 * end of the recursion, otherwise recursively draw tiles, starting
 * with the startTile in the corner we've translated to.
 */
void drawCorners(int n) {
  for (int i = 0; i < corners.length; ++i) {
    if (stopDrawing) return;
    pushMatrix();
    translate(stepLength*n*corners[i][0], stepLength*n*corners[i][1]);
    rotate(rotates[i]);
    if (n == 1)
      endTile.draw();
    else
      drawTiles(n/2);
    popMatrix();
  }
}

/**
 * Draw the appropriate tiles to each side of startTile
 */
void drawSides() {
  for (int i = 0; i < sides.length; ++i) {
    if (stopDrawing) return;
    pushMatrix();
    translate(stepLength*sides[i][0], stepLength*sides[i][1]);
    rotate(rotates[i]);
    tiles.get(tileIndices[i]).draw();
    popMatrix();
  }  
}

/**
 * Draw the last tiles along the axes with startTile at the origin.
 * k is iterated along the length of one side to translate appropriately
 * the appropriate tiles are hardcoded, where k==n is a special case
 */
void drawAxesTiles(int n) {
  for (int j = 0; j < sides.length; ++j) {
    for (int k = 1; k < n*2; ++k) {
      if (stopDrawing) return;
      pushMatrix();
      translate(stepLength*sides[j][0]*k, stepLength*sides[j][1]*k);
      rotate(rotates[j]);
      if (k == n) {
        if (j < 2)
          tiles.get(1).draw();
        else if (j < 3)
          tiles.get(3).draw();
        else
          tiles.get(5).draw();
      } else {
        if (j < 2)
          tiles.get(0).draw();
        else if (j < 3)
          tiles.get(2).draw();
        else
          tiles.get(4).draw();
      }
      popMatrix();
    }
  }
}

/**
 * This method is needed to recognize events from the
 * 'sizeList' DropdownList
 */
public void controlEvent(ControlEvent e) {
  // if we don't use this check, ControlP5 throws an exception
  if (e.isGroup()) {
    // set the new size
    int value = (int)e.group().getValue();
    setLengthVars(value);
    // new length of one side of the square of tiles
    int len = dim*4 - 1;
    // new max number of tiles
    int maxTiles = len*len;
    // keep proportionate number of tiles
    int newValue = (int)map(numTilesSlider.getValue(), 0, numTilesSlider.getMax(), 0, maxTiles);
    numTilesSlider.setMax(maxTiles)
                  .setValue(newValue);
  }
  
}

/**
 * Recognize events from the 'numTiles' Slider
 */
 public void numTiles(int value) {
   numTiles = value;
 }
 
 public void play() {
   play = !play;
 }
 
 /**
  * Recognize key events for numTiles slider
  *
  */
 void keyPressed() {
   if (keyCode == RIGHT || keyCode == UP)
     numTilesSlider.setValue(numTilesSlider.getValue() + 1);
   else if (keyCode == LEFT || keyCode == DOWN)
     numTilesSlider.setValue(numTilesSlider.getValue() - 1);
 }


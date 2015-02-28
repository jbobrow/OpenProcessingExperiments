
Grid grid;
PImage texture1, texture2, texture3;

boolean shapeMode;//display shapes or images
boolean paused;
boolean dark;//light or dark mode

void setup() {
  size(860, 500);
  shapeMode = true;
  texture1 = loadImage("hexIMG.png");
  texture2 = loadImage("hexIMG_2.png");
  texture3 = loadImage("hexIMG_3.png");
  grid = new Grid(3);
}

void draw() {

  if (!paused) {
    if (dark) {
      fill(0, 50);
    }
    else {
      fill(255, 50);
    }
    rect(0, 0, width, height);
    if (frameCount%6==0) {
      grid.update();
      grid.refresh();
    }
    grid.display();
  }
}

void keyPressed() {
  if (key == 'p') {
    paused = !paused;
  }
  if (key == 'd') {
    dark = !dark;
  }
  if (key == 's') {
    shapeMode = !shapeMode;
  }
  if (key == 'r') {
    grid.initGrid();
  }
  if (key == '1') {
    grid.rules = new Rules(1);
  }
  if (key == '2') {
    grid.rules = new Rules(2);
  }
  if (key == '3') {
    grid.rules = new Rules(3);
  }
  if (key == '4') {
    grid.rules = new Rules(4);
  }
  if (key == '5') {
    grid.rules = new Rules(5);
  }
  if (key == '6') {
    grid.rules = new Rules(6);
  }
  if (key == '7') {
    grid.rules = new Rules(7);
  }
  if (key == '8') {
    grid.rules = new Rules(8);
  }
  if (key == '9') {
    grid.rules = new Rules(9);
  }
  if (key == '0') {
    grid.rules = new Rules(0);
  }
}


class Cell {
  float x, y;
  float w, h;
  int state;

  Cell (float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    state = getInitialState();//a random initial state between 0 and 3
  }
  
  int getInitialState() {
    float r = random(1);
    if (r > 0.9) {
      return 3;
    }
    else if (r > 0.8) {
      return 2;
    }
    else if (r > 0.7) {
      return 1;
    }
    else {
      return 0;
    }
  }      

  void display() {
    if (shapeMode) {
      if (dark) {
        fill(80*state, 30*state, 50*state, 60*state); 
      }
      else {
        fill(255 - 70*state, 255 - 20*state, 255 - 40*state, 60*state);
      }
      noStroke();
      beginShape();
      vertex(x, y + h/2);//left
      vertex(x + w/4, y);//top left
      vertex(x + 3*w/4, y);//top right
      vertex(x + w, y+ h/2);//right
      vertex(x + 3*w/4, y + h);//bottom right
      vertex(x + w/4, y + h);//bottom left
      vertex(x, y + h/2);//left
      endShape();
    }
    else {
      if (dark) {
        tint(80*state, 30*state, 50*state, 180-20*state);
      }
      else {
        tint(255 - 70*state, 255 - 20*state, 255 - 40*state, 180-20*state);
      }
      if (state == 1) {
        image(texture3, x-w/2, y-h/2);
      }
      else if(state ==2) {
        image(texture2, x-w/2, y-h/2);
      }
      else if(state ==3) {
        image(texture1, x-w/2, y-h/2);
      }
    }

  }
}
class Grid {
  float h;//hex height
  float w;//hex width
  int cols;
  int rows;
  Cell[][] grid;
  int[][] gridBuffer;
  Rules rules;


  Grid(int ruleNum) {
    rules = new Rules(ruleNum);
    h = 16;
    w = 20;
    cols = int(width/(w-5))-1;
    rows = int(height/h);
    grid = new Cell[cols][rows];
    gridBuffer = new int[cols][rows];
    initGrid();
  }

  void initGrid() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (c%2 == 0) {
          grid[c][r] = new Cell(6+ c*(w-5), h/2 + r*h, w, h);
        }
        else {
          grid[c][r] = new Cell(6+ c*(w-5), r*h, w, h);
        }
      }
    }
  }

  void update() {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        int neighbors = countNeighbors(c, r);
        int state = grid[c][r].state;
        gridBuffer[c][r] = state + rules.ruleSet[state].n[neighbors];
      }
    }
  }

  void refresh() {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        grid[c][r].state = gridBuffer[c][r];
      }
    }
  }

  int countNeighbors(int c, int r) {
    int neighbors = 0;
    int low, hi, low2, hi2;
    low = c-1;
    hi = c+1;
    low2 = r-1;
    hi2 = r+1;
    if (c == 0) {  //left edge
      low = cols-1;
    }
    else if (c == cols-1) {//right edge
      hi = 0;
    }
    if (r == 0) { //top edge
      low2 = rows-1;
    }
    else if (r == rows-1) {//bottom edge
      hi2 = 0;
    }   

    if (c%2==0) { //even columns
      if (grid[low][hi2].state > 0) {
        neighbors += 1;
      }//look left and up
      if (grid[hi][hi2].state > 0) {
        neighbors += 1;
      }// look right and up
    }
    else { //odd columns
      if (grid[low][low2].state > 0) {
        neighbors += 1;
      }//look left and down
      if (grid[hi][low2].state > 0) {
        neighbors += 1;
      }//look left and down
    }
    if (grid[hi][r].state > 0) {
      neighbors += 1;
    }//directly right
    if (grid[low][r].state > 0) {
      neighbors += 1;
    }//directly left
    if (grid[c][low2].state > 0) {
      neighbors += 1;
    }//directly up
    if (grid[c][hi2].state > 0) {
      neighbors += 1;
    }//directly down
    return neighbors;
  }

  void display() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {      
        grid[c][r].display();
      }
    }
  }
}

class Rules {
  Rule[] ruleSet;

  Rules(int r) {
    ruleSet = new Rule[4];
    
    if (r == 0) {
      ruleSet[0] = new Rule( 0, 0, 0, 1, 0, 1, 0);
      ruleSet[1] = new Rule(-1, -1, -1, 0, 0, 1, -1);
      ruleSet[2] = new Rule(-2, -1, -1, 0, 1, -1, -2);
      ruleSet[3] = new Rule(-3, -2, -1, 0, -1, -2, -3);
    }
    else if (r == 1) {
      ruleSet[0] = new Rule( 0, 0, 0, 1, 0, 0, 0);
      ruleSet[1] = new Rule(-1, -1, 0, 1, -1, -1, -1);
      ruleSet[2] = new Rule(-2, -1, 0, 1, -2, -2, -2);
      ruleSet[3] = new Rule(-2, -2, 0, 0, -2, -2, -2);
    }
    else if (r == 2) {
      ruleSet[0] = new Rule( 0, 0, 0, 1, 0, 0, 0);
      ruleSet[1] = new Rule(-1, -1, 0, 1, -1, -1, -1);
      ruleSet[2] = new Rule(-2, -1, 0, 1, -2, -2, -2);
      ruleSet[3] = new Rule(0, -2, 0, 0, -1, -3, -3);
    }
    else if (r == 3) {
      ruleSet[0] = new Rule( 0, 0, 0, 1, 0, 0, 0);
      ruleSet[1] = new Rule(-1, -1, 0, 1, -1, -1, -1);
      ruleSet[2] = new Rule(-2, -2, 0, 1, -2, -2, -2);
      ruleSet[3] = new Rule(0, -1, 0, 0, -1, -2, -3);
    }
    else if (r == 4) {
      ruleSet[0] = new Rule( 0, 0, 0, 3, 0, 0, 0);
      ruleSet[1] = new Rule(-1, 0, 0, -1, -1, -1, -1);
      ruleSet[2] = new Rule(-2, 0, 0, -1, -1, -2, -2);
      ruleSet[3] = new Rule(-3, 0, 0, -1, -3, -3, -3);
    }
    else if (r == 5) {
      ruleSet[0] = new Rule( 0, 0, 0, 3, 0, 0, 0);
      ruleSet[1] = new Rule(-1, 0, 0, -1, -1, -1, -1);
      ruleSet[2] = new Rule(-2, -1, 0, -1, -1, -2, -2);
      ruleSet[3] = new Rule(0, 0, 0, -1, -3, -3, -3);
    }
    else if (r == 6) {
      ruleSet[0] = new Rule( 0, 0, 0, 1,  0, 0,  0);
      ruleSet[1] = new Rule(-1, 0, 0, 1,  -1, -1, -1);
      ruleSet[2] = new Rule(-1, 0, 0, 1,  -2, -2, -2);
      ruleSet[3] = new Rule( 0, 0, 0, -3, -3, -3,  -3);
    }
    else if (r == 7) {
      ruleSet[0] = new Rule( 0, 0,  0,  3,   0,  0,  0);
      ruleSet[1] = new Rule(-1, -1, -1, -1,  -1, -1, -1);
      ruleSet[2] = new Rule(-2, -2, -2, -2,  -2, -2, -2);
      ruleSet[3] = new Rule( -3, 0, 0, 0, 0, -3,  -3);
    }
    else if (r == 8) {
      ruleSet[0] = new Rule( 0,  0,  0,  3,  3,  0,  0);
      ruleSet[1] = new Rule(-1,  -1, -1,-1,  -1, -1, -1);
      ruleSet[2] = new Rule(-2,  -2,  -2,  -2,  -2, -2, -2);
      ruleSet[3] = new Rule( -3, 0,  0,  0, -3, -3,  -3);
    }
    else if (r == 9) {
      ruleSet[0] = new Rule( 0,  0,  0,  1,  1,  0,  0);
      ruleSet[1] = new Rule(-1,  0,  0,  1,  -1, -1, -1);
      ruleSet[2] = new Rule(-2,  0,  0,  1,  -2, -2, -2);
      ruleSet[3] = new Rule( -3, 0,  0,  0, -3, -3,  -3);
    }
  }
}

class Rule {
  int[] n;

  Rule (int v0, int v1, int v2, int v3, int v4, int v5, int v6) {
    n = new int[7];
    n[0] = v0;
    n[1] = v1;
    n[2] = v2;
    n[3] = v3;
    n[4] = v4;
    n[5] = v5;
    n[6] = v6;
  }
}





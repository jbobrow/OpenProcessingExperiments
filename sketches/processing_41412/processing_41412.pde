
PFont font;

int cols = 30; //dimensions of the grid
int rows = 45;
int dim = 10; //size of squares
int colA = 354; //x coords of squares in rule table
int colB = 366;
int colC = 378;
int colD = 421;
int colE = 433;
int colF = 445;
int colG = 330; //L and Right of rect
int colH = 475;
int rowA = 150; //y coords of squares in rule table
int rowB = 230;
int rowC = 310;
int rowD = 390;
int gridTop = 58; //top of grid
int topButtonA = 24; //y coord of tops of rand and clr buttons
int topButtonB = 465; //y coord of top of clr all button
int textOffsetY = 7; //text offset from bottom of all buttons
int buttonThickness = 25; //y dim of buttons
int textYA, textYB; //y height of text, determined by formula in setup method
int rectWid; //x dim of rect behind rule table

Cell[] rules = new Cell[8]; //array specifying automaton rules
Cell[][] grid = new Cell[cols][rows]; //grid
Cell randomize, clear, resetAll; //buttons

void setup() {
  size(500, 535);
  textYA = topButtonA + buttonThickness - textOffsetY;
  textYB = topButtonB + buttonThickness - textOffsetY;
  rectWid = colH - colG;
  font = loadFont("Futura-Medium-14.vlw");
  textFont(font);
  for(int g = 0; g < 4; g++) { //inits rules boxes
    for(int h = 0; h < 2; h++) {
      rules[2*g + h] = new Cell(colB + 67*h, rowA + (rowB-rowA)*g + dim + 2, dim, dim, false);
    }
  }
  for(int i = 0; i < cols; i++) { //inits rest of grid
    for(int j = 0; j < rows; j++) {
      if(j == 0) {
        grid[i][j] = new Cell(dim + dim*i, gridTop + dim*j, dim, dim, false);
      } else {
      grid[i][j] = new Cell(dim + dim*i, gridTop + 2 + dim*j, dim, dim, false);
      }
    }
  }
  randomize = new Cell(162, topButtonA, 88, buttonThickness, false); //inits buttons
  clear = new Cell(260, topButtonA, 50, buttonThickness, false);
  resetAll = new Cell(370, topButtonB, 70, buttonThickness, false);
}

void draw() {
  background(127);
  drawLegend(); //display the boxes used as the legend for the rules
  for(int a=0; a < 8; a++) { //display the rules boxes
    rules[a].display();
  }
  for(int c=0; c < cols; c++) { //display the grid
    for(int d=0; d < rows; d++) {
      grid[c][d].display();
    }
  }
  randomize.dispAsButton(); //draw in the buttons
  clear.dispAsButton();
  resetAll.dispAsButton();
  fill(0);
  text("Randomize", 171, textYA); //draw the text
  text("Clear", 269, textYA);
  text("Reset All", 378, textYB);
}

void mousePressed() { //what happens when the mouse is clicked
  int m = mouseX;
  int n = mouseY;
  if(randomize.iGotClicked(m, n)) { //handles response from "randomize" button
    for(int q = 0; q < cols; q++) {
      grid[q][0].setRandom();
    }
    randomize.clickFeedback();
  }
  if(clear.iGotClicked(m, n)) { //handles response from "clear" button
    for(int t = 0; t < cols; t++) {
      grid[t][0].setState(false);
    }
    clear.clickFeedback();
  }
  if(resetAll.iGotClicked(m, n)) { //handles response from "reset all" button
    for(int r = 0; r < cols; r++) {
      grid[r][0].setState(false);
    }
    for(int s = 0; s < 8; s++) {
      rules[s].setState(false);
    }
    resetAll.clickFeedback();
  }
  for(int a = 0; a < 8; a++) { //checks if it was a rules box that got clicked
    if(rules[a].iGotClicked(m, n)) {
      rules[a].flipState();
    }
  }
  for(int b = 0; b < cols; b++) { //checks if it was a cell in the first row of the grid that got clicked
    if(grid[b][0].iGotClicked(m, n)) {
      grid[b][0].flipState();
    }
  }
  for(int d = 1; d < rows; d++) { //changes the cells in the rest of the grid accordingly
    for(int c = 0; c < cols; c++) {
      grid[c][d].setState(calculate(c, d-1));
    }
  }
}

boolean calculate(int v, int w) { //determines whether a given square is black or white based on the rules provided in rules[]
  if((v > 0) && (v < (cols - 1))) {
    if((grid[v-1][w].returnState() && grid[v][w].returnState()) && grid[v+1][w].returnState()) {
      return rules[0].returnState();
    } else if((grid[v-1][w].returnState() && grid[v][w].returnState()) && !grid[v+1][w].returnState()) {
      return rules[1].returnState();
    } else if((grid[v-1][w].returnState() && !grid[v][w].returnState()) && grid[v+1][w].returnState()) {
      return rules[2].returnState();
    } else if((grid[v-1][w].returnState() && !grid[v][w].returnState()) && !grid[v+1][w].returnState()) {
      return rules[3].returnState();
    } else if((!grid[v-1][w].returnState() && grid[v][w].returnState()) && grid[v+1][w].returnState()) {
      return rules[4].returnState();
    } else if((!grid[v-1][w].returnState() && grid[v][w].returnState()) && !grid[v+1][w].returnState()) {
      return rules[5].returnState();
    } else if((!grid[v-1][w].returnState() && !grid[v][w].returnState()) && grid[v+1][w].returnState()) {
      return rules[6].returnState();
    } else {
      return rules[7].returnState();
    }
  } else if(v == 0) {
     if(grid[v][w].returnState() && grid[v+1][w].returnState()) {
      return rules[4].returnState();
    } else if(grid[v][w].returnState() && !grid[v+1][w].returnState()) {
      return rules[5].returnState();
    } else if(!grid[v][w].returnState() && grid[v+1][w].returnState()) {
      return rules[6].returnState();
    } else {
      return rules[7].returnState();
    }
  } else {
    if(grid[v-1][w].returnState() && grid[v][w].returnState()) {
      return rules[1].returnState();
    } else if(grid[v-1][w].returnState() && !grid[v][w].returnState()) {
      return rules[3].returnState();
    } else if(!grid[v-1][w].returnState() && grid[v][w].returnState()) {
      return rules[5].returnState();
    } else {
      return rules[7].returnState();
    }
  }
}  

void drawLegend() { //displays all static elements
  stroke(180);
  fill(180);
  rect(dim, topButtonA-5, 142, 40);
  rect(colG, gridTop, rectWid, 375);
  stroke(255);
  fill(255);
  rect(colF, rowA, dim, dim);
  rect(colB, rowB, dim, dim);
  rect(colE, rowB, dim, dim);
  rect(colF, rowB, dim, dim);
  rect(colA, rowC, dim, dim);
  rect(colD, rowC, dim, dim);
  rect(colF, rowC, dim, dim);
  rect(colA, rowD, dim, dim);
  rect(colB, rowD, dim, dim);
  rect(colD, rowD, dim, dim);
  rect(colE, rowD, dim, dim);
  rect(colF, rowD, dim, dim);
  stroke(0);
  fill(0);
  rect(colA, rowA, dim, dim);
  rect(colB, rowA, dim, dim);
  rect(colC, rowA, dim, dim);
  rect(colD, rowA, dim, dim);
  rect(colE, rowA, dim, dim);
  rect(colA, rowB, dim, dim);
  rect(colC, rowB, dim, dim);
  rect(colD, rowB, dim, dim);
  rect(colB, rowC, dim, dim);
  rect(colC, rowC, dim, dim);
  rect(colE, rowC, dim, dim);
  rect(colC, rowD, dim, dim);
  text("Click in row to edit", 22, textYA);
  text("Rule Table", 367, 85);
  textSize(12);
  text("(Click in red", 367, 110);
  text("squares to edit)", 359, 125);
  textSize(14);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(colB-1, rowA+11, dim+2, dim+2);
  rect(colB-1, rowB+11, dim+2, dim+2);
  rect(colB-1, rowC+11, dim+2, dim+2);
  rect(colB-1, rowD+11, dim+2, dim+2);
  rect(colE-1, rowA+11, dim+2, dim+2);
  rect(colE-1, rowB+11, dim+2, dim+2);
  rect(colE-1, rowC+11, dim+2, dim+2);
  rect(colE-1, rowD+11, dim+2, dim+2);
}

class Cell {
  int x, y; //dimensions of cell
  int w, h;
  boolean state; //on or off
  
  Cell(int tempX, int tempY, int tempW, int tempH, boolean tempState) { //constructor
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    state = tempState;
  }
  
  void display() { //draws the cell
    if(state == true) {
      stroke(0);
      fill(0);
    } 
    else {
      stroke(255);
      fill(255);
    }
    rect(x, y, w, h);
  }
  
  void dispAsButton() { //draws the cell as a button
    stroke(220);
    fill(180);
    rect(x, y, w, h);
    stroke(80);
    line(x, y+h, x+w, y+h);
    line(x+w, y, x+w, y+h);
  }
  
  void clickFeedback() { //turns the button a different color
    stroke(100);
    fill(100);
    rect(x, y, w, h);
  }
  
  boolean iGotClicked(int c, int d) { //returns if the button was clicked
    if(((c > x) && (c < x+w)) && ((d > y) && (d < y+h))) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean returnState() {
    return state;
  }
  
  void setState(boolean newState) {
    state = newState;
  }
  
  void flipState() {
    state = !state;
  }
  
  void setRandom() { //sets the state to random boolean
    float boole = random(1);
    if(boole < 0.5) {
      state = false;
    } else {
      state = true;
    }
  }
  
}


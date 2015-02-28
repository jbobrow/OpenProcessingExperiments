
//Reference: http://www.supermanoeuvre.com/blog/?p=486

import java.util.*;

/*------------------------------------------------------------------------------------------------------------------------------
 GLOBAL VARIABLES
 ------------------------------------------------------------------------------------------------------------------------------*/

SuperWorld WORLD;
int NUMCELLS = 10000;
int inc = 10;
int rectX;
int rectY;
float PERCENTOFF = 0.42;
float MINSIZE = 5.0;
float MAXSIZE = 30.0;
float[][] data = new float[10000][13];
float [][] data_20 = new float[20][13];
String [][] info_20 = new String[20][4];
String [] circleINFO = new String[4];
boolean lock = true;
boolean checkBox = false;


/*------------------------------------------------------------------------------------------------------------------------------
 *** INIT ***
 ------------------------------------------------------------------------------------------------------------------------------*/
void setup() {
  size(600, 400, P3D);
  background(0);
  frameRate(20);

  String [] lines = loadStrings("segment_10000.csv"); 
  for (int i=0; i< lines.length ;i++) {
    String line = lines[i];
    for (int j=0; j<line.split(",").length; j++) {
      data[i][j]=float(line.split(","))[j];
    }
  }
  
  lines = loadStrings("segment_20.csv"); 
  for (int i=0; i< lines.length ;i++) {
    String line = lines[i];
    for (int j=0; j<line.split(",").length; j++) {
      data_20[i][j]=float(line.split(","))[j];
    }
  }

  lines = loadStrings("info_20.csv"); 
  for (int i=0; i< lines.length ;i++) {
    String line = lines[i];
    for (int j=0; j<line.split(",").length; j++) {
      info_20[i][j]=line.split(",")[j]; 
    }
  }

  WORLD = new SuperWorld(NUMCELLS, data); // where we will store all our cell objects!
}

/*------------------------------------------------------------------------------------------------------------------------------
 *** MAIN ***
 ------------------------------------------------------------------------------------------------------------------------------*/
void draw() {
  //-------------------------------------------- GENERAL
  background(255);

  inc++;

  //-------------------------------------------- UPDATE WORLD
  WORLD.run(inc);

  //-------------------------------------------- DRAWBUTTONS
  drawButton();

  //-------------------------------------------- DRAWBOXES
  drawBox();

  //-------------------------------------------- TOOLTIP
  drawTooltip();
  
  if(checkBox){
    fill(0);
    rect(rectX,rectY,10,10);
  }
}

void mousePressed() {
  //-------------------------------------------- TOOLTIP
  lock = false;
  circleINFO = WORLD.getINFO();

  //-------------------------------------------- REDRAW CIRCLES
  int grpNUM = clickButton();
  if (grpNUM >0 && grpNUM != 20) {
    WORLD =new SuperWorld(grpNUM, data); // where we will store all our cell objects!
    inc = 0;
  }
  if (grpNUM == 20) {
    WORLD =new SuperWorld(grpNUM, data_20, info_20); // where we will store all our cell objects!
    inc = 0;
  }

  //-------------------------------------------- REDRAW COLORS
  int colIDX = clickBox();
  if (colIDX > 0 && colIDX < 11) {
    WORLD.setColor(colIDX - 1);
  }
}

void mouseReleased() {
  lock = true;
}

void drawButton() {
  fill(100);
  stroke(10);
  int yposButton = height*5/6;
  for (int xposButton=width/2-150;xposButton<width/2+150;xposButton+=60) {
    rect(xposButton, yposButton, 60, 25);
  }
  fill(255);
  textSize(16);
  String [] grpNUM = {"10", "20", "50", "500", "Raw"};
  int yposText = height*5/6+20;
  for (int xposText=width/2-150;xposText<width/2+150;xposText+=60) {
    text(grpNUM[(xposText-(width/2-150))/60], xposText+12, yposText);
  }
}

int clickButton() {
  int yposButton = height*5/6;
  int v=0;
  int [] grpNUM = {10, 20, 50, 500, 10000};
  for (int xposButton=width/2-150;xposButton<width/2+150;xposButton+=60) {
    if (mouseX > xposButton && mouseY > yposButton && mouseX < xposButton+60 && mouseY < yposButton+25) {
      v = grpNUM[(xposButton-(width/2-150))/60];
      checkBox = false;
    }
  }
  return v;
}

void drawBox() {
  fill(255);
  stroke(10);
  int xposBOX = width*5/6;
  for (int yposBox=height/11;yposBox<=height*10/11;yposBox+=height/11) {
    rect(xposBOX, yposBox, 10, 10);
  }
  fill(100);
  int xposText = width*5/6+20;
  textSize(20*height/800);
  String [] grpNAME = {
    "Grocery Stores", 
    "Automated Fuel", 
    "Restaurants", 
    "Fast Food", 
    "Pharmacies", 
    "Service Stations", 
    "Home Supply", 
    "Discount Stores", 
    "Book Stores", 
    "Department Stores"
  };
  for (int yposBox=height/11;yposBox<=height*10/11;yposBox+=height/11) {
    text(grpNAME[yposBox/(height/11)-1], xposText, yposBox+10);
  }
}

int clickBox() {
  int xposBox = width*5/6;
  int v=0;
  for (int yposBox=height/11;yposBox<=height*10/11;yposBox+=height/11) {
    if (mouseX > xposBox && mouseY > yposBox && mouseX < xposBox+10 && mouseY < yposBox+10) {
      v = yposBox/(height/11);
      checkBox = true;
      rectX = xposBox;
      rectY = yposBox;
    }
  }
  return v;
}

void drawTooltip() {
  if (!lock & circleINFO[0] != "offCircle") {
    fill(255, 200);
    noStroke();
    rect(mouseX, mouseY, 225, 100, 20);
    fill(0);
    textSize(14);
    text("Group " + circleINFO[0], mouseX + 5, mouseY + 20);
    text("Top 3 Categories: ", mouseX + 5, mouseY + 34);
    text(circleINFO[1], mouseX + 5, mouseY + 50);
    text(circleINFO[2], mouseX + 5, mouseY + 68);
    text(circleINFO[3], mouseX + 5, mouseY + 86);
  }
}

class SuperCell {

  /*------------------------------------------------------------------------------------------------------------------------------
   *** VARIABLES ***
   ------------------------------------------------------------------------------------------------------------------------------*/

  PVector pos;
  float cellRadius, rangeOfVision;
  color colR, colG, colB, colAlpha;
  float [] values = new float[10];
  int [][] colors = {
    {55, 87, 69},
    {216, 53, 242},
    {1, 188, 80},
    {204, 106, 4},
    {23, 60, 104},
    {150, 151, 172},
    {250, 3, 3},
    {252, 122, 0},
    {252, 0, 252},
    {8, 90, 1}};
  String[] info = {"N","mccA","mccB","mccC"};

  /*------------------------------------------------------------------------------------------------------------------------------
   *** CONSTRUCTOR ***
   ------------------------------------------------------------------------------------------------------------------------------*/

  SuperCell(PVector _P, float _RAD, float [] _VALUES) {
    this.pos           = _P;
    this.cellRadius    = _RAD;
    this.rangeOfVision = cellRadius*2.0;
    this.colR          = (int) 245;
    this.colG          = (int) 118;
    this.colB          = (int) 20;
    this.colAlpha      = (int) 150;
    this.values        = _VALUES;
  }
  
  
  SuperCell(PVector _P, float _RAD, float [] _VALUES, String[] _INFO) {
    this.pos           = _P;
    this.cellRadius    = _RAD;
    this.rangeOfVision = cellRadius*2.0;
    this.colR          = (int) 245;
    this.colG          = (int) 118;
    this.colB          = (int) 20;
    this.colAlpha      = (int) 150;
    this.values        = _VALUES;
    this.info          = _INFO;
  }

  /*------------------------------------------------------------------------------------------------------------------------------
   *** CLASS BEHAVIOUR ***
   ------------------------------------------------------------------------------------------------------------------------------*/
  void setColor(int _colIDX) {
    colR = int(colors[_colIDX][0]*(1-values[_colIDX]));
    colG = int(colors[_colIDX][1]*(1-values[_colIDX]));
    colB = int(colors[_colIDX][2]*(1-values[_colIDX]));
  }

  //-------------------------------------------------------------------- PRIMARY FUNCTION CALL 
  void run(ArrayList POP) {
    render();
    //    renderProximityGraph(POP);
  }

  //-------------------------------------------------------------------- DRAW THE CELL
  void render() {    
    pushStyle();
    noStroke();
    //stroke(colR, colG, colB);
    //strokeWeight(3);
    fill(colR, colG, colB, colAlpha);
    ellipse(pos.x, pos.y, cellRadius*2, cellRadius*2);
    popStyle();
  }

  //-------------------------------------------------------------------- DRAW PROXIMTY GRAPH
  //  void renderProximityGraph(ArrayList POP){
  //    pushStyle();
  //    for (int i=0; i < POP.size(); i++) {
  //      SuperCell otherCell = (SuperCell) POP.get(i);
  //      float d2 = pos.dist(otherCell.pos);
  //      if(d2 > 0 && d2 < rangeOfVision){
  //        stroke(100);
  //        strokeWeight(2);
  //        line(pos.x,pos.y,pos.z, otherCell.pos.x,otherCell.pos.y,otherCell.pos.z);
  //      }
  //    }
  //    popStyle();  
  //  }

  //-------------------------------------------------------------------- SET COLOURS
  void setCellColour(int _R, int _G, int _B) {
    this.colR       = _R;
    this.colG       = _G;
    this.colB       = _B;
  }

  //-------------------------------------------------------------------- SET TRANSPARENCY
  void setCellAlphaColour(int _A) {
    this.colAlpha   = _A;
  }

  /*------------------------------------------------------------------------------------------------------------------------------
   *** CLASS UTILS ***
   ------------------------------------------------------------------------------------------------------------------------------*/

  //-------------------------------------------------------------------- DISTANCE TO SIMULATION CENTRE
  float distanceToCenter() {
    PVector v2Centre = PVector.sub(new PVector(width/2, height/2), this.pos);
    return (float) v2Centre.mag();
  } 

  //-------------------------------------------------------------------- DISTANCE TO SIMULATION CENTRE
  PVector vectorToCenter() {  
    PVector v2Centre = PVector.sub(this.pos, new PVector(width/2, height/2)); 
    return  v2Centre.get();
  }

  //-------------------------------------------------------------------- INSIDE ANOTHER CELL???
  boolean isInside(PVector VVV) {
    PVector diff = PVector.sub(VVV, this.pos);
    float d2     = diff.mag();
    return d2 <= this.cellRadius;
  }

  //-------------------------------------------------------------------- INTERSECTS ANOTHER CELL???
  boolean intersects(SuperCell OTHER) {
    PVector diff = PVector.sub(OTHER.pos, this.pos);
    float d2     = diff.mag();
    return d2 < cellRadius || d2 < OTHER.cellRadius;
  }
}

int stableIteraions = 2000;


class SuperWorld {

  /*------------------------------------------------------------------------------------------------------------------------------
   *** VARIABLES ***
   ------------------------------------------------------------------------------------------------------------------------------*/
  int popSize;
  float[][] data;
  ArrayList cellPop;
  int colIDX = 3;
  String [][] info = new String[20][4];
  
  /*------------------------------------------------------------------------------------------------------------------------------
   *** CONSTRUCTOR ***
   ------------------------------------------------------------------------------------------------------------------------------*/
  SuperWorld(int _NUM, float[][] _DATA) {
    this.popSize = _NUM;
    this.data = _DATA;
    this.cellPop = new ArrayList(); // create a JAVA ArrayList to store our cells in
    this.makeCells(this.popSize);  // our custom function that makes all the cells
  }

  SuperWorld(int _NUM, float[][] _DATA, String[][] _INFO) {
    this.popSize = _NUM;
    this.data = _DATA;
    this.cellPop = new ArrayList(); // create a JAVA ArrayList to store our cells in
    this.info = _INFO;
    this.makeCells(this.popSize, this.info);  // our custom function that makes all the cells
  }

  /*------------------------------------------------------------------------------------------------------------------------------
   *** CLASS BEHAVIOURS ***
   ------------------------------------------------------------------------------------------------------------------------------*/

  //-------------------------------------------------------------------- PRIMARY FUNCTION CALL 
  void run(int clock) {    
    // DRAW CELLS
    for (int i=0; i < cellPop.size(); i++) {
      SuperCell tmpCell = (SuperCell) cellPop.get(i);
      tmpCell.run(this.cellPop);
    }     
    // COMPUTE INTERACTIONS
    if (clock < stableIteraions/this.popSize) {
      for (int i=1; i<this.popSize; i++) {
        iterateLayout(i);
      }
    }
  }

  int getSize() {
    return this.popSize;
  }
   
  void setColor(int _COL) {   
    // SET COLOR
    for (int i=0; i < cellPop.size(); i++) {
      SuperCell tmpCell = (SuperCell) cellPop.get(i);
      tmpCell.setColor(_COL);
    }
  }
  
  //-------------------------------------------------------------------- ITERATE POPULATION
  void iterateLayout(int iterationCounter) {

    Object cells[] = cellPop.toArray();
    Arrays.sort(cells, comp);

    //----------------------------- ENSURE SEPARATION
    SuperCell cellK, cellJ;
    PVector force = new PVector();
    // CHECK AGAINST ALL MEMBERS OF POPULATION
    for (int k = 0; k < cells.length; k++) {
      cellK = (SuperCell)cells[k];
      for (int j=k+1; j < cells.length; j++) {
        if (k != j) {
          cellJ = (SuperCell)cells[j];
          PVector diff = PVector.sub(cellJ.pos, cellK.pos);
          float r = cellJ.cellRadius + cellK.cellRadius;
          float d = (diff.x*diff.x) + (diff.y*diff.y) + (diff.z*diff.z);

          // APPLY FORCE IF REQUIRED
          if (d < (r * r) - 0.01 ) {
            force = diff.get();
            force.normalize();
            force.mult((r-sqrt(d))*0.5);           
            cellJ.pos.add(force);  // PULL        
            cellK.pos.sub(force);  // PUSH
          }
        }
      }
    }

    //----------------------------- POPULATION CONTRACTION
    float damping = 0.1/(float)(iterationCounter);
    for (int i = 0; i < cells.length; i++) {
      SuperCell tmpCell = (SuperCell)cells[i];
      PVector diff = tmpCell.vectorToCenter();
      diff.mult(damping);
      force = diff.get();
      tmpCell.pos.sub(force);
    }
  }

  float cx;
  float cy;
  //boolean overCircle = false;
  boolean locked = false;
  float xOffset = 0; 
  float yOffset = 0; 

  //  void checkCells() {
  //    Object cells[] = cellPop.toArray();
  //    for (int i = 0; i < cells.length; i++) {
  //      SuperCell tmpCell = (SuperCell)cells[i];
  //      cx = tmpCell.pos.x;
  //      cy = tmpCell.pos.y;
  //      if (overCircle (cx, cy, tmpCell.cellRadius*2)) {
  //        if (mousePressed) {
  //          xOffset = mouseX-cx; 
  //          yOffset = mouseY-cy;
  //          tmpCell.pos.set(mouseX-xOffset, mouseY-yOffset);
  //          println(tmpCell.colR);
  //          println(yOffset);
  //        }
  //      }
  //    }
  //  }
  
  void setINFO(String[][] _INFO){
    this.info = _INFO;
  }
  
  
  String [] getINFO() {
    String [] values = {
      "offCircle", "offCircle", "offCircle", "offCircle"
    }; 
    Object cells[] = cellPop.toArray();
    for (int i = 0; i < cells.length; i++) {
      SuperCell tmpCell = (SuperCell)cells[i];
      cx = tmpCell.pos.x;
      cy = tmpCell.pos.y;
      if (overCircle (cx, cy, tmpCell.cellRadius*2)) {
        values[0] = tmpCell.info[0];
        values[1] = tmpCell.info[1];
        values[2] = tmpCell.info[2];
        values[3] = tmpCell.info[3];
      }
    } 
    return values;
  }

  boolean overCircle(float x, float y, float diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }


  /*-------------------------------------------------------------
   *** JAVA COMPARATOR ***
   --------------------------------------------------------------*/
  Comparator comp = new Comparator() {
    public int compare(Object p1, Object p2) {
      SuperCell a = (SuperCell)p1;
      SuperCell b = (SuperCell)p2;
      if (a.distanceToCenter() < b.distanceToCenter()) 
        return 1;
      else if (a.distanceToCenter() > b.distanceToCenter())
        return -1;
      else
        return 0;
    }
  };

  /*------------------------------------------------------------------------------------------------------------------------------
   *** CLASS UTILS ***
   ------------------------------------------------------------------------------------------------------------------------------*/

  //-------------------------------------------------------------------- MAKE CELLS
  void makeCells(int NUM) {
    for (int i = 0; i < NUM; ++i) {
      //cellPop.add(new SuperCell(new PVector(random(width), random(height)), random(MINSIZE, MAXSIZE), 255 ));
      //cellPop.add(new SuperCell(new PVector(random(width), random(height)), MINSIZE, input ));
      int xpos = int(data[i][0]);
      int ypos = int(data[i][1]);
      int min = max(int(sqrt(height*height/(NUM*2))/2), int(10*data[i][2]));
      int max = min(int(sqrt(height*height/NUM)/2), int(10*data[i][2])); 
      int radius = (min > max) ? max : min;
      cellPop.add(new SuperCell(new PVector(xpos, ypos), radius, Arrays.copyOfRange(data[i], 3, 13)));
    }
  }
  
  void makeCells(int NUM, String [][] _INFO) {
    for (int i = 0; i < NUM; ++i) { 
      //cellPop.add(new SuperCell(new PVector(random(width), random(height)), random(MINSIZE, MAXSIZE), 255 ));
      //cellPop.add(new SuperCell(new PVector(random(width), random(height)), MINSIZE, input ));
      int xpos = int(data[i][0]);
      int ypos = int(data[i][1]);
      int min = max(int(sqrt(height*height/(NUM*2))/2), int(10*data[i][2]));
      int max = min(int(sqrt(height*height/NUM)/2), int(10*data[i][2])); 
      int radius = (min > max) ? max : min;
      //println(info[i][1]);
      cellPop.add(new SuperCell(new PVector(xpos, ypos), radius, Arrays.copyOfRange(data[i], 3, 13), _INFO[i]));
    }
  }

  //-------------------------------------------------------------------- MAKE CELLS
  void reset() {
    cellPop.clear();
    makeCells(this.popSize);
  }
}




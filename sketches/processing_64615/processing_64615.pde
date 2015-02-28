
//  Title: Radiolaria
//  Description: A hexagonal grid manipulator meant to generate designs that are reminiscent of radiolaria
//  Date Started: 2012 Jun
//  Last Modified: 2012 Jun
//  http://www.asymptoticdesign.org/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
int numRows = 50;
int numColumns = 50;
PVector[][] gridArray = new PVector[numColumns+1][numRows+1];
int attract = 1; //this is the direction of the distorting force
int state = 1; //1 add gives rotational forces, -1 gives source/sink behavior
roundPoly blob;

//-----------------Setup
void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
  strokeWeight(2);
  stroke(255);
  noFill();
  createGrid();
  drawHex();
}

//-----------------Main Loop
void draw(){
  background(0);
  //draw our hexagonal grid from the grid points
  drawHex(); 
  if (state == 1) {
    //if our force is rotational, make the cursor green
    stroke(0,255,0);
  }
  else {
    //if our force is translational, make the cursor blue
    stroke(0,0,255);
  }
  //draw the cursor
  ellipse(mouseX,mouseY,5,5);
  stroke(255);
}

//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
      saveFrame("radiolarianGrid-###.png");
  }
  if (key == 'p') {
    //swap the _p_olarity of the force
    attract = -1*attract;
  }
  if (key == 'C') {
    //_C_lear the screen
    createGrid();
  }
  if (key == 'T') {
    //change the _t_ransformation character (rotation or source/sink)
    state = -1 * state;
  }
}

void mousePressed() {
  //update the grid to include the effects of our distortion point
  updateGrid();
}

//-----------------Defined Functions
void createGrid() {
  //create an array of PVectors
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      //use .x and .y to store starting position of the nodes
      gridArray[i][j] = new PVector(i*width/numColumns,j*height/numRows);
    }
  }
}

void updateGrid() {
  //update the position of every node
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      //create a vector with the mouse position
      PVector mouse = new PVector(mouseX,mouseY);
      //calculate the distance between the node and the cursor
      float d = gridArray[i][j].dist(mouse);
      //calculate the force as (gridPoint - mousePoint)/(0.05*d)
      mouse.sub(gridArray[i][j].get());
      mouse.div(0.0025*d*d);
      //update the grid array depending on the force's state
      if (state == 1) {
        gridArray[i][j].x = gridArray[i][j].x - attract*mouse.y;
        gridArray[i][j].y = gridArray[i][j].y + attract*mouse.x;
      }
      if (state == -1) {
        gridArray[i][j].x = gridArray[i][j].x + attract*mouse.x;
        gridArray[i][j].y = gridArray[i][j].y + attract*mouse.y;
      }
    }
  }
}

void drawHex() {
  //draw the hexagonal grid.  Weird index stuff is to make the hexagonal staggering work out
  for(int i = 0; i < numColumns-4; i+=6) {
    for(int j = 0; j < numRows-2; j+=2) {
      if ((j % 4) == 0) {
        float[] x = {gridArray[i+1][j].x,gridArray[i+3][j].x,gridArray[i+4][j+2].x,gridArray[i+3][j+4].x,gridArray[i+1][j+4].x,gridArray[i][j+2].x};
        float[] y = {gridArray[i+1][j].y,gridArray[i+3][j].y,gridArray[i+4][j+2].y,gridArray[i+3][j+4].y,gridArray[i+1][j+4].y,gridArray[i][j+2].y};
        blob = new roundPoly(x, y);
        blob.display();
      }
      else {
        float[] x = {gridArray[i+4][j].x,gridArray[i+6][j].x,gridArray[i+7][j+2].x,gridArray[i+6][j+4].x,gridArray[i+4][j+4].x,gridArray[i+3][j+2].x};
        float[] y = {gridArray[i+4][j].y,gridArray[i+6][j].y,gridArray[i+7][j+2].y,gridArray[i+6][j+4].y,gridArray[i+4][j+4].y,gridArray[i+3][j+2].y};
        blob = new roundPoly(x, y);
        blob.display();
      } 
    }
  }
}

//-----------------Defined Classes
class roundPoly {
  //use bezierVertex to create rounded shapes.  The nodes serve as control points, and the 'endpoints' are the midpoints connecting nodes.
  float[] x, y; 
  float[] xOffset, yOffset; 
  int numPoints; 

  roundPoly(float[] x, float[] y) {
    this.x = x;
    this.y = y;
    this.numPoints = x.length; 
    this.xOffset = new float[numPoints]; 
    this.yOffset = new float[numPoints];
  } 
  
  void display() { 
    for (int i = 0; i < numPoints; i++) { 
      float dx = x[i] - x[(i + 1) % numPoints]; 
      float dy = y[i] - y[(i + 1) % numPoints]; 
      xOffset[i] = x[i] - (dx/2); 
      yOffset[i] = y[i] - (dy/2);
    }   
    
    beginShape(); 
    vertex(xOffset[numPoints-1], yOffset[numPoints-1]); 
    for (int i = 0; i < numPoints; i++) { 
      bezierVertex(x[i], y[i], x[i], y[i], xOffset[i], yOffset[i]);
    } 
    endShape();
  }
} 


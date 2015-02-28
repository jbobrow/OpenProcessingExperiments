
//  Title: Blob Grid with Force
//  Description: A grid of rounded polygons with a mouse-derived force that rotates the shapes.
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
int numRows = 10;
int numColumns = 10;
PVector[][] gridArray = new PVector[numColumns+1][numRows+1];
PVector[][] forceArray = new PVector[numColumns+1][numRows+1];
float scale = 1.0;
int delta = 10;
int attract = 1;
int pointX, pointY;
roundedShape blob;

//-----------------Setup
void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
  stroke(255);
  noFill();
  createGrid();
  drawBlobs();
}

//-----------------Main Loop
void draw(){
  background(0);
  updateGrid();
  drawBlobs(); 
}
//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
      saveFrame("blobGrid-###.png");
  }
}

void mousePressed() {
  attract = -1*attract;
}

//-----------------Defined Functions
void createGrid() {
  //create an array of PVectors, 10x10
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      //use .x and .y to store starting position of the nodes
      gridArray[i][j] = new PVector(i*width/numColumns,j*height/numRows);
      //use forceArray add the deflection due to the 'force'
      forceArray[i][j] = new PVector(i*width/numColumns,j*height/numRows);
    }
  }
}

/*
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
      mouse.div(0.05*d);
      //put it into the forceArray
      forceArray[i][j].x = gridArray[i][j].x + attract*mouse.x;
      forceArray[i][j].y = gridArray[i][j].y + attract*mouse.y;
    }
  }
}
*/

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
      mouse.div(0.001*d*d);
      //put it into the forceArray
      forceArray[i][j].x = gridArray[i][j].x - attract*mouse.y;
      forceArray[i][j].y = gridArray[i][j].y + attract*mouse.x;
    }
  }
}
  
void drawBlobs() {
  //acts similar to beginShape(QUAD), but draws rounded polygons instead
  for(int i = 0; i < numColumns; i++) {
    for(int j = 0; j < numRows; j++) {
      float[] x = {forceArray[i][j].x,forceArray[i+1][j].x,forceArray[i+1][j+1].x,forceArray[i][j+1].x};
      float[] y = {forceArray[i][j].y,forceArray[i+1][j].y,forceArray[i+1][j+1].y,forceArray[i][j+1].y};
      blob = new roundedShape(x, y);
      blob.display();
    }
  }
}

//-----------------Defined Classes
class roundedShape {
  //use bezierVertex to create rounded shapes.  The nodes serve as control points, and the 'endpoints' are the midpoints connecting nodes.
  float[] x, y; 
  float[] xOffset, yOffset; 
  int numPoints; 

  roundedShape(float[] x, float[] y) {
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



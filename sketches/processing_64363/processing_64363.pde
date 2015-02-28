
//  Title: Blob Grid
//  Description: 
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
int delta = 10;
boolean locked = false;
int pointX, pointY;
roundedShape blob;

//-----------------Setup
void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
  noStroke();
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
  //for every grid node
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      //if the mouse is within delta of the node
      if ((mouseX < gridArray[i][j].x + delta && mouseX > gridArray[i][j].x - delta) && ((mouseY < gridArray[i][j].y + delta && mouseY > gridArray[i][j].y - delta))) {
        //lock the node to the mouse and allow the use to drag it
        locked = true;
        pointX = i;
        pointY = j;
      }
    }
  }
}

void mouseDragged() {
  //if node is locked to cursor, keep updating its position
  if(locked) {
    gridArray[pointX][pointY].x = mouseX;
    gridArray[pointX][pointY].y = mouseY;
  }
}

void mouseReleased() {
  //when user releases the mouse button, unlock the node to 'drop' it off onto the grid.
  locked = false;
}

//-----------------Defined Functions
void createGrid() {
  //create an array of PVectors, 10x10
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      //use .x and .y to store position of the nodes
      //z component being used to store perlin noise seed
      gridArray[i][j] = new PVector(i*width/numColumns+random(10),j*height/numRows+random(10),random(10));
    }
  }
}

void updateGrid() {
  //update the position of every node
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      //increase Perlin noise seed
      gridArray[i][j].z += 0.1;
      //modify placement of grid nodes
      gridArray[i][j].x += noise(gridArray[i][j].z) - 0.5;
      gridArray[i][j].y -= noise(gridArray[i][j].z) - 0.5;
    }
  }
}

  
void drawBlobs() {
  //acts similar to beginShape(QUAD), but draws rounded polygons instead
  for(int i = 0; i < numColumns; i++) {
    for(int j = 0; j < numRows; j++) {
      float[] x = {gridArray[i][j].x,gridArray[i+1][j].x,gridArray[i+1][j+1].x,gridArray[i][j+1].x};
      float[] y = {gridArray[i][j].y,gridArray[i+1][j].y,gridArray[i+1][j+1].y,gridArray[i][j+1].y};
      blob = new roundedShape(x, y);
      blob.display();
    }
  }
}

//-----------------Defined Classes
class roundedShape {
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



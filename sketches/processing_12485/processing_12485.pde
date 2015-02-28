
/*
  Patern 2: Regular grid using a for loop
 */

float objectSize = 10;
int heightCount = 10;
int widthCount = 35;


void setup() {
  size(640, 480);
  smooth();
  
  drawGrid();

}

void draw() {
  //nothing to do here right now 
}

void drawGrid() {
  background(0, 0, 0);
  noFill();
  //fill(128);
  
  //outside loop
  for (int j = 1; j < heightCount; j = j + 1) {
    
    //inside loop
    for (int i = 1; i < widthCount; i = i + 1) {
        
     
      //code inside both loops
      stroke(map(i + j, 1, 0, 0, 255), 245, 2);
      strokeWeight(3);
      smooth();
      
      rect(map(i, 0, widthCount, 0, width),
              map(j, 0, heightCount, 0, height),
              width, height);

      //end of loops code
        
    }
    //end of inner loop
    
  }
  //end of outer loops
  
}

void mouseMoved() {
  widthCount = floor(map( mouseX, 0, width, 1, 10));
  heightCount = floor(map( mouseY, 0, height, 1, 30));
  drawGrid();
 
}




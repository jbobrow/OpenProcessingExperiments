
//grid of arrows directed by mouse
//GLITTER PILLS
//interactive 2D animation
//Kawandeep Virdee
//www.whichlight.com
//interesting things happen when you change the direction of the 
// vector that is the difference between the mouse and the point. 


PVector[][] grid;
int width=750;
int height=500;
int resolution = 20;
int rows = height/resolution;
int cols = width/resolution;



void setup() {
  colorMode(HSB, 255);
  size(width,height);
  smooth();
  grid = new PVector[cols][rows];
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
      grid[i][j] = new PVector(i*(resolution),j*(resolution));
    }
  }

}

void draw() {
  background(255);
  
  // A "vector" (really a point) to store the mouse location and screen center location
  PVector mouseLoc = new PVector(mouseX,mouseY);
  
  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      // Oscillate and display each object
      
      // make it grid - mouse to see like 3D
      //make it mouse - grid to have all vectors point to mouse
      PVector v = PVector.sub(grid[i][j], mouseLoc);
      color arrowColor = color((random(255)), 255, 255, 100);
      drawVector(v,grid[i][j],0.1f, arrowColor);
    }
  }
  
  // Aha, a vector to store the displacement between the mouse and center
  
  
  // Render the vector
  
  

}

// Renders a vector object 'v' as an arrow and a location 'loc'
void drawVector(PVector v, PVector loc, float scayl, color arrowcolor) {
  pushMatrix();
  float arrowsize = 1;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(arrowcolor);
  strokeWeight(10);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
//  line(len,0,len-arrowsize,+arrowsize/2);
//  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}

void mousePressed(){
  saveFrame();
}





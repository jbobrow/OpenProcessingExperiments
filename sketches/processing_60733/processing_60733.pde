
//Diana Chen
//cdiana@cmu.edu

float[] horizontal = new float[200]; //set array for x values up to 200
float[] vertical = new float[200]; // set array for y values up to 200
  
void setup() {
  size(500, 500);
  smooth();
    
  for (int i=0; i < horizontal.length; i++) { //upon each setup, set the starting ellipse at a random place
    horizontal[i] = random(width); // random number between 0 and width
    vertical[i] = random(height); // random number between 0 and height
  }
}
  
void draw() {
  background(255);
    
  int numObject = int(map(mouseY, 0, height, 1, horizontal.length)); // change number of ellipses based on horizontal position
    
  fill(mouseX, mouseY, 100, 100); // change fill color based on mouse position 
    
  for (int i=0; i < numObject; i++) {
    pushMatrix();
      translate(horizontal[i], vertical[i]);
      rect(0, 0, width/4, height/4);
    popMatrix();
  }
}




//



//from http://www.openprocessing.org/sketch/31602
 
//set global variables
color c = 255;
int t = 100;
int maxDistance = 100;
float jitter = 0.0;
  
void setup(){
     
  size(600, 600, P3D);
    
    
  //reduce frame-rate to allow 3D to function smoothly and also
  //prevents epilectic fits
  
}
  
  //if mouse is pressed continue loop, if released the loop is stopped
void mousePressed() {
  loop();
   
}
 
void draw() {
   frameRate(40);
   
  //set background
  background(jitter);
   
   
   
    
  //create double loop in order to form grid of objects spaced at 25 units
  //beginning at 0 and going to the end of screen
  for (int gridX = 0; gridX <= width; gridX = gridX + 100){
      
    for (int gridY = 0; gridY <= height; gridY = gridY + 100){
        
    //create mousePos and shapePos as PVector variables
    PVector mousePos, shapePos;
      
    //mousePos records position of mouse based on its x and y values
    mousePos = new PVector(mouseX, mouseY);
      
    //shapePos records the location of each box in the grid
    shapePos = new PVector(gridX, gridY);
      
    //diameter records the distance between the mouse and the position of each box
    float diameter = PVector.dist(mousePos,shapePos);
      
    //create some random variables that get regenerated each loop
    float r = random(3.14);
    float s = random(1);
    float u = random(1);
      
    //diameter becomes redefined by the oscillating sin function
    diameter = diameter / maxDistance * 2 * sin(r);
      
    //pushmatrix records the orignal coordinate system
    pushMatrix();
      
    //black stroke
    stroke(0);
      
    //random variables make for changeing colours... whoooo!!
    fill(mouseX,mouseY,jitter);
      
    //stroke weight set to 1
    strokeWeight(0);
      
    //the coordinate system translates 25 units across each gridX loop and 25 units
    //and 25 units down each gridY loop allowing the boxes to be allocated in a grid pattern.
    translate(gridX, gridY, diameter * 10-200);
      
    //oops I should have changed diameter to something like size of course!
    //think I just leave it though
    sphere(diameter);
      
    //popMatrix resets the orignal coordinate system recorded by the PushMatrix command.
    popMatrix();
  
    }
  }
}



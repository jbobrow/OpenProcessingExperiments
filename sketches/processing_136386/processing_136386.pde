
// Example 14-5: Rectangle rotating around center
float theta = 0;
int[] shape1Coords =  {0,0, 50,0, 50,50,  0,50};





                      
                      



void setup() {
  size(500,500);

}


void draw() {
  background(255);
  stroke(0);
  fill(0,225,255);
  rect(0,0,100,100); 
   rect(100,0,100,100); 
    rect(200,0,100,100); 
   rect(300,0,100,100); 
   rect(400,0,100,100); 
   rect(500,0,100,100); 
   rect(0,100,100,100); 
   rect(100,100,100,100); 
    rect(200,100,100,100); 
   rect(300,100,100,100); 
   rect(400,100,100,100); 
   rect(500,100,100,100); 
   rect(0,200,100,100); 
   rect(100,200,100,100); 
    rect(200,200,100,100); 
   rect(300,200,100,100); 
   rect(400,200,100,100); 
   rect(500,200,100,100); 
    rect(0,300,100,100); 
   rect(100,300,100,100);
    rect(200,300,100,100); 
   rect(300,300,100,100); 
   rect(400,300,100,100); 
   rect(500,300,100,100); 
      rect(0,400,100,100); 
   rect(100,400,100,100); 
    rect(200,400,100,100); 
   rect(300,400,100,100); 
   rect(400,400,100,100); 
   rect(500,400,100,100); 
  // Translate origin to center
 
   translate(height/2, width/2);
  
  // The greek letter, theta, is often used as the name of a variable to store an angle
  // The angle ranges from 0 to PI, based on the ratio of mouseX location to the sketch's width.
  theta =  theta + radians(1); 
  
  // Rotate by the angle theta
  //rotate(theta);
  
  // Display rectangle with CENTER mode
  fill ( 0, 255, 255); 
  pushMatrix();
  translate(25, 25);
  rotate(theta);
  translate(-25, -25);
  beginShape();
  for (int i = 0; i < shape1Coords.length; i += 2) {
    int x = shape1Coords[i];
    int y = shape1Coords[i + 1];
    vertex(x, y);
    

    
    

  }
  endShape();
  popMatrix();
}



/*

Basic #D
*/


void setup() {
  
 size(500,500, P3D);
 background(0);
  // smooth();
};

void draw() {
  //Clear the screen
  background(70,167,45);
  noStroke();
  lights();
  
  
 //Move to the center of the screen
   translate(width/Z, height/2);
 //Turn canvas
  rotateY( (float)mouseX/width * (PI * Z) ); //comment rotate Y
  rotateZ( (float)mouseY/width * (PI * Z) ); //comment rotate z
 
  //Draw a yellow box
  fill(255,200.0);
  box(100);
  
  pushMatrix();   //Leave a bookmark at the centre point of the sketch 
  
  //Draw a orange box
  translate(150,0);
  fill(55,100,0);
  box(10);
 
 popMatrix(); //Going back to the bookmark

 
  //Draw a pink box
  translate(-10,0);
  fill(255,100,100);
  box(100);
  
  
 
  
  pushMatrix();
  
  
   //Draw a blue sphere 
  translate(0,0,150);
  fill(25,100,100);
  sphere(4);
  
  popMatrix();

};


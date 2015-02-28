
/*

Basic #D
*/


void setup() {
  
 size(500,500, P3D);
 background(20,45,256);
  // smooth();
};

void draw() {
  //Clear the screen
  background(80);
  noStroke();
  lights();
  
  
 //Move to the center of the screen
   translate(width/Z, height/6);
 //Turn canvas
 rotateY( (float)mouseX/width * (PI * Z) ); //comment rotate z
 
  //Draw a yellow box
  fill(255,200,80);
  box(150);
  
  pushMatrix();   //Leave a bookmark at the centre point of the sketch 
  
  //Draw a orange box
  translate(150,0);
  fill(255,100,0);
  box(175);
 
 popMatrix(); //Going back to the bookmark

 
  //Draw a pink box
  translate(-150,0);
  fill(255,100,100);
  box(175);
  
  
 
  
  pushMatrix();
  
  
   //Draw a blue sphere 
  translate(150,150,150);
  fill(255,100,100);
  sphere(115);
  
  popMatrix();
 
  
  
};


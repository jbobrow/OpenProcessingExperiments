
/*///////////////////////////////////////////////////////////////
 ** Digital Etch A Sketch by Gabrielle Harte
 **
 ** Assignment 1: Interactive Drawing
/*///////////////////////////////////////////////////////////////


 
void setup() {
  //Size of Canvas
  size(400, 400);
  smooth();

  //Background in setup because it needs to 
  //remain static for 'drawing' effect
  background(200, 200, 196);
}

void draw() {

  // set up preferred shape making modes
  rectMode(CORNERS);
  ellipseMode(CENTER);


  //Drawing effect
  stroke(0);
  line(pmouseX, pmouseY, mouseX, mouseY);  

  //box of the Etch a Sketch
  noStroke();

  // Red color
  fill(214, 26, 20);

  //Top rectangle
  rect(0, 0, 20, 400);

  //Left rectangle
  rect(0, 0, 400, 20);

  //Right rectangle
  rect(400, 0, 380, 400);

  //Bottom rectangle (Larger then other sides)
  rect(0, 300, 390, 400);

  //Left rectangle Shadow
  fill(59, 10, 10);
  rect(30, 15, 20, 300);


  //Right Rectangle Light
  fill(255, 205, 205);
  rect(370, 20, 380, 300);

  //Bottom Rectangle Light
  rect(20, 290, 380, 300);


  //Top Rectangle Shadow
  fill(59, 10, 10);
  rect(380, 25, 30, 15);



  // Red Corners (to cut off shading rectangles
  fill(214, 26, 20);

  //Top left triangle 
  triangle (15, 30, 30, 15, 10, 15);

  //Top right triangle 
  triangle (385, 30, 370, 15, 390, 15);

  //Bottom left triangle 
  triangle (15, 280, 30, 300, 10, 305);

  //Bottom right triangle 
  triangle (385, 280, 370, 300, 390, 305);



  //Left analog Shadow
  fill(65, 25, 25);
  ellipse(35, 353, 50, 50);

  //Right analog shadow
  ellipse(375, 353, 50, 50);

  //Left analog
  fill(235);
  ellipse(30, 350, 50, 50);

  //Right analog
  ellipse(370, 350, 50, 50);



  //Left analog turn indicator
  fill(100);
  ellipse(43-mouseX/15, 355-mouseY/20, 20, 20);

  //Right analog turn indicator
  ellipse(357+mouseX/15, 335+mouseY/20, 20, 20);


}
// To Press any Key and reset the canvas for more drawing
void keyPressed() {
  background(200, 200, 196);
}

void mousePressed(){

//Instructions! 
 println("Hit any key to clean the canvas.");

}

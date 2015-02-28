
//homework 10
//copyright Paul Bracchitta October 2011 Pittsburgh PA 15289



void setup( )
{
  size( 500, 500, P3D);
  smooth();
  noCursor();
  
}


void draw( )
{
  background(0);
  
  translate( width/2, height/2, 0);
  rotateY(map(mouseX, 0,width/2, 0, TWO_PI));
  rotateX(map(mouseY, 0, height/2, 0,   TWO_PI));
  //rotateZ(map(mouseY, mouseX, width, 0,   TWO_PI));
  strokeWeight(3);
  fill(255, 120);
  stroke(255);
  //noFill();
  
  drawP();
  
}


void drawP()
{
  //start right column
  pushMatrix();
    translate( -30, -90, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, -60, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, -30, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 0, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 30, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 60, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 90, 30);
    box(30);
  popMatrix();
  //end right column
  
  //start left column
  pushMatrix();
    translate( 0, -90, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, -60, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0,-30, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 0, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 30, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 60, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 90, 30);
    box(30);
  popMatrix();
  //end left column
  
  //start right column
  pushMatrix();
    translate( -30, -90, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, -60, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, -30, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 0, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 30, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 60, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( -30, 90, 60);
    box(30);
  popMatrix();
  //end right column
  
  //start left column
  pushMatrix();
    translate( 0, -90, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, -60, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0,-30, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 0, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 30, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 60, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 0, 90, 60);
    box(30);
  popMatrix();
  //end left column
  
  pushMatrix();
    translate( 30, -90, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 30, -90, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 60, -80, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 60, -80, 30);
    box(30);
  popMatrix();
  
  
  
  
  pushMatrix();
    translate( 70, -50, 60);
    box(10, 50, 30);
  popMatrix();
  pushMatrix();
    translate( 70, -50, 30);
    box(10, 50, 30);
  popMatrix();
  
  pushMatrix();
    translate( 80, -60, 60);
    box(10, 30, 30);
  popMatrix();
  pushMatrix();
    translate( 80, -60, 30);
    box(10, 30, 30);
  popMatrix();
  pushMatrix();
    translate( 80, -30, 60);
    box(10, 30, 30);
  popMatrix();
  pushMatrix();
    translate( 80, -30, 30);
    box(10, 30, 30);
  popMatrix();
  
  pushMatrix();
    translate( 60, -10, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 60, -10, 30);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 30, 0, 60);
    box(30);
  popMatrix();
  pushMatrix();
    translate( 30, 0, 60);
    box(30);
  popMatrix();
  
}







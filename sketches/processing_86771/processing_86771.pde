
//Cristina Shin cshin1 Copyright Cristina Shin 1/24/2013
float x, y, wd, ht;

void setup( ) {

  x = width * .5;
  y = height * .5;
  wd = width * .4;
  ht = height * .4;
  
  
  size( 400, 400 );  
  background(255);
  smooth( );
}



void draw() {

    stroke(95, 196, 183 , 60);  
    strokeWeight(4);
    noFill( );
    rect(mouseX, mouseY, wd, ht);
  

  if (mousePressed == true) {
    stroke(175);
     strokeWeight( 2 );
    noFill( );
  } else {
    stroke(95, 196, 183 , 75);  
    noFill( );
  }
 rect(mouseX, mouseY, wd, ht);
  

 frameRate(20);
 
 
if (keyPressed) saveFrame( "hw3.jpg");

 
}

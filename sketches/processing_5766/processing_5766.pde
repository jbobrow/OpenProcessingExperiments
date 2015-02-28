
/*
*    dynamic composition
 *
 *    make a dynamic composition that consists of two parts that 
 *    react to the horizontal position of the mouse. the parts should
 *    be ralted in a way that if one grows the other one will shrink.
 */
void setup()
{
  size( 400, 400 );
  //colorMode(HSB, 100); 
  background(random (0));

}

void draw() {

  float left = width/4 ;
  float right = left * 2.5 ;

  float maus_value = map(mouseX, 0, width , 0, 200);
  float maus_value2 = map(mouseY,0, height, 0, 150);

  noStroke();
  smooth();

  fill( random(255));
  ellipse( left, height/2 , 200 - maus_value, 200-maus_value );
  ellipse( 300 , 0, maus_value2+20, maus_value2+20 );
  pushMatrix(); 
  ellipse( right, height/2, maus_value+20, maus_value+20 );
  ellipse( width/2 + 40 , height*8/10, maus_value2-20, maus_value2-20 );
  
 
  popMatrix();
  ellipse( right*2-50, height/2, maus_value+50, maus_value+50 );
  ellipse( right/2, height/4, maus_value+20, maus_value+20 );
  ellipse( right/2, height, maus_value2+20, maus_value2+20 );
}
void mousePressed() {
background (0 );
 
  
}


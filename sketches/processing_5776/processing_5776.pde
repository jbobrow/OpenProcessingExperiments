


void setup ()
{
  size( 600, 600);
  frameRate(200);
  background (255);

}


void draw ()
{

  float c = (abs(mouseX-pmouseX)+
             abs(mouseY-pmouseY));
  
  float cm = map(c,0,170,50,255);

  if (keyPressed) {
    
    background( 255 );
  }
  
  strokeWeight(c);
  fill(cm,0,0);
  stroke(cm,0,0);

  line ( pmouseX, pmouseY,mouseX, mouseY );

}



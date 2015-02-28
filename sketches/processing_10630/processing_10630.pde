
Monster mr; // Variable mr definieren, vom Datentyp monster

void setup ()
{
  smooth();
  size (600,600);
  background (255);
  frameRate(30);
 
  mr = new Monster();
 
}
 
 
 
void draw ()
 
{
 
  background(255);

  mr.zeichnen();

}
 
void mouseMoved ()
{
    mr.testMouseOver( mouseX, mouseY );
}
 
void mousePressed ()
{
    mr.testMousePressed( mouseX, mouseY );  
}
 
void mouseDragged ()
{
    mr.moveIfPressed( mouseX-pmouseX, mouseY-pmouseY );
}
 
void mouseReleased ()
{
    mr.released();
}


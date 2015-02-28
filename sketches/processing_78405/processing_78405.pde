
// Based on Moon by Diana Lange http://openprocessing.org/user/5969
// http://openprocessing.org/sketch/31151
//

void setup()
{
  size (450,450);
  smooth();
  background (5);
  noLoop();
   
  noFill();
  strokeWeight (0.5);
  stroke (255, 12);
}
 
void draw ()
{
  background (5);
   
  int dia = 120;
   
  for (int i = 0; i < 500; i++)
  {
  strokeWeight (random (0.1, 1));
  stroke(255);
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI);
    PVector p1 = new PVector (width/2 + cos (angle1) * dia, height/2 + sin (angle1) * dia);
    PVector p2 = new PVector (width/2 + cos (angle2) * dia, height/2 + sin (angle2) * dia);
     
    line (p1.x, p1.y, p2.x, p2.y);
  }

 
   for (int i = 0; i < 90; i++)
  {
  strokeWeight (random (0.2, 0.9));
  stroke(200);
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI);
    PVector p1 = new PVector (width/2 + cos (angle1) * dia, height/2 + sin (angle1) * dia);
    PVector p2 = new PVector (width/2 + cos (angle2) * dia, height/2 + sin (angle2) * dia);
     
    line (p1.x, p1.y, p2.x, p2.y);
  }
  
  
     for (int i = 0; i < 10; i++)
  {
 
  strokeWeight (random (0.5, 0.25));
  stroke(190,190,190);
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI);
    PVector p1 = new PVector (width/2 + cos (angle1) * dia, height/2 + sin (angle1) * dia);
    PVector p2 = new PVector (width/2 + cos (angle2) * dia, height/2 + sin (angle2) * dia);
     
    line (p1.x, p1.y, p2.x, p2.y);
  }
  
  
  
}
 
 void mousePressed ()
{
  //saveFrame ("moon.jpg");
  redraw();
}

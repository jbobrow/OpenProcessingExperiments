
import noc.*;

boolean showVectors = true;
boolean check = false;

Thing T;

void setup()
{
  size(640,480);
  T = new Thing(new Vector3D(1,1),new Vector3D(0,0),new Vector3D(420,100));
  translate(320,0);
  smooth();
  ellipseMode(CENTER);
  noStroke();
  fill(200);
}

void draw()
{
  background(0);
  T.go();  
}

void drawVector(Vector3D v, Vector3D l, float scayl)
{
  pushMatrix();
  translate(l.x,l.y);
  popMatrix();
}

void mousePressed()
{
  T = new Thing(new Vector3D(1,1),new Vector3D(0,0),new Vector3D(mouseX,mouseY));
}




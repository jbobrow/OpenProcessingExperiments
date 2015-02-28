
//Derek Kwong Mods 14/15
float rotatex=0.3;
float rotatey=0.3;
void setup()
{ 
  size(1000, 1000, P3D);
}

void draw()
{ 
  if (mouseButton==LEFT)
  { 
    background(0);
    stroke(0, 0, 255);
    lights();
    translate(mouseX, mouseY, 100);
    rotateY(rotatey/2);
    rotateX(rotatey);
    sphere(200);
    stroke(255, 0, 0);
    sphere(100);
    translate(-150, -150, -75);
    stroke(0, 255, 0);
    sphere(150);
  }
  if (mouseButton==RIGHT)
  { 
    background(0);
    stroke(0, 0, 255);
    rotateY(rotatey/2);
    rotateX(rotatey);
    translate(-mouseX, -mouseY, -100); 
    sphere(200);
    stroke(255, 0, 0);
    sphere(100);
    translate(-150, -150, -75);
    stroke(0, 255, 0);
    sphere(150);
  }
  if (keyPressed==true&& key=='w')
  {
    rotatex=rotatex+0.1;
    rotatey=rotatey+0.1;
    translate(mouseX, mouseY, 100);
  }
}

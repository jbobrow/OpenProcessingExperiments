
//ICE 6
//Copyright Christopher Henley 2014


void setup()
{
  size(400,400, P3D);
  background(0);
}

void draw()
{
  prepareWindow();
  placeShapes();
}

void placeShapes()
{
  fill(255);
  noStroke();
  
  box(30);
  
  pushMatrix();
  translate(100,0,0);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  translate(0,-100,0);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  translate(0,0,-100);
  sphere(20);
  popMatrix();
  
}

void prepareWindow()
{
  background(0);
  translate(width/2,height/2,0);
  rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  lights();
  stroke(255,0,0);
  strokeWeight(5);
  line(-100,0,0,100,0,0); //RED x axis
  stroke(0,255,0);
  line(0,-100,0,0,100,0); //GREEN y axis
  stroke(0,0,255);
  line(0,0,-100,0,0,100); //BLUE z axis
}





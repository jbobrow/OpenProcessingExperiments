
float X = -50;
float Y = -50;

void setup()
{
  size(600,600,P3D);
  noStroke();
}

void draw()
{
  pointLight(120,130,155,500,500,250);
  pointLight(155,120,130,0,0,250);
  pointLight(130,155,120,250,250,250);
  smooth(8);
  background(5);
  translate(0+X,0+Y,-20);
  rotateY(radians(X));
  rotateY(radians(Y));
  X=X+1;
  Y=Y+1;
  sphere(300);
  
  if(X >= 600)
  {
    X= -50;
    Y= -50;
  }
}


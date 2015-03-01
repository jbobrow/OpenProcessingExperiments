
float delta = 3;
float P = 200;
float X, Y;

void setup()
{
  size(700,700,P3D);
}

void draw()
{
  translate(width/2,height/2,0);
  background(255);
  
  rotateX(X);
  rotateY(Y);
  X += 0.02;
  Y += 0.02;
  
  for (float omega =0; omega < 360; omega += 5)
  {
   for (float deg = 0; deg < 360; deg += delta)
   {
     float theta = radians(deg);
     float x = P * sin(omega) * cos(theta);
     float y = P * sin(omega) * sin(omega);
     float z = P * cos(omega);
     stroke(0);
     point(x,y,z);
     
   }
  }
   for (float omega =0; omega < 360; omega += 7)
  {
   for (float deg = 0; deg < 360; deg += delta)
   {
     float theta = radians(deg);
     float x = P * sin(theta) * cos(theta);
     float y = P * sin(theta) * sin(omega);
     float z = P * cos(omega);
     stroke(0);
     point(x,y,z);
     
   }
  }
  
}


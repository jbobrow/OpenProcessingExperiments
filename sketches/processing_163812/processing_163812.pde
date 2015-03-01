
float delta = 3;
float P = 200;
float X, Y;
void setup()
{
  size(600,600,P3D);
}

void draw()
{
  background(0);
  translate(width/1.4,height/1.5,0);
  rotateX(Y);
  rotateY(X);
  
  Y += 0.03;
  X += 0.03;
  
  for (float omega =0; omega < 360; omega += 10)
  {
   for(float deg = 0; deg < 360; deg += delta)
  {
    float theta = radians(deg);
    float x = P*1.1 * sin(omega) * cos(theta);
    float y = P*1.1 * sin(omega) * sin(theta);
    float z = P*1.1 * cos(omega);
    stroke(180);
    strokeWeight(1);
    point(x,y,z);
    
    
    float x2 = P/4 * sin(omega) * cos(theta);
    float y2 = P/4 * sin(omega) * sin(theta);
    float z2 = P/4 * cos(omega);
    stroke(255);
    point(x2,y2,z2);
    
    
    float x3 = P*2.1 * sin(omega) * cos(theta);
    float y3 = P*2.1 * sin(omega) * sin(theta);
    float z3 = P*2.1 * cos(omega);
    stroke(#BFBEAB);
    point(x3,y3,z3); 
  
  }
}
}

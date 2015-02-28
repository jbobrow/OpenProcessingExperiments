
int numBalls = 100;
float[] x = new float[numBalls];
float[] y = new float[numBalls];
float[] xspeed = new float[numBalls];
float[] yspeed = new float[numBalls];
float diameter = 15;

void setup()
{
  size(500,700);
  frameRate(40);
  smooth();
  for (int i = 0; i < numBalls; i++) {
  x[i]=random(diameter, (width-diameter));
}
  for (int i = 0; i < numBalls;i++) {
  y[i]=random(diameter, height-diameter);
}
  for (int i = 0; i < numBalls;i++) {
  xspeed[i]=random(2,5);
}
  for (int i = 0; i < numBalls;i++) {
  yspeed[i]=random(2,5);
}
}

void draw()
{
  background(255,255,0);
  noStroke();
  
  for (int i = 0; i < numBalls;i++) {
    fill(0,i*2,255-i*2);
    ellipse(x[i],y[i],diameter,diameter);
 

  x[i] = x[i] + xspeed[i];
  y[i] = y[i] + yspeed[i];


 if ((x[i] > width-diameter/2) || (x[i] < diameter/2)) {
    xspeed[i] = xspeed[i] * -1;
    
  }
  if ((y[i] > height-diameter/2) || (y[i] < diameter/2)) {
 
   
    yspeed[i] = yspeed[i] * -1;}
  }
     
  }



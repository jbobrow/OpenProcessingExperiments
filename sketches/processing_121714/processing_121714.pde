
float[] x = new float[500];
float[] y = new float[500];
float segLength = 1;
float l=500;
float posx,posy,r;
boolean space;
float timer;

void setup() 
{
  size(600, 500);
  strokeWeight(8);
  stroke(255);
  background(0);
  //frameRate(200);
}

void draw() 
{
  //fill(0,45);
  //rect(-10,-10,700,700); 
  background(0);
  if(space == true)
  {
    timer+=1;
    r+=25;
    strokeWeight(16-(timer/2));
    stroke(225);
    fill(0,20);
    ellipse(posx,posy,r,r);
  }
  if(timer>30)
  {
    timer=0;
    r=0;
    space = false;
  }
  if(mousePressed && l<500)
  {
  l+=1;
  }
  dragSegment(0, mouseX,mouseY);
  for(int i=0; i<l-1; i++) 
  {
    dragSegment(i+1, x[i], y[i]);
    strokeWeight(20-(.04*i));
    stroke(255, 500-i);
  }
  
  println(space);
}

void keyPressed()
{
  if(key == ' ' && space ==false)
  {
    space = true;
    posx=mouseX;
    posy=mouseY;
  }
}
void dragSegment(int i, float xin, float yin) 
{
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}


void segment(float x, float y, float a) 
{
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}



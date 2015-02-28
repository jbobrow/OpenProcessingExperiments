
float[] yVal; //use this array to store height vals
float[] xVal; //use this array to store height vals
float y;
float x;
float phi = 50; //your radians for your sine function
float dphi = 0; //delta is what you increment the radians by

void setup(){
  size(400,400);
  background(179,166,222);
  frameRate(5);
  yVal = new float[width];
  xVal = new float[width];
}

void draw()
{smooth();
  translate(width/2,height/2);
  stroke(101,90,137);
  background(179,166,222);
  internal();
  calcWave();
  renderWave();
  for (int t = 1; t < 60; t+=2)
  {
  rotate(PI/t);
  renderWave();
  rotate(-2*PI/t);
  renderWave();
  rotate(4*PI/t);
  renderWave();
  }
   if (keyPressed == true)
  {
    internal();
  }
}
void calcWave(){ //calculating the height values
  dphi = 0.005;
  for(int i=0; i<width; i+=5) {
  yVal[i] = sin(phi)*height/4; //height divided by 4 and then increments of 10 means amp of 100
phi = phi-dphi;
}}

void renderWave(){ //uses the height values to create a simple pendulum in harmonic motion
  for(int q = 0; q < width; q+=35){
    x = q;
    y = yVal[q];
    y = (int)y;
    fill(x+150,x-25,x-70,random(100,150));
    float rad = 48;
ellipse(x,y,rad,rad);
  }
  
}

void internal(){ //inside structure
  dphi = 0.25;
  for(int i=0; i<width; i+=15) {
  yVal[i] = sin(phi)*height/4; //height divided by 4 and then increments of 10 means amp of 100
xVal[i] = cos(phi)*width/4;
phi = phi-dphi;
fill(142,16,26);
  triangle(0,0,xVal[i]*10,yVal[i]*10,10,10);
}}

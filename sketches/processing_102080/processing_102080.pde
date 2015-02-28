
//Q5-1
float[] xBall;
float[] yBall;
color[] cBall;
int numberOfBalls = 10;
int radius=10;
void setup(){
  size(400,400); 
  colorMode(HSB,359,99,99); smooth();
  xBall = new float[numberOfBalls];
  yBall = new float[numberOfBalls];
  cBall = new color[numberOfBalls];
  for(int i=0;i<numberOfBalls;i++){
    xBall[i] = random(radius, width-radius);
    yBall[i] = random(radius, height-radius);
    cBall[i] = color(random(359), 99, 99);
  }
}

void draw(){
  background(0,0,99);
  for(int i=0;i<numberOfBalls;i++){
    xBall[i] += 1;
  if(xBall[i] - radius > width){
    xBall[i] = -radius; }
    stroke(cBall[i]);
    fill(cBall[i]);
    ellipse(xBall[i],yBall[i],2*radius,2*radius);
  } 
}

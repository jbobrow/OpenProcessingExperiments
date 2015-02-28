
//Q4
float[] xBall;
float[] yBall;
int numberOfBalls = 30; //(a)
int radius=10;
void setup(){
  size(400,400);
  smooth();
  xBall = new float [numberOfBalls];
  yBall = new float [numberOfBalls];
  for(int i=0;i<numberOfBalls;i++){
    xBall[i] = random(radius,width-radius);
    yBall[i] = random(radius,height-radius); 
  }
}
void draw(){
  background(255);
  for(int i=0;i<numberOfBalls;i++){
    xBall[i] += 1; 
      if( xBall[i] - radius > width){
       // (h)には不等号がはいる
      xBall[i] = -radius; 
    }
    stroke(255,10,10);
    fill(255,10,10);
    ellipse(xBall[i],yBall[i],2*radius,2*radius);
  } 
}


//Q5-2
float[] xBall;
float[] yBall;
color[] cBall;
int numberOfBalls = 10;
int radius=10;
void setup(){
 size(400,400); colorMode(HSB,359,99,99); smooth();
 xBall = new float[numberOfBalls]; 
 yBall = new float[numberOfBalls]; 
 cBall = new color[numberOfBalls]; 
 for(int i=0;i<numberOfBalls;i++){
   xBall[i] = random(radius,width-radius);
   yBall[i] = random(radius,height-radius); 
   cBall[i] = color(random(359),99, 99);
 }
}
void draw(){
  background(0,0,99);
  for(int i=0;i<numberOfBalls;i++){
   moveBall(i);
   drawBall(i); 
 }
}
void moveBall(int idx){
  xBall[idx] += idx;
  if( xBall[idx] - radius > width){
    xBall[idx] = -radius; //gamen no hidari hashi ni idou
  }
}
void drawBall(int idx){
   stroke(cBall[idx]);
   fill(cBall[idx]);
   ellipse(xBall[idx],yBall[idx],2*radius,2*radius);
}

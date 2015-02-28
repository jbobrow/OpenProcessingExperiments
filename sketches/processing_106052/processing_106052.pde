
int numBalls = 500;
float[]posX=new float[numBalls];
float[]posY=new float[numBalls];
int[]diameter=new int[numBalls];
float[]speedx=new float[numBalls];
float[]speedy=new float[numBalls];
float[]gravity=new float[numBalls];
float[]hue=new float[numBalls];
int[]opacity=new int [numBalls];
float[] d= new float[numBalls];
int [] memory= new int [numBalls];


void setup() {
  background(255);
  size(500, 500);
  colorMode(HSB,width);
  for (int i=0;i<numBalls; i++) {
    posX[i] = int(random(0, width));
    posY[i] = int(random(0, height-200));//from a heigth to fall dawn
    diameter[i] = int(random(3, 45));  //random ball
    speedx[i]=random(-3, 16); //changing speed of the posx of ball 
    speedy[i]=random(-3, 16); //changing speed of the posy of ball
    gravity[i]=random(1,4);
    hue[i]= int(random(0,155));//array colors hue(rgb) Extracts the hue value from a clolor
    opacity[i]=int(random(0,width));//transparency 
  }
} 
 
void draw(){ 
  background(182);
  for (int i=0; i<numBalls; i++) {
    fill(hue[i],width,width,opacity[i]);//random the color of balls
    movecircle(i);
    bounce(i);
    speedy[i]=speedy[i]+gravity[i];//speedy = speedy+gravity
    d[i]=dist(mouseX, mouseY, posX[i], posY[i]);
    }
}
  
 void movecircle(int i) {
  stroke(random(0,255),255,255);
  strokeWeight(3); 
  ellipse(posX[i], posY[i], diameter[i], diameter[i]);
  posX[i]=posX[i]+speedx[i];
  posY[i]=posY[i]+speedy[i];
} 
void bounce(int i) {
  if (posX[i]< diameter[i]/2) {
    speedx[i]=-speedx[i];
  }
  if (posX[i]>width-diameter[i]/2) {
    speedx[i]=-speedx[i];
  }
  if (posY[i]<diameter[i]/2) {
    speedy[i]=-speedy[i]*0.9;//make the ball fall down slowly
  }
  if (posY[i]>height-diameter[i]/2) {
    speedy[i]=-speedy[i]*0.9;
    speedx[i]=speedx[i]*0.9;
  }
  if (posY[i]>=height-diameter[i]/2){
  posY[i]=height-diameter[i]/2;}
   
  if (posY[i]<=diameter[i]/2){
  posY[i]=diameter[i]/2;}
   
  if (posX[i]<=diameter[i]/2){
  posX[i]=diameter[i]/2;}
   
  if (posX[i]>=width-diameter[i]/2){
  posX[i]=width-diameter[i]/2;}
}

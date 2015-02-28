
//By Ethan Bloom, got the idea from a simple class project//
int ballCount = 500;
float [] ballSize = new float [ballCount];
//ballCount is the same at 500//
float[] xPosition = new float [ballCount];
float[] yPosition = new float [ballCount];
float ColorRed;
float ColorBlue;
float ColorGreen;
float transp;

void setup(){
  size(900,450);
  ColorRed = 255;
  ColorBlue = 255;
  ColorGreen = 255;
  transp = 0;
  background(ColorRed,ColorBlue,ColorGreen);
}

void draw(){
    for(int i=0; i<ballCount; i++){
     //means were setting parrameters of i to the ball size// 
    ballSize[i] = random(10,100);
    xPosition [i] = random(-100,width);
    yPosition [i] = random(-100,height);}
    
  for(int i=0; i<ballCount; i++){
    smooth();
    fill(ColorRed,ColorBlue,ColorGreen,transp);
    ColorRed = random (0,255);
    ColorBlue = random (0,255);
    ColorGreen = random (0,255);
    transp = random (0,255);
    noStroke();
    rect(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);
  //i is the random number//
  }
}     
                



int ballCount = 50;
float [] ballSize = new float [ballCount];
//ballCount is the same at 500//
float[] xPosition = new float [ballCount];
float[] yPosition = new float [ballCount];
float ColorRed;
float ColorBlue;
float ColorGreen;
float transp;
 
void setup(){
  size(700,450);
  ColorRed = 700;
  ColorBlue = 655;
  ColorGreen = 655;
  transp = 0;
  background(ColorBlue,ColorGreen);
}
 
void draw(){
    for(int i=0; i<ballCount; i++){
    
    ballSize[i] = random(10,100);
    xPosition [i] = random(-100,width);
    yPosition [i] = random(-100,height);}
     
  for(int i=0; i<ballCount; i++){
    smooth();
    fill(ColorRed,ColorBlue,ColorGreen,transp);
    ColorRed = random (0,270);
    ColorBlue = random (0,255);
    ColorGreen = random (0,290);
    transp = random (0,255);
    noStroke();
    ellipse(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);
  
  }
}    



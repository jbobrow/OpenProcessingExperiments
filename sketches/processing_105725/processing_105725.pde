
int ballNum = 100;

int xBall[] = new int [ballNum];
int yBall[] = new int [ballNum];
int ballSize[] = new int [ballNum];

color ballColor[] = new color [ballNum];

void setup (){
  background(1, 186, 255);
  size(500, 500);
  stroke(255);
  
  
  for(int i = 0; i < ballNum; i++){
  xBall[i] = int(random(0, width));
  yBall[i] = int(random(0, height));
  ballSize[i] = int(random (30, 50));
  ballColor[i] = color(random(0, 255), random(0, 255), random(0,244));
    }
}
 void draw(){
   
   background (1, 186, 255);
   
    for(int i = 0; i < ballNum; i++){
    fill(ballColor[i]);
    ellipse(xBall[i], yBall[i], ballSize[i], ballSize[i]);
    }
 }

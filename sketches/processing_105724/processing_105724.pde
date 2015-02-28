
int ballNum = 100;

int xBall[] = new int [ballNum];
int yBall[] = new int [ballNum];
int ballSize[] = new int [ballNum];

void setup (){
  background(190, 252, 69);
  size(500, 500);
  stroke(255);
  
  
  for(int i = 0; i < ballNum; i++){
  xBall[i] = int(random(0, width));
  yBall[i] = int(random(0, height));
  ballSize[i] = int(random (30, 70));
    }
}
 void draw(){
   
   background (0);
   
    for(int i = 0; i < ballNum; i++){
    fill(1, 198, 240);
    ellipse(xBall[i], yBall[i], ballSize[i], ballSize[i]);
    }
 }

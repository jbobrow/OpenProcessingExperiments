
/* For Loop Assignment*/

float xPos = 25;
float yPos = 40;
PImage bg;
PImage ball1;
float yMove = 10;
int time;
float gravity = .002;

void setup(){
  bg = loadImage("bg.jpg");
  ball1 = loadImage("ball1.png");
  smooth();
  size(525, 300);
  frameRate(100);
  imageMode(CENTER);
}

void draw(){
  image(bg, 262, 150);
  
  for (int i=0; i<20; i++){
    image(ball1, xPos + (i*25), yPos);
  }
  
  yPos = yPos + yMove;
  
  yMove = yMove + gravity*time;
  
  if(yPos>=290){ //when ball passes the bottom boundary
    yPos=289.9;
    yMove = yMove*(-.5); //simulate dampening of vertical rebound on impact
    yMove = yMove*(.7); //simulate friction in the horizontal direction
    time=0;
  }
  
  time++;
    
    
}





float xPos;
float yPos;
float dia;
float speed=8;
void setup() {
  size (600, 600);
  smooth();
  xPos=300;
  yPos=100;
  dia=30;
  frameRate = 3;
}

void draw() {
  background(100, 100, 100);
  noStroke();
  fill(150, 20, 20);
  ellipse(xPos, yPos, 50, 50);
  
  yPos+=speed; //ball'speed relate to float speed=8
  if (yPos>=height-dia) {
     speed*=-1;
}
  if (yPos<=0+dia){
     speed*=-1;
  }
    
}


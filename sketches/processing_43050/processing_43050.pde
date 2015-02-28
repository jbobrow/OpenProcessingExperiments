

int xPos;
int yPos;
int dia;
float col;
float speed=8;

void setup() {
  size (600, 200);
  smooth();
  xPos=width/2;
  yPos=height/2;
  dia=15;
}


void draw() {
  background(200, 50, 90);
  //stroke(0);
  col=random(255);
  noStroke();
  fill(col, col, col);
  ellipse(xPos, yPos, 30, 30);
  
 
  xPos+=speed;

  if ((xPos>=width-dia) || (xPos<=0+dia)) {
     speed*=-1;
      
    }
}


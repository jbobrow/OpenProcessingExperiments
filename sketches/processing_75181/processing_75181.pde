
int x=200;
int y=200;
float posX = 100; 
float posY = 120;

float dis;

int score = 0;

void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(255);
  noStroke();
  
  
  dis = dist(posX, posY, x, y);
  
  if(dis < 20){
    posX = random(width);
    posY = random(height);
    
    score = score + 1;
  }
  //palla grigia
  fill(150);
  ellipse(posX, posY, 20, 20);

  //palla nera
  fill(0);
  ellipse(x, y, 40, 40); 

  //posizione palla nera per mangiarsi palla grigia
   //if (   x+200 < posX+100 &&  y+200> posY+100 ) {
   // fill(255);
   // ellipse( 100+posX, 100+posY, 20, 20);
  //}
 

  if (keyCode == RIGHT) {
    x=x+3;
  }
  if (keyCode == LEFT) {
    x=x-3;
  }
  if (keyCode == DOWN) {
    y=y+3;
  }
  if (keyCode == UP) {
    y=y-3;
  }
  
  text("Score: " + score, width - 100, 20);
}

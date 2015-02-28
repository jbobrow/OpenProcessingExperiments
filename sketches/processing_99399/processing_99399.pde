
int xpos = 10;
int ypos = 350;
float time = 0.00;
boolean game = true;

void setup() {
  size(700,700);
  smooth();
  background(200);
}

void draw() {
  background(200);
  strokeWeight(1);
  drawPlayer();
  drawFinish();
  drawWalls();
}
public class player {
  
}
public boolean isGameEnd() {
  if(xpos <= width-33 && (ypos >= height/2-20 || ypos<=height/2+200)) {
    game = false;
  } 
  return game;
} 
void drawPlayer() {
  fill(255,102,0);
  ellipse(xpos,ypos,10,10);
}

void drawFinish() {
  fill(100,255,100);
  rect(width-23,height/2,20,20);
}

void drawWalls() {
  strokeWeight(5);
  fill(0,0,0);
  rect(0,height/2+10,2,height);
  rect(0,0,2,height/2-10);
  rect(0,0,width,2);
  rect(0,height-2,width,2);
  rect(width-2,0,8,height);
  rect(width/8,height/3,7,height/3);
}


void keyPressed()
{
  if ( (keyCode == LEFT)) {
    xpos-=3;
  }
  if ( (keyCode == RIGHT)  ) {
    xpos+=3;
  }
  if ( (keyCode == UP)  ) {
    ypos-=3;
  }
  if ( (keyCode == DOWN)  )  {
    ypos+=3;
  }
}
void collide() {
}
public void time() {
  time+=.01;
}

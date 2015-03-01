
//pong by your boy will s


int c = 0;
//score
int s2 = 0;
int s1 = 0;
//ball location
int x = 0;
int y = 0;
//ball movement
int my = 3;
int mx = 3;
//player 2 paddle
int p2Y = 150;

void setup() {
  size(500, 300);
}



void draw() {
  //Background function
  drawBackground();
  
  fill(0, 200, 220);
  noStroke();
  //Ball
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my;

  //bouncing/score mechanics
  if (y > height || y < 0) {
    my *= -1;
  }
  if (x<0) {
    mx*=-1;
    x=width/2;
    y=height/2;
    s2+=1;
  }
    if (x>width) {
    mx*=-1;
    x=width/2;
    y=height/2;
    s1+=1;
  }
  
  //Mouse Paddle
  Paddle(50, mouseY);
  //keyboard Paddle
  Paddle(width-50, p2Y);

  //Paddle Bouncing Mechanics
  if (abs(x-50)<10&&abs(mouseY-y)<23) {
    mx = abs(mx);
  }
  //Paddle2 Bouncing Mechanics
  if (abs(x-(width-50))<10&&abs(p2Y-y)<23) {
    mx = -abs(mx);
  }
  
  if(c<255){
    c+=1;
  }
  if(c>254){
    c=0;
  } 
 
}
//More mouse Paddle
void Paddle(int x, int y) {
  rectMode(CENTER);
  stroke(0);
  fill(c);
  rect(x, y, 10, 50);
}

//Background
void drawBackground() {
  background(50);
  int z = 100;
  stroke(150);
  noFill();
  ellipse(width/2, height/2, 100, 100);
  while (z< width && z < width-75) {
    line(z, 0, z, height);
    z+=150;
  }
  
//scoreboard
textSize(20);
fill(0);
  text(s1,width/2-50,25);
  text(s2,width/2+50,25);
}

//Keyboard Controls
void keyPressed() {
  if (key == 'w') {
    p2Y -= 12;
  }
  if (key == 's') {
    p2Y += 12;
  }
}



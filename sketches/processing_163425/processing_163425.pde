
int x=0;
int y=0;
int my=3;
int mx=3;
int p2Y=200;
int p1Score=0;
int p2Score=0;
void setup() {
  size(600, 400);
}
void draw() {
  background(41, 97, 232);
  drawBackground();
  

  //ball
  strokeWeight(1);
  fill(255, 153, 51);
  stroke(0, 0, 0);
  ellipse(x, y, 20, 20);
  x+=mx;//how much we are moving on the x axis
  y+=my;//how much we are moving on the y axis
  if (y>height || y<0) { //makes it bounce of top and bottom
    my*=-1;//same as my=my*-1
  }
  if (x>width) { //makes the ball disapear and reset and s
    mx*=-1; //makes the serve go to person who wins
    x=width/2;
    x=height/2;
    p1Score+=1;
  }
   if (x<0) { //makes the ball disapear and reset and s
    mx*=-1; //makes the serve go to person who wins
    x=width/2;
    x=height/2;
    p2Score+=1;
  }
  paddle(30, mouseY);
  paddle(570, p2Y);

  //hit test
  if (abs(x-50)<10 && abs(y-mouseY)<20) {
    mx=abs(mx);
  }
  //hit test P2
  if (abs(x-550)<10 && abs(y-p2Y)<20) {
    mx=-abs(mx);
  }
}
//Keyboard Imput For Player 2
void keyPressed() {
  if (key=='w') {
    p2Y=p2Y-30;
  }
  if (key=='s') {
    p2Y=p2Y+30;
  }
}

void paddle(int x, int y) {
  //paddle
  rectMode(CENTER);
  strokeWeight(0);
  fill(0, 0, 0);
  rect(x, y, 10, 60);
}
void drawBackground() {
  stroke(250, 250, 250);
  strokeWeight(10);
  line(0, 50, 600, 50);
  line(0, 350, 600, 350);
  line(300, 0, 300, 400);
  fill(41, 97, 232);
  ellipse(width/2, height/2, 100, 100);
  //score
  fill(255);
  textSize(30);
  text(p1Score,150,30);
  text(p2Score,width-150,30);
}


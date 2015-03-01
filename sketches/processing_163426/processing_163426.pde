
int x = 0;
int y = 0;
int my = 5;
int mx = 5;
int p2Y = 200;

int p1Score = 0;
int p2Score = 0;

void setup() {
  size(600, 400);
}

void draw() {
  background(0, 120, 50);
  //Background
  backgroundlines(300, 200);
  fill(192, 246, 81);
  noStroke();
  ellipse(x, y, 20, 20);
  x+=mx;
  y+=my;
  if (y>height || y < 0) {
    my *= -1;
  }
  if (x < 0) {
    mx *= -1;
    x = width/2;
    x = height/2;
    p2Score +=1;
  }
  if (x > width) {
    mx *= -1;
    x = width/2;
    x = height/2;
    p1Score += 1;
  }
  //hit test 1
  if (abs(x-20)<10 && abs(y-mouseY)<20) {
    mx*=-1;
    my*=-1;
  }
  //hit test 2
  if (abs(x-580)<10 && abs(y-p2Y)<20) {
    mx*=-1;
    my+=-1;
  }    

  //Paddle
  fill(255, 255, 0);
  paddle(20, mouseY);
  paddle(580, p2Y);
}


//Keyboard Input for Player 1
void keyPressed() {
  if (key == 'w') {
    p2Y = p2Y - 30;
  }
  if(key=='s') {
    p2Y = p2Y + 30;
  }
}

void paddle(int x, int y) {
  rectMode(CENTER);
  rect(x, y, 10, 60);
}

void backgroundlines(int x, int y) {
  strokeWeight(8);
  stroke(255);
  line(300, 0, 300, 400);
  ellipseMode(CENTER);
  fill(0, 120, 50);
  ellipse(300, 200, 200, 200);
  line(0, 50, 600, 50);
  line(0, 350, 600, 350);
  
  fill(255);
  textSize(50);
  text(p1Score, 150, 40);
  text(p2Score, 420, 40);
}

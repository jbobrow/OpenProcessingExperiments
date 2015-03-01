
int x = 0;
int y = 0;
int my = 3;
int mx = 3;
int p2Y = 200;

void setup() {
  size(600, 400);
}
void draw() {
  drawBackground();
  ellipse(x, y, 10, 10);
  x += mx;
  y += my;
  if (y>height|| y < 0) {
    my *= -1;
  }
  if (x>width || x < 0) {
   mx *= -1;
   x = width/2;
   y = height/2;
  

    
  }
 
  paddle(50, mouseY);
  paddle(550, p2Y);
  //hit test
  if (abs(x-50)<10 && abs(y-mouseY)<40) {
    mx = abs(mx);
   
   
  }
  //hit test for second paddle
  if (abs(x-550)<10 && abs(y-p2Y)<40) {
    mx = -abs(mx);
  }
}

// Keyboard Input for Player 2!
void keyPressed() {
  if (key == 'w') { 
    p2Y = p2Y -15;
  }
  if (key == 's'){
  p2Y = p2Y +15;
  }
}

void paddle(int x, int y) {
  //Paddle
  rectMode(CENTER);
  rect(x, y, 10, 100);
}

void drawBackground() {
  background(0);
  fill(255);
  stroke(255);
  line(0, 40, 600, 40);
  fill(255);
  stroke(255);
  line(0, 560, 400, 560);
  fill(#E8090D);
  ellipse(width/2, height/2, 100, 100);
}


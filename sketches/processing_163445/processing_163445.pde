
int x = 0;
int y = 0;
int my = 3;
int mx = 3;
int p2Y = 200;

int p1Score = 0;
int p2Score = 0;
 
void setup() {
  size(600, 400);
}
void draw() {
  drawBackground();
  stroke(#239531);
  fill(0);
  ellipse(x, y, 10, 10);
  x += mx;
  y += my;
  if (y>height|| y < 0) {
    my *= -1;
  }
  if (x < 0) {
   mx *= -1;
   x = width/2;
   y = height/2;  
   stroke(#239531);
   p2Score += 100; 
  }
   if (x>width) {
   mx *= -1;
   x = width/2;
   y = height/2;
   stroke(#239531);
   p1Score += 100;
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
  stroke(#239531);
  fill(0);
  rectMode(CENTER);
  rect(x, y, 10, 100);
}
 
void drawBackground() {
  background(0);
//  background(0,100);
  stroke(#239531);
  line(0, 40, 600, 40);
  stroke(#239531);
  line(0,360,600,360);
  stroke(#239531);
  line(width/2,0,width/2,height);
  ellipse(width/2, height/2, 200, 200);
  
  fill(#239531);
  textSize(20);
  text(p1Score, 150, 20);
  text(p2Score, width-150, 20);
}


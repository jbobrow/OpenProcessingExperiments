
int x=0;
int y=0;
int my= 3;
int mx=3;
int p2y= 200;

void setup () {
  size (600, 400);
}
void draw () {
  background (50, 0, 220);
  background(50);
  stroke(255);
  noFill();
  rect(-1, 20, 602, 360);
  line(300, 0, 300, 400);
  ellipse(300, 200, 80, 80);
  ellipse(0, 200, 30, 80);
  ellipse(600, 200, 30, 80);
  ellipse (x, y, 10, 10);
  x+=mx;
  y+=my;
  if (y> height||y<0) {
    my = my *-1;
  }
  if (x>width||x<0) {
    mx *=-1 ;  
    x=width/2;
    y=height/2;
  }
  paddle (50, mouseY);
  paddle (550, p2y);

  //hit test for the second paddle!
  if (abs(x-550)<40&&abs(y-p2y)<40) {
    mx=abs(mx);
  }

  //hit test
  if (abs(x-550)<10 && abs(y-mouseY)<40) {
    mx = abs (mx);
  }
}
//Keyboard Input for Player 2
void keyPressed(){
  if (key == 'w') {
    p2y= p2y-15;
  }
  if (key=='s') {
    p2y=p2y+15;
  }
}
void paddle (int x, int y) {
  //Paddle
  rectMode(CENTER);
  rect(x, y, 10, 80);
}


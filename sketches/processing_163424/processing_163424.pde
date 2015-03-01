
//ball coordinate variables
int x = 0; 
int y = 0;
//ball motion variables
int my = 5;
int mx = 5;
//score
int s = 0;
int os = 0;
//p2 control variables
int p2y = 200;
//booleans??
boolean keyw = false;
boolean keys = false;


void setup() {
  //size
  size(600, 400);
}
//ball, bounce, paddle, score 
void draw() {
  //background
  background(50);
  //call court
  drawbackground(0, 0);
  //call ball
  ellipse(x, y, 10, 10);
  //ball motion
  x += mx;
  y += my;
  //wall bounce
  if (y>height || y<0) {
    my = my * -1;
  }
  //wall bounce, score, and revert to middle
  if (x>width) {
    x = width/2;
    y = height/2;
    mx *= -1;
    s = s +1;
  }
  if (x<0) {
    x = width/2;
    y = height/2;
   mx *= -1;
    os = os+1;
  }
  //hit tests
  if (abs(x-50) < 10 && abs(mouseY -y) < 27) {
    mx = abs(mx);
  }
  if (abs(x-550) < 10 && abs(p2y -y) < 27) {
    mx = -abs(mx);
  }
  //paddle coordinates
  paddle(50, mouseY);
  paddle(550, p2y);

  if (keyPressed) {
    if (key == 'w') {
      p2y -= 5;
    }
  
    if (key == 's') {
      p2y += 5;
    }
   
  }

}
//Keyboard Input for Player 2



//paddle
void paddle(int x, int y) {
  rectMode(CENTER);
  rect(x, y, 5, 50);
}
//court
void drawbackground(int x, int y) {
  background(0, 0, 0);
  fill(0, 0, 0);
  stroke(#0FFCEB);
  strokeWeight(10);
  ellipse(width/2, height/2, 80, 80);
  line(0, 20, width, 20);
  line(0, 380, width, 380);
  line(width/2, 21, width/2, height/2-41);
  line(width/2, 379, width/2, height/2+41);
  //score
  fill(#0FFCEB);
  String scoreLeft = "score: " + s;
  text(scoreLeft, 0, 11);
  String scoreRight = "score: " + os;
  text(scoreRight, 540, 11);
  
}

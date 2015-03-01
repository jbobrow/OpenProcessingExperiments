
int x = 0; 
int y = 0;
int my = 3;
int mx = 3;
int s = 0;
int os = 0;
void setup() {
  size(600, 400);
}

void draw() {
  background(50);
  drawbackground(0,0);
  ellipse(x, y, 10, 10);
  x += mx;
  y += my;
  if (y>height || y<0) {
    my = my * -1;
  }
  if (x>width) {
    
    mx = mx*-1;
    s = s +1;
  }
  if (x<0) {
    mx = mx*-1;
    os = os+1;
  }
  if (abs(x-50) < 10 && abs(mouseY -y) < 27) {
    mx = -mx;
  }
   if (abs(x-550) < 10 && abs(mouseY -y) < 27) {
    mx = -mx;
  }
  paddle(50, mouseY);
  paddle(550, mouseY);
  fill(#0FFCEB);
String scoreLeft = "score: " + s;
  text(scoreLeft,0,11);
String scoreRight = "score: " + os;
  text(scoreRight,540,11);
}

void paddle(int x, int y) {
  rectMode(CENTER);
  rect(x, y, 5, 50);
}

void drawbackground(int x, int y) {
  background(0,0,0);
  fill(0,0,0);
  stroke(#0FFCEB);
  strokeWeight(10);
  ellipse(width/2, height/2, 80, 80);
  line(0, 20, width, 20);
  line(0, 380, width, 380);
  line(width/2, 21, width/2, height/2-41);
  line(width/2, 379 , width/2, height/2+41);
}



Ball ball;
int nb = 300;
Ball lots[] = new Ball [nb];
int i;
float spd = 2;

void setup () {
  smooth ();
  size(900, 400);
  
  for (int i=0; i<lots.length; i++) {
  lots[i] = new Ball(random(1,1),color(random(0,255),random(0,255),random(0,255)));
  }
  
  frameRate(15);
}

void draw () {
fill(0,10);
rect(0,0,width,height);
//  background (0);
for (i=0;i<lots.length;i++) { 
  lots[i].move();
  lots[i].display();
 }
}

class Ball {
  int s; 
  int x, y;
  color c;
  
  
  Ball(float _s, color _c) {
    s = 2;
    x = width/2;
    y = height/2;
    c = _c;
//    c = color(200, 120, 100);
  } 
  void move() {
    x += random((-1-spd), (2+spd));
    y += random((-1-spd), (2+spd));
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  void display() {
    fill(c);
    noStroke ();
    ellipse(x, y, s, s);
  }
}



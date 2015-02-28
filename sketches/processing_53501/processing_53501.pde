
//Adam Lastowka
//Sorry, messy code.

int longness = 1500;
float drag = 0.01;
float randomX;
float randomY;

follower[] goog = new follower[longness];

void setup() {
  smooth();
  size(900, 450);
  background(0, 0, 0);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  for(int i = 0; i < longness; i++) {
    goog[i] = new follower();
  }
}
void draw() {
  if(!(keyPressed && key == 'q')) {
    background(0, 0, 0);
  if(mousePressed) {
    randomX = random(-8, 8);
    randomY = random(-8, 8);
  }
  }
  for(int i = 0; i < longness; i++) {
    goog[i].render();
  }
}
class follower {
float X;
float Y;
float Xv;
float Yv;
float xp;
float yp;


follower() {
  X = random(900);
  Y = random(450);
}
void render() {
 stroke(60 + Xv, 10 + Xv, 30 + Yv); 
   if(mousePressed) {
     Xv += (10000 / dist(mouseX, mouseY, X, Y) * ((0.009 * (mouseX - X))) / 50);
     Yv += (10000 / dist(mouseX, mouseY, X, Y) * ((0.009 * (mouseY - Y))) / 50);
   }else{
     Xv = Xv / 1.02;
     Yv = Yv / 1.02;
   }
   X = X + Xv;
   Y = Y + Yv;
 if(keyPressed && key != 'q') {
   Xv = Xv / 1.05;
   Yv = Yv / 1.05;
 }
  line(X + randomX, Y + randomY, xp + randomX, yp + randomY);
  xp = X;
  yp = Y;
}
}                                               

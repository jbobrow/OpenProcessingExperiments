
int counter;

vofloat x, y, w, h;
int timer;
void setup() {
  size(1000, 500);

  x = 500;
  y = 250;
  w = 100;
  h = 100;
  timer = 0;
}


void draw() {
  background(255, 3, 3);
  ellipse(x, y, w, h);
  fill(28, 7, 7);
  timer = timer+1;
  if (timer > 500) {
    x = random(0, width);
    y = random(0, height);
    timer = 0;
  }
}


void mousePressed(){
  float d = dist(mouseX,mouseY, x,y);
  if(d < w*.5){
    timer = 500;
}

}

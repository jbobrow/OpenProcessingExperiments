
int value = 0;
int x = 350;
int y = 150;
int k = 0;

void setup() {
  size(700,400); 
  rectMode(CENTER);
  noStroke();
  background(0);
  fill(value+255,10);
}

void draw() {
  
  rect(350, 200, x, y);
}

void mouseDragged() 
{
  value = value + 5;
  x = x+10;
  //y = y+1;
  if (k==0) {
    if (value > 255) {
      value = 0;
    }
    if (x==700 || y==400) {
      fill(value,10);
      x = 0;
      y = 150;
      k = 1;
    }
  }
  if (k==1) {
    if (value > 255){
      value = 0;
    }
    if (x==700 || y==400) {
    fill(random(1,255),random(1,255),random(1,255),10);
    x=50;
    y=150;
    k=0;
    }
  }
}



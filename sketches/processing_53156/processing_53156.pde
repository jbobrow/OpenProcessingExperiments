
PImage bg;
///box 
int x=250;
int y=100;
int speedx=1;
int speedy=2;

color C;

void setup() {

  size(600, 600);
  bg=loadImage("colorpicker.png");
}


void draw() {
  image(bg, 0, 0);
  stroke(255);
  noFill();
rect(x, y, 30, 30);
if(mousePressed){
  x=mouseX;
  y=mouseY;
}else{
  x+=speedx;
  y+=speedy;
}
  if (x>550 || x<36) speedx=-speedx;
  if ( y>550 || y<36) speedy=-speedy;

  C=bg.pixels[(bg.width*(y+15))+(x+15)];
  fill(C);
  noStroke();


rect(250,570,100,20);
}


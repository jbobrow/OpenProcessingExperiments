
float x1, y1, rad1;
int deg = 0;
PImage img;
boolean click = false;

void setup(){
  size(640, 360);
  frameRate(12);
  img = loadImage("play.png");
  background (0);
  image(img, width/2-5, height/2-10);
}

void draw(){
  noStroke();

  if (mouseButton == LEFT){
    fill(0, 60);
    rect(0, 0, width, height);
    loading();
  }
}

void loading(){
    deg = deg + 40;
    rad1 = (PI/160)*deg;
    x1 = sin(rad1)*11 + (width/2);
    y1 = cos(rad1)*11 + (height/2);
    stroke(255,100);
    fill(255);
    ellipse(x1, y1, 7, 7);
}


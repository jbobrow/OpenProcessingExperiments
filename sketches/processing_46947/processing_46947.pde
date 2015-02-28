
PImage Oscar;

void setup () {
  size (500,500);
  Oscar = loadImage ("IMG_3081.jpg");
}


void draw () {
  tint(random(0,255), random(0,255), random(0,255),150);
  image(Oscar, random(100,200), random(50,150));
  
  fill(random(0,255),random(0,255), random(0,255));
  rect(random(0,500),random(0,500),5,5);
  line(mouseX,mouseY,random(0,500), random(0,500));
}


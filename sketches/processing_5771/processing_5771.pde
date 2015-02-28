


void setup(){

  size (300,300);
  frameRate(0.5);

  background (255);
  noStroke();
  smooth();

}

void draw() {

  color a = color(random(255),random(255),random(255));
  color b = color(random(255),random(255),random(255));
  color c = lerpColor(a,b, 0.5);

  fill (a);
  ellipse (50,150,80,80);

  fill (c);
  ellipse (150,150,80,80);

  fill (b);
  ellipse (250,150,80,80);

}



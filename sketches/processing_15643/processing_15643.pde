
int d;
PImage b;
PImage c;
float faur;

void setup() {
  size(1024,768);
  d=20;
  b = loadImage("for.jpg");
  c = loadImage("biche.png");
}

void draw() {
  background(b);
  smooth();
  image(c,300,250,d,d);
  if(d > 0) {
    d = d + 20;
    faur = random(10,80);
    noStroke();
    fill(0,0,0,20);
    ellipse(random(1024),random(768),faur,faur);

  }
}

void mousePressed() {
  d=20;
}



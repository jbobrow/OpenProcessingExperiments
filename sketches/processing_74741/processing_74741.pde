
Particle[] p = new Particle[600];
PImage img;
int xPos = 25;
int yPos = 575;
int w = 100;
int boxx = 400;
int boxy = 550;

void setup() {
  size(600, 600);
  img = loadImage("Box.jpg");
  tint(500,400);
  rectMode(CENTER);
  for (int i=0;i<p.length;i++) {
    p[i] = new Particle(boxx, boxy);
  }
  }

void draw() {
  rectangle();
  fireworks();
}
void rectangle() {
  background(168, map(mouseY, 0, width, 0, (237) ), 168, 50);
  noStroke();
  fill(255, 0, 0);
  rect(xPos, yPos, 52, 51);
  if (mouseX > xPos && mouseX < xPos+w && mouseY < yPos && mouseY < yPos+height && mousePressed) {
    xPos=mouseX;
    yPos=mouseY;
  }
  else {
    if (yPos<575) { 
      yPos+=5;
    }
    else {
      if (keyPressed) {
        key = 'r';
        xPos = 25;
        yPos=575;
      }
    }
  }
  fill(255, 0, 0);
  image(img, boxx-25, boxy);
}
void fireworks() {

  if (dist(boxx,boxy,xPos,yPos) < 30) {
    point(boxx, boxy);
    for (int i=0;i<p.length;i++) {
      p[i] = new Particle(boxx, boxy);
    }
  }
 
  for (int i=0;i<p.length;i++) {
    p[i].render();
  }
}
class Particle {
  
  float xPos=0;
  float yPos=0;
  float a=0;
  float g=0;
  float m=0;
 
 
  int counter=0;
 
  public Particle(float x, float y) {
    xPos = x;
    yPos = y;
    a = random(360);
    m=random(2);
    counter=0;
  }
 
  public void render() {
    counter++;
 
    if (counter > 100) {
      xPos += m*cos(radians(a));
      yPos += m*sin(radians(a));
      yPos += g;
      g+=0.1;
    }
    else {
      yPos-=5;
    }
    fill(random(255), random(150),random(0),random(80));
    ellipse(xPos, yPos, random(2, 5), random(2, 5));
  }
}




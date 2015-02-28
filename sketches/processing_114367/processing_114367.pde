
String message = "gun";
float x, y;
float r;
float xspeed;
PImage bullet;

float hr, vr;

void setup() {
  size(500, 500);
  smooth();
  x=width/2;
  y=height/2;
  r=random(10, 50);
  xspeed = random(-20, -30);

  textAlign(CENTER, CENTER);

  hr=textWidth(message)/2;
  vr=(textAscent() + textDescent())/2;
  noStroke();
  bullet = loadImage("bullet.png");
  imageMode(CENTER);
}

void draw() {
  fill(204, 120);
  rect(0, 0, width, height);


  textSize(50);
  fill(0);
  text("gun", mouseX, mouseY);

  x=x+xspeed;

  if (mousePressed) {
    if (abs(mouseX -x) < hr && abs(mouseY-y) <vr) {
      x+= random(-5, 5);
      y+=random(-5, 5);
    }
    if (x<-r) {
      x=mouseX+r;
      y=mouseY;
    }
  }
  fill(0);
  image(bullet, x-50, y+10, 70, 70);
}




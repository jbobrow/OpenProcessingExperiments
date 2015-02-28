
float theta;
PShape font;
float x =1;
float y =1;
int t = 70;

void setup() {
  size(640,480);
  smooth();
  font = loadShape("kccc1.svg");
  shapeMode(CENTER);
  imageMode(CENTER);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(1.5);
  
  pushMatrix();
  float bw = 117;
  float bh = 133.7;
  float sw = 97.7;
  float sh = 111.7;
  float s = (abs(mouseX-(width/2)) / (float) 320);
  shape(font, 320, 216.5, s*(bw-sw)+sw, s*(bh-sh)+sh);

  float a = abs(45 - (abs(mouseX-(width/2)) / (float) 320) * 45f);
  theta = radians(a);
  translate(width/2,217);
  line(0,219,0,-67);
  line(0,0,67,0);
  line(0,0,-67,0);
  
  translate(0,-67);
  branch(70,0, 0,50,50);
  translate(67,67);
  branch(70,90, 50,0,50);
  translate(-134,0);
  branch(70,-90, 50,50,0);
  popMatrix();
  
  float d = dist(320, 216.5, mouseX, mouseY);
  if (d < 5 || (mouseX < 5) || (mouseX > width-5)) {
    PImage screen = get(103, 0, 434, 433);
    y *=1.12;
    x *= 1.12;
    t -= 6;
    tint(255, t);
    image(screen, 320-1, 216.5-1, screen.width * x, screen.height * y);
  } else {
    x=1; y=1; t=70;
  }
}

void branch(float h, float angle, int r, int g, int b) {
  h *= 0.6;
  r += 25;
  g += 25;
  b += 25;
  if (h > 2) {
    pushMatrix();
    stroke(r,g,b);
    rotate(theta+radians(angle));
    line(0,0,-h,-h);
    translate(0,-h);
    branch(h,radians(angle), r,g,b);
    popMatrix();

    pushMatrix();
    stroke(r,g,b);
    rotate(-theta+radians(angle));
    line(0,0,h,-h);
    translate(0,-h);
    branch(h,radians(angle), r,g,b);
    popMatrix();
  }
}




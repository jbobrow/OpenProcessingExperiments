
PImage img;


int _x, _y, _wi, _hi;
color _c;
void setup() {
  smooth();
  noLoop();
  size(400, 400);
  colorMode(HSB);
  _wi = width/4;
  _hi = _wi*3;

  _x = width/2;
  _y = height/2;
  img =loadImage ("flower.png");
}

void draw() {

  background(255);

  for (int i=0;i<15;i++) {
 
    _c = color(random(180,255),random(0,200),255);

    lolli(int(random(width)), int(random(height/1.5)), 10, 30, _c);
  }
}

void lolli(int x, int y, int wi, int hi, color c) {
  strokeWeight(2);
stroke(random(50,100),random(30,255),random(0,150));
line(x+img.width/2, y+img.height/2, x, height);
  noStroke();
  tint(c);

  image(img, x, y, img.width, img.height);

}

void mousePressed()
{
  redraw();
}



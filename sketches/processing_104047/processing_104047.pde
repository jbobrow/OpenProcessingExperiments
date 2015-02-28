
//Bot b = new Bot(250, 250, 50);

Bot b[] = new Bot[100];

PImage img;

void setup() {

  noStroke();

  size(500, 500);
  smooth();
  img = loadImage("Blood-Cell-3alpha.png");

  for (int i=0;i<b.length;i++) {
    b[i] = new Bot(random(width), random(height), random(10, 50));
  }
}


void draw() {
  colorMode(RGB, 255);
  //background(255);

  fill(255, 255, 255, 20);
  rect(0, 0, width, height);

  for (int i=0;i<b.length;i++) {
    b[i].render();
  }
}
void mouseClicked() {
  for (int i=0;i<b.length;i++) {
    b[i] = new Bot(mouseX, mouseY, random(15, 20));
  }
}

class Bot {

  float x=0;
  float y=0;
  float d=0;
  float a=0;

  int colour=0;
  float m=0;

  Bot(float newX, float newY, float newD) {
    x=newX;
    y=newY;
    d=newD;
    a=random(360);
    colour = (int)random(100);
    m=random(3);
  }

  void render() {

    float xChange = cos(radians(a))*m;
    float yChange = sin(radians(a))*m;
    x+=xChange;
    y+=yChange;
    a+=1;
    //image(img, x, y, d, d);
    colorMode(HSB, 100);
    fill(colour, 100, 100, 10);

    ellipse(x, y, d, d);
  }
}

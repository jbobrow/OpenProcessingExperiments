
//bot b = new bot(250, 250, 25);
bot b[] = new bot [100];
PImage img;
void setup() {
  colorMode(RGB, 255);
  noStroke();
  size(400, 400);
  smooth();
  img = loadImage("Blood-Cell.png");
 
  for (int i=0;i<b.length;i++) {
    b[i] = new bot(random(width), random(height), random(10, 50));
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
    b[i] = new bot(mouseX, mouseY, random(10, 50));
  }
}
void mouseDragged() {
  for (int i=0;i<b.length;i++) {
    b[i] = new bot(mouseX, mouseY, random(10, 50));
  }
}
 
  class bot {
    float x=0;
    float y=0;
    float d=0;
    float a=0;
    float m=0;
    int colour=0;
    bot(float newX, float newY, float newD) {
      x=newX;
      y=newY;
      d=newD;
      a=random(0, 360);
      m=random(3, 100);
      colour =(int)random(100);
    }
 
 
    void render() {
 
      float xChange = cos(radians(a))*m;
      float yChange = sin(radians(a))*m;
      x+=xChange;
      y+=yChange;
      a++;
 
      ellipse(x, y, d, d);
      colorMode(HSB, 100);
      fill(colour, 100, 100);
    }
  }


int y=0;
float speed=1.0;
int direction=1;

void setup() {
  size (432, 576);
  noStroke();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  frameRate(50);
  fill(230,120,200);
  ellipse(-120+y, -120, 70, 70);
  fill(100, 20, 230);
  ellipse(-120, -y, 70, 70);
  fill(250,100,30);
  ellipse(-120, 120, 70, 70);
  fill(50,80,240);
  ellipse(0, 0, 70, 70);
  fill(150,200, 220);
  ellipse(120, -120, 70, 70);
  fill(180,60,250);
  ellipse(120, y, 70, 70);
  fill(250,200,120);
  ellipse(120-y, 120, 70, 70);
  y++;
  if (y>120) {
    y=120;
  }
  if ((frameCount%5)==0) {
    saveFrame("hi-####.tif");
  }
}




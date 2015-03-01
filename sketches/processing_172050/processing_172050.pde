
int frames = 180;
float diameter, radius, theta;

void setup() {
  size(500, 400);
  //blendMode(EXCLUSION);
  diameter = height*.5;
  radius = diameter/2;
}

void draw() {
  background(255);

  float x1 = map(sin(theta), -1, 1, width/2, width/2-radius);
  float x2 = map(sin(theta), -1, 1, width/2+radius, width/2);
  float y = height/2;
  float r1 = map(sin(theta), -1, 1, 0, diameter);
  float r2 = map(sin(theta), -1, 1, diameter, 0);

  fill(0);
  noStroke();
  ellipse(x1, y, r1, r1);
  ellipse(x2, y, r2, r2);
  
  //ellipse(width/2, height/2,radius*2, radius*2);

  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}


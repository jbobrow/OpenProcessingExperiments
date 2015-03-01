
int frames = 180;
float diameter, radius, theta;

void setup() {
  size(500, 500);
  diameter = height*.45;
  radius = diameter/2;
}

void draw() {
  color col1 = #393242;
  color col2 = #ccd4e6 ;
  noStroke();
  fill(col1);
  rect(0, 0, width/2, height);
  fill(col2);
  rect(width/2, 0, width, height);

  float x1 = map(sin(theta), -1, 1, width/2, width/2-radius);
  float x2 = map(sin(theta), -1, 1, width/2+radius, width/2);
  float y = height*.5;
  float r1 = map(sin(theta), -1, 1, 0, diameter);
  float r2 = map(sin(theta), -1, 1, diameter, 0);
  
  fill(col2);
  ellipse(x1, y, r1, r1);
  fill(col1);
  ellipse(x2, y, r2, r2);

  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}


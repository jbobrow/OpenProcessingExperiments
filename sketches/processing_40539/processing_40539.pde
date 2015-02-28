

////////////////////////////////
float radius = 900;
float space = 0.06;
////////////////////////////////

void setup() {

  size(600, 600);
  smooth();
}

float theta = 0;
float theta_space;

PVector center=new PVector(), p=new PVector();

void draw() {

  float n = 0, center_coordinate;

  background(0);

  // perlin noise update
  n = noise(theta_space);
  theta_space += 0.06;

  translate(width/2, height/2);
  rotate( map(n, 0, 1, 0, PI));

  center_coordinate = map(n, 0, 1, -width/2, width/2);
  center.x = center_coordinate;

  fill(20);
  rect(-width, -height, width*2, height);
  stroke(200);
  draw_rays(PI-space, 2*PI, true);

  fill(20);
  rect(-width, 0, width*2, height*2);
  stroke(200);
  center_coordinate = map(1-n, 0, 1, -width/2, width/2);
  center.x = center_coordinate;
  draw_rays(0, PI, true);

  theta += 0.02;
  
}

void draw_rays(float from, float to, boolean direction) {
  float a1;
  for (float angle=from; angle<to; angle+=space) {
    a1 = (direction) ? angle+theta%space : angle-theta%space ;
    p.x = center.x + cos(a1)*radius;
    p.y = center.y + sin(a1)*radius;
    line(center.x, center.y, p.x, p.y);
  }
}


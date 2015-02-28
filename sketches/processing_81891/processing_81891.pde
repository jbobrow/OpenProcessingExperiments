
int x=0;
int y =0;
float r=0;
float radius = 90.0;
float z = 20;

void setup() {
  size(400, 400);

  fill(100);
  frameRate(20);
  smooth();
  noStroke();
  noiseSeed(0);
}


void draw() {
  background(183, 255, 245);
  translate(width/2, height/2);
  rotate(r);

  for (int deg = 0; deg < 360*6; deg += 300) {

    float ra= 20;
    float angle = radians(deg);
    float x =0 + (cos(angle) * radius/2);
    float y =0 + (sin(angle) * radius/2);

    ellipse(x*2, y*2, z, z);
    ellipse(x, y, z, z);
    ellipse(x/4, y/4, z, z);

    ellipse(z+130, z+130, 10, 10);

    fill(random(255), random(255), 200);
  }
  radius = radius + 3;
  z -= 0.5;


  if (radius > 300) { 
    scale(3);
    ellipse(random(x), random(y), 100, 100);
    radius -= 400;
    z = 5.0;
  }

  r += PI/16;
}

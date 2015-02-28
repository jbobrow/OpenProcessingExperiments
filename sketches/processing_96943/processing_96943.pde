
int x =0;
int y=0;
float r =0;
float radius=180;
float z =5;


void setup() {
  size (800, 800,P3D);
  fill(100);
  frameRate(3);
  smooth();
  noStroke();
  noiseSeed(0);
  lights();

}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotate(r);

  for (int deg =0; deg<360*5;deg+=20) {
    float ra=20;
    float angle = radians(deg);
    float x = 0+(cos(angle)*radius/2);
    float y = 0+ (sin(angle)*radius/2);

    triangle(z, z, 20, 10, x, y);

    fill(random(200, 233), random(200, 233), random(200, 233));
  }
  radius = radius+20;
  z-=3.2;

  if (radius>400) {
 //   background(random(200, 255), random(200, 255)random(200, 255));
    scale(1.8);
    triangle(width/2, height/2, random(100), random(100), random(100), random(100));
      radius-=500;
    z=10;
  }
  r+=PI/16;
}





float angle = 5.0; 
float speed = 0.09; 
float radiusX = 150.0; 
float radiusY = 150.0;
float sx = 2.0;
float sy = 2.0;
void setup() {
  size(600, 600);
  noStroke();
  smooth();
}
void draw() {

  rect(0, 0, width, height);
  angle += speed;
  for (int i=0; i<20; i++) {
    float sinval = sin(angle*i/5);
    float cosval = cos(angle*i/5);
    float x = 50+i*20 + (cosval * radiusX);
    float y = 50 +i*20+ (sinval * radiusY);
    float x2 = 250 +i*20+ (cosval * radiusX*3);
    float y2 =250 +i*20+ (sinval * radiusY*3);
    fill (random (255),random (123));
    triangle(x, y, x2, y2, 399, 367);
    //triangle(x, y, 439, 400,389,15); 
    //triangle(x,y,150,250,450,20);
  }
}


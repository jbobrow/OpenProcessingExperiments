
float angle = 0.0; 
float speed = 0.05;
float radius = 30.0;
float sx = 2.0;
float sy = 2.0;

void setup() {
  size(500,500);
  noStroke();
  smooth();
}

void draw() {
  fill(0,4);
  rect(0,0,width,height);
  angle +=speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 50 + (cosval *radius);
  float y = 50 + (sinval * radius);
  fill(255, 10, 200, 80);
  triangle(x, y, 2 ,2, x, y);
  float x2 = x + cos(angle * sx) * radius/2;
  float y2 = y + sin(angle * sy) * radius/2;
  triangle(x2, y2, 6, 6, x, y);
  triangle(x*PI, y2, 10, 10, x*PI, y*PI);
  triangle(x*HALF_PI, y2*PI, 6, 6, x, y);
  
  fill(10, 240, 255, 50);
  triangle(300, 300, 2 ,2, x, y);
  triangle (300, 300, x2, y2, x, y);
  triangle(300, 300,x*PI, y2, x*PI, y*PI);
  triangle(300, 300, x*HALF_PI, y2*PI, 6, 6);
}




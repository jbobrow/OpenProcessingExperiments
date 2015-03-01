
float v = 0.0;
float m = 5;
float b = 0.0;
float  q = 0.0;
float xVelocity = 0.08;
float yVelocity = 0.2;
float i = 0;

void setup() {
  size(800, 800);
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  noFill(); 
  strokeWeight(1);


  b = b + xVelocity;
  q = q + yVelocity;
  noFill(); 
  float p = map(hour(), 0, 59, 0, 359);
  stroke(p, 82, 92, 2);
  arc(400, 400, b, b, radians(0), radians(p));
  if (b > width || b < 0) {
    xVelocity *= -1;
  } else if (q > height || q< 0) {
    yVelocity *= -1;
  }


  float f = map(minute(), 0, 59, 0, 359);
  noFill();
  stroke(f, 82, 92, 5);
  arc(width -b, height -b, f, f, radians(0), radians(f));
  if (b > width || b < 0) {
    xVelocity *= -1;
  } else if (q > height || q< 0) {
    yVelocity *= -1;
  }


  float x = map(second(), 0, 59, 0, 359);

  stroke(random(x), 82, 92, 20);

  arc(b, q, x, x, radians(0), radians(x));
  if (b > width || b < 0) {
    xVelocity *= -1;
  } else if (q > height || q< 0) {
    yVelocity *= -1;
  }

 
  strokeWeight(5);
  stroke(p, 82, 92);
  arc(750, 750, 60, 60, radians(0), radians(p));

 

 
  noFill();
  stroke(f, 82, 92);
  //strokeWeight(5);
  arc(750, 750, 40, 40, radians(0), radians(f));



  stroke(x, 82, 92);

  arc(750, 750, 20, 20, radians(0), radians(x));

}




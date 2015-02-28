
float X = 100;
float Y = 100;
float _X = 0;
float _X_MAX = ((X*X + Y*Y) - X*X)/X;
float a2 = (1 + _X/X);
float a1 = -1*(_X / Y);
float a0, b0, b2 = 0;
float b1 = 1;
float sign = 1;
float angle = 0;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  stroke(255);
  smooth();
}

void draw() {
  angle += TWO_PI/1000;  
  if (_X > _X_MAX || _X < 0) {
    sign = -1*sign;
  }
  _X = _X + sign*0.5;

  float a2 = (1 + _X/X);
  float a1 = -_X / Y;
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  background(0);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, -Y);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, +Y);

  rotate(PI/2);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, -Y);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, +Y);

  rotate(PI/2);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, -Y);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, +Y);

  rotate(PI/2);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, -Y);
  triangle(0, 0, a2*X, 0, a2*X + a1*Y, +Y);
  popMatrix();

}


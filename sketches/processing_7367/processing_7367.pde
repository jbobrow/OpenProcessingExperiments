
float n = PI;      // n = 2 , 3, 4, 5, 1/2, e, PI, sqrt(2) etc
float a = 99f;
float k = 10f;

void setup() {
  size(320,320);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  background(0);
  for(float t = -8*PI; t <= 8*PI; t += 0.02) {
//    float r = k*sqrt(a * sin(n * t));
      float r = a * sin(n * t);
//      float r = a * cos(n * t);

    // Polar to Cartesian conversion
    float x = r * cos(t) + width/2;
    float y = r * sin(t) + height/2;
    
    fill(random(255), random(255), random(255)); 

//    point(x, y);
//    rect(x, y, 1, 1);
    ellipse(x, y, 8, 8);
  }
}





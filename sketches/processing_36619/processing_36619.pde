
//Copyright Eric Mackie, September 2011
void setup () {
  size (400, 400);
  background(random(256), random(256), random(256));
  frameRate(10);
}
void draw () {
  float a = 200;
  stroke(255);
  fill(0, 0);
  for (int i=0; i<=360; i=i+30) {
    triangle(i, i, i+random(-50, 50), i+random(-50, 50), i+30, i+30);
    triangle(i, i+a, i+random(-50, 50), i+random(-50+a, 50+a), i+30, i+30+a);
    triangle(i, i-a, i+random(-50, 50), i+random(-50-a, 50-a), i+30, i+30-a);
  }
}               

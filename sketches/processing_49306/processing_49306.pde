
int x = 0;

void setup() {
  size(400, 400);
  background(255);
  colorMode(HSB, 100);
  noFill();
  smooth();
  strokeWeight(2);
  frameRate(10);
}

void draw() {
   stroke(random(200));
 

  if (x < width) {
    
    rect(noise(10) *50, noise(10) *50, random(width/2), random(width/2));
    rect( random(width), random(height), 300, 300);

    line(x, 0, 300, 300);
    line(0, x, 300, 300);
    
    ellipse(x +5, x + 5, 300, 300);
    ellipse(5, 395, random(50), 10);
    ellipse(200, 200, random(50), 10);
    ellipse(395, 5, random(50), 10);
    print(x);
  }

  x = x + 1;
}


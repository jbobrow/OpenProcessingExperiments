
int lineLen = 80;

void setup() {
  size(800, 300);
  colorMode(HSB, 360, 100, 100, 100);
  background(220, 50, 80);
}

void draw() {
  noStroke();
  fill(200+random(40),random(100),random(80)+150, random(40));
  
  x = random(width);
  baseAngle = sin(10*x/width)/3;
//  do {
    y = random(height);
//  } while (sin(20*y/height + baseAngle) < 0.5);
  translate(x, y);
  rotate(baseAngle + random(0.5));
  
  len = random(70) + lineLen;
  
  rect(-len/2, -1, len, 3);
}

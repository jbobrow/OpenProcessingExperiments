
// Star Painted - code by Rodrigo Siqueira - http://js.do/
float position = 0;
float x0=0;
float y0=0;
float radius=40;

size(640, 400);
background(0);

// Create background starfield
for (int x = 0; x <width; x++){
  stroke(random(150));
  point(random(width),random(height));
}

void draw() {
  px = x0 +Math.sin(position * 2 * Math.PI)*random(radius);
  py = y0 -Math.cos(position * 2 * Math.PI)*random(radius);
  line (x0, y0, px, py);
  position += 0.1;
  if (random(100)>98) {
    x0=random(width);
    y0=random(height);
    radius = random(80); // define new max star radius size
    int alpha = 25; // color transparency
    stroke(55+random(200),155+random(100),155+random(100), alpha);
    position = 0; // reset radius counter
  }
}


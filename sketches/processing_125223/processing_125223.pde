
size(400, 400);
background(255);

float x = 20;
float y = 20;
float w = 20;

noFill();

while (x < 400) {
  while (y < 400) {
    w = w * 0.9;

    //    w = sin( (100 - x) / 100 ) * 20 + 15;
    ellipseMode(CENTER);
    ellipse(x, y, w, 10);

    y = y + 20;
  }
  x = x + 20;
  y = 20;
  w = 20;
}


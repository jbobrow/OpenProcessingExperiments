
size(800, 400);

float space = 3;
float gray = 0;
noStroke();

for (float y = 0; y < height; y = y + space) {
  gray = 0;
  for (float x = 0; x < width;x = x + space) {
    fill(gray + random(-255, 255));
    rect(x, y, space, space);
    gray = gray + random(5);
    if (gray > 255)gray = 0;
  }
}

if(!online)saveFrame("frame.png");



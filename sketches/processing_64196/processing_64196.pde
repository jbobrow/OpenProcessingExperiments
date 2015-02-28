
size(600,800);
background(0);
smooth();
PImage cloudImg = loadImage("clouds01.png");

int space = 10;
noStroke();
for (int x = space / 2; x < width;x = x + space) {
  for (int y = space / 2; y < height;y = y + space) {
    color col = cloudImg.get(x,y);
    float brightness = (0.3 * red(col) + 0.59 * green(col) + 0.11 * blue(col)) / 255;
    fill(col);
    ellipse(x,y,brightness * space, brightness * space);
  }
}

if(!online)saveFrame("frame.png");


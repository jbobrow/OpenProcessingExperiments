
size(600,800);


PImage cloudImg = loadImage("clouds01.png");

int space = 40;

for (int x = 0; x < width;x = x + space) {
  for (int y = 0; y < height;y = y + space) {
    int srcSize = (int)random(space / 40, space);
    int change = (srcSize - space) / 2;
    copy(
      cloudImg, 
      x - change, y - change, srcSize, srcSize, 
      x, y, space, space
    );
  }
}

if(!online)saveFrame("frame.png");


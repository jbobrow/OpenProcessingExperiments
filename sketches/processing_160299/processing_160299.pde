
color red   = color(255, 0, 0);
color green = color(0, 255, 0);
color blue  = color(0, 0, 255);
color pixelcolor = color(0);
int colornum   = 1;

void setup() {
  size(400, 400);
  noStroke();
}


void draw() {
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      if (colornum == 1) pixelcolor = red;
      if (colornum == 2) pixelcolor = green;
      if (colornum == 3) pixelcolor = blue;
      fill(pixelcolor);
      rect(x, y, 10, 10);
      if (colornum > 3) {
        colornum = 1;
      } else {
        colornum++;
      } 
    }
  }
  noLoop();
}




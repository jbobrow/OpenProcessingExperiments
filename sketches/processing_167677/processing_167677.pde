
/* @pjs preload="greencell.jpg"; */

PImage img;
color[] imageColors;

void setup() {
  size(400, 400);
  frameRate(4);
  noFill();
  img = loadImage("greencell.jpg");
  imageColors = new color[img.width*img.height];
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
    imageColors[y*img.height + x] = img.get(x, y);
    }
  }
  imageColors = sortColors(imageColors);
}

void draw() {
  fill(0,20);
  rect(0,0,400,400);
  for (int x = 10; x < width; x += 10) {
    int r = int(random(imageColors.length));
    float thick = ((100-r) / 4.0) + 1.0;
    stroke(imageColors[r],120);
    strokeWeight(abs(thick/20000));
    line(x, height, x, height-r+thick);
    line(x, x, x, height-r-thick);
    line(400,400,x,x);
    translate(50,50);
    rotate(PI/8);
     line(400,400,x,x);
  }
}

color[] sortColors(color[] colors) {
  color[] sorted = new color[colors.length];
  int num = 0;
  for (int i = 0; i <= 255; i++) {
    for (int j = 0; j < colors.length; j++) {
      if (int(brightness(colors[j])) == i) {
      sorted[num] = colors[j];
      num++;
      }
    }
  }
  return sorted;
}



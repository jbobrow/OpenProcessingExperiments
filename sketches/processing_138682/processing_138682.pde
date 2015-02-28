
/* @pjs preload="eye.png"; */

size(800, 600);
background (70);
PImage img;
img = loadImage("eye.png");

for (int i=0; i<600; i += 50) {
  for (int j=0; j<600; j += 50) {
tint (30, 8*i, 44*i, 70);
image(img, i ,j);
  }
}

for (int i=0; i<600; i += 120) {
tint (i*i, 250-i, 4*(.05*i), 70);
image(img, i ,i);

}



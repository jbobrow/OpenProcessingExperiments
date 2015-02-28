
size(255, 255);
background(0, 255, 0);
loadPixels();
for (int column=0; column<width;column++) {
  for (int row=0; row<height; row++) {
    if (column<=255&&row<=50||column>=205&&row<=height) {
      pixels[row*width+column]=color(0);
    }
    }}

updatePixels();



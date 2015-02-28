
size(400,400);
background(0);
 

int space = 15;
for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    strokeWeight(5);
    stroke(242,204,47,random(200));
    point(x, y);
  }
}


size(480, 480);
noStroke();
smooth();
int b = 4;


for (float x = 0; x < height; x += b/2) {
  for (float y = 0; y < width; y += b/2) {
    float fx = map(x,0,width,0,128);
    float fy = map(y,0,height,0,128);
    fill(fx+fy);
    ellipse(x, y, b, -b);
    println(fx+fy);
  }
}


void setup () {
  size(600, 600);
}
void draw() {
 float x = mouseX;
float y = mouseY;
float ix = width - mouseX; 
float iy = mouseY - height;
fill(255, 150);
ellipse(x, height/2, y, y);
fill(0, 159);
ellipse(ix, height/2, iy, iy);
fill(255, 150);
ellipse(x, height/4, y, y);
fill(0, 159);
ellipse(ix, height/4, iy, iy);
fill(255, 150);
ellipse(x, height/8, y, y);
fill(0, 159);
ellipse(ix, height/8, iy, iy);
}

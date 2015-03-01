
int x;
int y;
color c1 = color(random(255), random(255), random(255));
color c2 = color(random(255), random(255), random(255));
void setup() {
  size(800, 800);
  background(c2);
  y = 800;
}
void draw() {
  bezier(x, 0, mouseX, mouseY, mouseX, mouseY, 800, y);
  fill(c1);
  if ( x < width){ 
    x+=1;
  } else{
    y-=1;
  }
stroke(c1);
fill(c2);
}
  void mousePressed() {
    background(random(255), random(255), random(255)); 
    fill(c1);
  }




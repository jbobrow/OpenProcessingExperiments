
void setup() {
   size(500,500);
}
void draw() {
  float x = mouseX;
  float y = mouseY;
line(x,80,x,y);
line(20,y,40,40);
line(x,80,x,40);
line(40,y,60,y);
line(60,80,x,40);
}

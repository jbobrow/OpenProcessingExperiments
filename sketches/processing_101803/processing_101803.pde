
int x=80;
int y=30;
int w=80;
int h=60;

void setup() {
  size(240, 120);
}

void draw() {
  background(0, 255, 0);
  if ((mouseX>x) && (mouseY<x+w) &&
      (mouseY>y) && (mouseY<y+h)) {
    fill(0, 0, 255);
   } else {
        fill(255, 0, 0);
   }
     rect(x, y, w, h);
} 

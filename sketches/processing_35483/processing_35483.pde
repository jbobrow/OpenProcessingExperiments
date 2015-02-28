
void setup() {
size (600, 600);
}

void draw() {
background (212, 247, 20);
float x = mouseX;
float y = mouseY;
ellipse (x, y, x+20, y-40);
ellipse (x+20, y, x+40, y-50);
ellipse (x+50, y, x+70, y-70);
stroke (255);
strokeWeight(5);


fill (20, 162, 247);
rect (200, 90, 80, 70);
smooth();
}

void diagonals(int x, int y) {
  line(x, y, x+20, y-40);
  line(x+10, y, x+30, y-40);
  line(x+20, y, x+40, y-40);
}      

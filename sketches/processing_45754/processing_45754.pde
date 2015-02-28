
int posx;
void setup() {
  size(500,500);
  noStroke();
  smooth();
  posx=0;
}

void draw() { 
  background(0);
  if (posx<width) {
    ellipse (posx,300,30,30);
    posx++;
} else {
  posx=0;
}
}

                

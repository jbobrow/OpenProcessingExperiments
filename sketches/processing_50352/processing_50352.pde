
// line moire vertical

void setup() {
  background(0);
  size(400,400);
}

void draw() {
  if(mousePressed) {
     stroke(255);
     strokeWeight(20);
     line(pmouseX,pmouseY, mouseX, mouseY);
  }
}

void mousePressed() {
  background(0);
}

void mouseReleased() {

    melt();
  }

void melt() {
  int loc;
  color black = color(0);
  color white = color(255);
  color c = color(0);

  
for(int y = 0; y< height; y++) {
    for(int x = 0; x<width; x++) {
      if (get(x,y) == white) {
        set(x,y+20, white);
        set(x,y+5, black);
      }
    }
  }
}



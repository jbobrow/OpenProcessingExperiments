
// noise lines

void setup() {
  background(0);
  size(900,450);
  smooth();
  
  // I limited the frameRate to save your computer but change it for faster expansion
  frameRate(30);
}

void draw() {
  if(mousePressed) {
     stroke(255);
     strokeWeight(20);
     line(pmouseX,pmouseY, mouseX, mouseY);
  }
  noiser();
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    background(0);
  }
}

// variables for noiser

  int loc;
  color black = color(0);
  color white = color(255);
  color c = color(0);
  PImage block = createImage(20,20,black);
  
void noiser() {
  for(int y = 0; y< height; y++) {
    for(int x = 0; x<width; x++) {
      if (get(x,y) != black) {
        c = color(random(255), random(255), random(255));
        set(x+int(random(-1,1)),y+int(random(-1,1)), c);
      }
    }
  }
}




// line random expander

void setup() {
  background(0);
  size(900,450);
  
  // I limited the frameRate to save your computer but change it for faster expansion
  frameRate(15);
}

void draw() {
  if(mousePressed) {
     stroke(255);
     strokeWeight(1);
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
  float rand = random(0,255);
  
void noiser() {
  for(int y = 0; y< height; y++) {
    for(int x = 0; x<width; x++) {
      rand = random(0,100);
      
      // change this random limit to change the behavior of the noise expansion
      if (rand > 0) {
        if (get(x,y) != black) {
            c = color(random(255), random(255), random(255));
          set(x+int(random(-4,4)),y+int(random(-4,4)), c);
        }
      } else {
        if (get(x,y) != black) {
            c = color(0);
          set(x+int(random(-4,4)),y+int(random(-4,4)), c);
        } 
      }
    }
  }
}



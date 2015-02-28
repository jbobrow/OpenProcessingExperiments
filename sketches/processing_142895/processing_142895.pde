
int rojo=int(random(255));
int verde=int(random(255));
int azul=int(random(255));
color cp=color(rojo, verde, azul);
PImage merca;
  /* @pjs preload="leaves.jpg"; */
void setup() {
  size(400, 400);

  merca=loadImage("leaves.jpg");
  noFill();
  strokeWeight(7);
  stroke(255);
}


void draw() {
  cp=color(rojo, verde, azul);
  background(255);
  image(merca, 0, 0, 200, 400);
  PImage crop=get(mouseX, mouseY, 60, 80);
  image(crop, 200, 0, 200, 400);
  rect(mouseX, mouseY, 60, 80);
  if (mouseX<200 && mouseY<400) {
    for (int i=200; i<400; i++) {
      for (int j=0; j<400; j++) {
        set(i, j, get(i, j));
      }
    }
    for (int w=mouseX; w<mouseX+60; w++) {
      for (int h=mouseY; h<mouseY+80; h++) {
        set(w, h, get(w, h)+cp);
      }
    }
  }
}


void mouseReleased() {
  rojo=int(random(255));
  verde=int(random(255));
  azul=int(random(255));
}





PVector[] locations = new PVector[10];
boolean drawing;
int dragging = -1;

void setup() {
  size(900, 600);
  drawing = true;
  for (int i = 0; i < locations.length; i++) {
    locations[i] = new PVector(random(width*0.2, width*0.8), random(height*0.15, height*0.85));
  }
}

void draw() {
  if (drawing) {
    background(8);
    noFill();
    for (int n = 0; n < 10; n++) {
      float s = map(n, 0, 10, 6, 1);//strokeWeight - layers get thinner
      float a = map(n, 0, 10, 100, 150);//alpha - layers get less transparent
      float r = map(n, 0, 10, 30, 20);//randomness - layers get less random
      strokeWeight(s);
      for (int i = 0; i < 18; i++) {//18 random versions of the shape 
        stroke(20*n*random(0.5, 1.5), a);//slightly random stroke, gets whiter each layer
        beginShape();
        for (int j = 0; j < locations.length; j++) {//go through the array
          if (dragging == j) {
            locations[j] = new PVector(mouseX, mouseY);//change location if dragging
          }
          PVector loc = locations[j].get();//get the location
 
          if (j != 1 && j != locations.length-2) {//the end points don't get randomized
            float x = random(-1, 1);
            float y = random(-1, 1);
            PVector move = new PVector(x, y);
            move.mult(random(10, r));
            loc.add(move);            //randomize the location
          }

          
          curveVertex(loc.x, loc.y);
        }
        endShape();
      }
      if (n == 9) {
        drawing = false;
      }
    }
  }
}

void mouseDragged() {
  if (dragging == -1) {//if not already dragging 
    for (int i = 0; i < locations.length; i++) {//go through locations array
      if (dist(mouseX, mouseY, locations[i].x, locations[i].y) < 40) {//if contact
        dragging = i;//drag that location
      }
    }
  }
  drawing = true;
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    setup();
  }
}

void mouseReleased() {
  dragging = -1;
}

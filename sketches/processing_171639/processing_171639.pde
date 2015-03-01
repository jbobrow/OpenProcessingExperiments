
int x = 50;

void setup() {
  size(200, 200); //size 200 by 200
}


void movement (int x) {
  rect(mouseX, mouseY, x, x);
}

void draw () {

  while (x<200) {
  background (255);
  movement(50);
  x++;
  }
  background (255);
  if (mousePressed) {
  rectMode(CENTER);
  rect (mouseX, mouseY, 700, 700);//if mouse pressed it will make random forgrounds 
  fill (random(1, 255), random(1, 255), random(1, 255)); //changes to random colors
  } else if (keyPressed) {
  float shapes = random (0, 100);
  ellipse (random (0, 200), random (0, 200), shapes, shapes);
  fill (random(0, 255), random(0, 255), random(0, 255)); //everytime you click circles appear with random sizes, co-ordinates and colors
  } else {
  rect (-40, -40, 700, 700);
  }
  movement(50);
}


//Adam Oaks
//Project 3 - Perimeter Diffusion

/*
left mouse = large circle
 middle mouse = medium circle
 right mouse = small circle
 b = abstract
 s = save concept
 c = clear board
 */

void setup() {
  size (600,600);
  background (0);
  smooth ();
  noStroke(); 
  fill(255);
}

void draw() {
}

void mousePressed() {
  if (mouseButton == LEFT) {           //draws large circle
    ellipse(mouseX,mouseY,150,150);
  }
  if (mouseButton == CENTER) {         //draws medium circle
    ellipse(mouseX,mouseY,110,110);
  }
  if (mouseButton == RIGHT) {          //draws small circle
    ellipse(mouseX,mouseY,75,75);
  }
}

void keyPressed() {
  if((key == 'b') || (key =='B')) {    //abstracts circles
    filter(BLUR,15);
  }
  if((key == 'c') || (key =='C')) {    //clears drawing board
    background(0);
    println("cleared");
  }
  if((key == 's') || (key =='S')) {    //saves image as .jpg
    saveFrame("concept-####.jpg");
    println("saved");
  }
}



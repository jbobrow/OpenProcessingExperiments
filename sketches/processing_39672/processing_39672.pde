
void setup() {
  size(600, 600);
  background(200);
  colorMode(HSB,200,100,200);
  smooth();
}

void draw() {
  println(mouseX + " " + mouseY + " " + pmouseX + " " + pmouseY);
      if (mousePressed){
        ellipse( pmouseX, pmouseY, random(1), random(200));//my eleictric sound wave.
      }
      fill(mouseX, 50, mouseY);
  noStroke();
  /*if (mousePressed) {
    ellipseMode(CORNER); //this is what make all the different. dripping. try this out
fill(50); //black ink
}*/
}

// function called when mouse is pressed
void mousePressed() {
  background(0);
}  // clears the background

// try making the size of the circles random as well


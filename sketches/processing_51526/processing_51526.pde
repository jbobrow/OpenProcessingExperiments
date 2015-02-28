
void setup () {
  size (600, 600);
  background (90, 70, 200);
  smooth ();
  //noStroke();
}

void draw () {
  for (int i = 0; i < width; i +=20) {
    for (int j = 0; j < height; j +=20) {
      if (mouseX > i && mouseX < i+40 && mouseY >j && mouseY < j+40) {
        ellipse (mouseX, mouseY, i*.5, i*.5);
        fill (25, 40);
        noStroke();
      } 
      else {
        noFill();
      }
      if (i%40 == 0 && j%40 == 0) {
        //fill (0, 255, 255); //yellow grid 
        noFill();
        stroke(245, 233, 100);
        strokeWeight (.2);
      }
      ellipse (i, j, 45, 40);
    }
  }
}



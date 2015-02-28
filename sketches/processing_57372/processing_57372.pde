
class Gui {

  int fieldX, fieldY, fieldW, fieldH;

  boolean hover (int fieldX, int fieldY, int fieldW, int fieldH) {
    if (mouseX > fieldX && mouseX < fieldX+fieldW && mouseY > fieldY && mouseY < fieldY+fieldH) {
      return true;
    }
    else {
      return false;
    }
  }


  void make() {
    strokeWeight(2);
    fill(255);
   /* rect(400, 25, 15, 15); // select number of children
    rect(430, 25, 15, 15);
    rect(460, 25, 15, 15);
    rect(225, 25, 50, 50); // input number of generations
    rect(50, 25, 50, 50); // input degree value of angle of incidence */
    rect(400, 650, 50, 15); // clear button
    fill(0);
    strokeWeight(1);
    /* text("2", 405, 75);  // labels for children box
    text("3", 435, 75);
    text("4", 465, 75);
    text("children per", 405, 100);
    text("generation", 405, 115);
    text("angle, in degrees (5-175).", 15, 100); 
    text("generations (2-10)", 200, 100); */
    text("clear", 400, 680);
  }
}


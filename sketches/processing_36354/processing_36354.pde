
void setup() {
  size(300, 300);
  smooth();
  background(219, 4, 4);
}
void draw() {
  if (mouseX < width/2) {

    //face and hair
    fill(0);
    ellipse(width/2, 150, 250, 250);
    fill(255, 183, 106);
    rect(93, 70, 120, 170);

    //lips
    fill(250, 131, 101);
    rect(130, 202, 50, 10);
    rect(120, 194, 50, 8);

    //nose, eyebrows, and eyes
    line(width/2, 120, width/2, 180);
    line(width/2, 180, width/2+12, 180);
    line(width/2+12, 180, width/2+12, 176);
    line(width/2-12, 180, width/2-4, 180);
    line(width/2-12, 180, width/2-12, 176);
    strokeWeight(4);
    line(width/2-10, 110, width/2-40, 110);
    line(width/2+10, 110, width/2+40, 112);
    fill(67, 16, 3);
    ellipse(width/2+25, 125, 5, 5);
    ellipse(width/2-25, 125, 5, 5);

    //facial hair
    fill(0, 50);
    rect(120, 188, 50, 2.5);
    rect(150, 212.5, 3, 25);
  }

  if (mouseX > width/2) {

    //face
    fill(255, 183, 106);
    rect(93, 70, 120, 170);

    //mouth
    fill(250, 131, 101);
    rect(127, 222, 50, 10);
    rect(127, 194, 50, 8);
    fill(113, 27, 17);
    rect(127, 202, 50, 20);
    
     //nose, eyebrows, and eyes
    line(width/2, 120, width/2, 180);
    line(width/2, 180, width/2+12, 180);
    line(width/2+12, 180, width/2+12, 176);
    line(width/2-12, 180, width/2-4, 180);
    line(width/2-12, 180, width/2-12, 176);
    strokeWeight(4);
    line(width/2-10, 120, width/2-40, 110);
    line(width/2+10, 120, width/2+40, 110);
    fill(67, 16, 3);
    ellipse(width/2+25, 125, 9, 9);
    ellipse(width/2-25, 125, 9, 9);
    
    //facial hair
    fill(0, 50);
    rect(127, 188, 50, 2.5);
    rect(150, 232.5, 3, 4);
  }
}



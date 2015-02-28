
void setup() {
  size(350, 350);
  background(255);
  noStroke();
}

void draw() {
  fill(0);
  rect(50, 180, 20, 90); // left side of arm column 1
  rect(50, 310, 20, 20); // left toe column 1
  rect(70, 70, 20, 50); // back of head column 2
  rect(70, 160, 20, 110); // left arm column 2
  rect(70, 290, 20, 40); // left foot column 2
  rect(90, 30, 20, 90); // left ear/side of head column 3
  rect(90, 140, 20, 190); // left body section column 3
  rect(110, 10, 20, 320); // left side column 4
  rect(130, 10, 20, 280); // left side column 5
  rect(150, 10, 20, 260); // midsection column 6
  rect(170, 10, 20, 260); // midsection column 7
  rect(190, 10, 20, 280); // left side column 8
  rect(210, 30, 20, 110); // right face section column 9
  rect(210, 160, 20, 170); // right body section column 9
  rect(230, 30, 20, 20); // right brim of hat column 10
  rect(230, 70, 20, 70); // right face column 10
  rect(230, 160, 20, 170); // right body section column 10
  rect(250, 30, 20, 20); // end brim of hat from right column 11
  rect(250, 70, 20, 50); // right face column 11
  rect(250, 160, 20, 110); // right body section column 11
  rect(250, 290, 20, 40); // right foot column 11
  rect(270, 85, 20, 20); // nose column 12
  rect(270, 180, 20, 90); // right arm column 12 
  rect(270, 310, 20, 20); // right toe column 12
  fill(255); // white eye color
  rect(190, 50, 20, 40); // eye
}


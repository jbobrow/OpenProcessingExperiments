
/*
SM2705_groupA
Assignment 2
Choi Wing Chu Belinda
sid 53084917
*/

void setup() {
  size(600, 600);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  for (int px= width/40; px< width; px+= width/40) {           //allocate px position
    for (int py= height/40; py< height; py+= height/40) {      //allocate py position
        fill(random(209, 255));
        ellipse(px, py, 5, 5);
    }
  }
}

/*
references:
- http://processing.org/reference/
- http://processing.org/tutorials/color/
*/


/*------------------------------
"PacAttack"
Recreation of Pac-Man getting chased by little ghosties.

Created February 15, 2015
By Megan Cattey
megancattey@gmail.com

Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
------------------------------*/

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  noLoop();
}

void draw() {
  ghost(50, 50);
  ghost(175, 255);
  ghost(300,115);
  ghost(450, 390);
  ghost(105, 450);
  
  fill(255,255,1);
  arc(485,250,70,70,0.47,5.81);  //pacman
}
void ghost(int x, int y) {
  fill(random(5, 255), random(5, 255), random(5, 255));
  rectMode(CENTER);
  rect(x, y-15, 26, 30); //top of ghost head
  rect(x, y-9, 44, 30);
  rect(x, y-3, 52, 30);
  rect(x, y+3, 62, 30);
  rect(x, y+15, 70, 30); // end of ghost head
  rect(x-33, y+33, 4, 16); //ghost squiggles begin
  rect(x-28, y+33, 6, 8);
  rect(x-16, y+33, 6, 8);
  rect(x-8, y+33, 10, 16);
  rect(x+8, y+33, 10, 16);
  rect(x+16, y+33, 6, 8);
  rect(x+28, y+33, 6, 8);
  rect(x+33, y+33, 4, 16); //ghost squiggles end

  fill(255); //white
  rect(x-5, y+2, 10, 26); // ghost left eye
  rect(x-5, y+2, 20, 16); //ghost left eye
  rect(x+22, y+2, 10, 26); // ghost right eye
  rect(x+22, y+2, 20, 16); // ghost right eye

  fill(0, 128, 255);  //blue for iris
  rect(x, y+5, 9, 10); // ghost left iris
  rect(x+27, y+5, 9, 10); // ghost right iris
}


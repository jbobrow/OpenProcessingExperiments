
/*------------------------------
 "Attack of the Functions v.3"
 Recreation of Pac-Man getting chased by little ghosties.  Practice using functions.  Ghosts were created as a function with randomized color.
 
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
  smooth();
  noLoop();
}


void draw() {
  ghost(50, 245);
  ghost(130, 245);
  ghost(220, 245);
  ghost(300, 245);
  ghost(380, 245);

  horizontals(0, 200, 345, 200); //pt1 line above ghosts
  horizontals(455, 200, 500, 200); //pt2 of line above ghosts
  caps(345, 200, 345, 206);  //pt1 line above ghost endcap
  caps(455, 200, 455, 206);  //pt2 line above ghost endcap

  horizontals(0, 300, 95, 300);  //pt1 line below ghosts
  horizontals(205, 300, 500, 300);  //pt2 line below ghosts
  caps(95, 300, 95, 306);  //pt1 line below ghost endcap
  caps(205, 300, 205, 306);  //pt2 line below ghost endcap

  horizontals(210, 100, 500, 100); //top horizontal line
  caps(210, 100, 210, 106); //top horizaontal line endcap

  horizontals(100, 400, 400, 400);  //bottom horizontal line
  caps(100, 400, 100, 406);  //bottom horizontal line endcap
  caps(400, 400, 400, 406);  //bottom horizontal line endcap

  verticals(100, 0, 100, 106);  //first vertical line
  caps(100, 106, 106, 106);  //first vertical line endcap  

  noStroke();
  fill(255, 255, 1);
  arc(485, 250, 70, 70, 0.47, 5.81);  //pacman

  fill(255);
  ellipse(430, 250, 10, 10); //pacman food in middle line
  ellipse(175, 250, 10, 10); //pacman food in middle line
}



void ghost(int x, int y) {
  noStroke(); 
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

  fill(0, 128, 255); //blue for iris
  rect(x, y+5, 9, 10); // ghost left iris
  rect(x+27, y+5, 9, 10); // ghost right iris
}

void horizontals(int x, int y, int x2, int y2) {
  stroke(0, 94, 255); 
  strokeWeight(2.25); 
  line(x, y, x2, y2); 
  line(x, y+6, x2, y2+6);
}

void verticals(int x, int y, int x2, int y2) {
  stroke(0, 94, 255); 
  strokeWeight(2.25); 
  line(x, y, x2, y2); 
  line(x+6, y, x2+6, y2);
}
void caps(int x, int y, int x2, int y2) {
  stroke(0, 94, 255); 
  strokeWeight(2.25); 
  line(x, y, x2, y2);
}


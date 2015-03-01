
/*Created by Terry Moore
Contact: terryjuku@yahoo.com
Art 3001
Last Modified: 2.17.15 */




void setup() {
size(400, 400);
noStroke();
smooth();
noLoop();
background (118, 236, 216);
}

void draw () {
  Square (200, 200, 50, 50); //These values call for each variable within the Square function
  Square (50, 200, 20, 20);
  Square (200, 100, 30, 30);
  Square (350, 50, 10, 10);
  Square (25, 80, 40, 40);
  Square (20, 300, 50, 50);
  Square (200, 10, 10, 10);
  Square (300, 300, 50, 50);
}

void Square (int a, int b, int c, int d) { //Assigning the parameters and variables for the Square function

  fill (random (255), random (255), random (255)); //Applying randomized colors for each square

rect (a, b, c , d); //Drawing each rectangle using the assigned variables
}

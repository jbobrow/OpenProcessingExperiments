
//My monster is a relatively stationary one, however, moving the mouse up and down the Y-axis will reveal its toothy grin.
//The size of its eyes and pupils are also controlled by the position of one's mouse along the Y-axis,
//the only exception being for the pupils, which dilate horizontally as well as vertically.
//I also made the little bumps on the monster's head grow and shrink in size as well.
//By dividing mouseY with varying numbers, I was able to get different rates of growth for different shapes.
//A problem I could not figure out was how to stop the lower jaw of the monster from covering the rest of its face.
//Making sure the jaw didn't move too low was as simple as creating another static rectangle beneath the moving one.

void setup() {
  size(640, 640); //Sets the size of the window
}
void draw() {
  background(255);
  fill(0); // This large section of lines create the teeth of my monster.
  line(122, 220, 122, 640); 
  line(518, 220, 518, 640);
  line(160, 220, 160, 640);
  line(140, 220, 140, 640);
  line(180, 220, 180, 640);
  line(200, 220, 200, 640);
  line(220, 220, 220, 640);
  line(240, 220, 240, 640);
  line(260, 220, 260, 640);
  line(280, 220, 280, 640);
  line(300, 220, 300, 640);
  line(320, 220, 320, 640);
  line(340, 220, 340, 640);
  line(360, 220, 360, 640);
  line(380, 220, 380, 640);
  line(400, 220, 400, 640);
  line(420, 220, 420, 640);
  line(440, 220, 440, 640);
  line(460, 220, 460, 640);
  line(480, 220, 480, 640);
  line(500, 220, 500, 640);
  line(122, 325, 518, 325); //This horizontal line cross-sections the previous lines to create a grin.
  arc(width/2, 240, 400, 385, PI, TWO_PI); //This arc serves as the semi-circle top portion of my monster's head.
  fill(255); //The following two ellipses are the whites of my monster's eyes, they grow and shrink according to the Y-coordinate of the mouse.
  ellipse(440, 200, 44, mouseY/10);
  fill(255);
  ellipse(200, 200, 44, mouseY/10);
  fill(0); //The next two ellipses are pupils that use the mouseY variable to scale both the horizontal and vertical width.
  ellipse(200, 200, mouseY/18, mouseY/18); 
  fill(0);
  ellipse(440, 200, mouseY/18, mouseY/18);
  fill(0); //The following five ellipses add more detail to the top of my monster's head by overlapping with the main ellipse. Their size is also controlled by the mouseY variable.
  ellipse(320, 60, mouseY/5, mouseY/5); 
  fill(0);
  ellipse(250, 90, mouseY/6,  mouseY/6);
  fill(0);
  ellipse(390, 90, mouseY/6, mouseY/6);
  fill(0);
  ellipse(200, 120, mouseY/7, mouseY/7);
  fill(0);
  ellipse(440, 120, mouseY/7, mouseY/7);
  fill(0); //This rectangle cross-sections my monster's body and creates it's arms.
  rect(20, 450, 600, 50);
  fill(0); //This rectangle, with its movable Y-axis starting point, serves as the movable lower jaw of my monster.
  rect(120, mouseY, 400, 600); 
  fill(0); //This static rectangle makes sure one can't accidentally pull down my monster's jaw too far.
  rect(120, 400, 400, 800); 
}



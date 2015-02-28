
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Singer
// Assignment 02, no due date
// Modification 02

PImage img;

 void setup() {
 size(800, 800);
 img = loadImage("PinkBlueSkyWater5.jpg");
 smooth();
 noStroke();
}

void draw() {
  image(img, 0, 0, 800, 800);

 // face
 fill(255, 185, 244);  // pink (medium)
 ellipse(400, 400, 250, 250);

 // ear (left)
 fill(255, 185, 244);  // pink (medium)
 triangle(278, 375, 235, 200, 380, 276);

 // ear (right)
 fill(255, 185, 244);  // pink (medium)
 triangle(375, 275, 625, 275, 523, 375);

 // eye (left)
 fill(185, 144, 174, 75);  // pink (dark transparent)
 ellipse(368, 413, 150, 150);  // drop shadow 3 pixels right & down
 
 fill(91, 94, 98);  // gray
 ellipse(365, 410, 150, 150);  // eyelid 
 
 fill(229, 242, 255);  // blue (light)
 float BlinkLeft = constrain(mouseY, 20, 150);
 ellipse(365, 410, 150, BlinkLeft);  // sclera
 
 fill(91, 94, 98);  // gray
 arc(365, 410, 25, 125, radians(10), radians(350));  // pupil

 // eye (right)
 fill(185, 144, 174, 75);  // pink (dark transparent)
 ellipse(483, 413, 60, 60);  // shadow 3 pixels right & down
 
 fill(91, 94, 98);  // gray
 ellipse(480, 410, 60, 60);  // eyelid 
 
 fill(229, 242, 255);  // blue (light)
 float BlinkRight = constrain(mouseY, 10, 60);
 ellipse(480, 410, 60, BlinkRight);  // sclera
 
 fill(91, 94, 98);  // gray
 arc(480, 410, 10, 25, radians(10), radians(350));  // pupil
 
 /*
 The trick for the blink is to control the size of the
 light blue elipses (the scleras)... Not the gray eyelids.
 The pupils appears to be covered by the eyelids,
 but in fact they remain in front of the eyelids.
 This only works because the pupils and eyelids are the same color.
 Thank you, Eric!!     :)
 */

 // whiskers
 fill(91, 94, 98);  // gray

 beginShape();  // left top whisker
 vertex(400, 485);
 vertex(115, 525);
 vertex(110, 522);
 endShape(CLOSE);

 beginShape();  // right top whisker
 vertex(400, 475);
 vertex(680, 475);
 vertex(685, 472);
 endShape(CLOSE);

 beginShape();  // left bottom whisker
 vertex(400, 490);
 vertex(215, 550);
 vertex(210, 548);
 endShape(CLOSE);

 beginShape();  // right bottom whisker
 vertex(400, 480);
 vertex(580, 500);
 vertex(585, 498);
 endShape(CLOSE);

}






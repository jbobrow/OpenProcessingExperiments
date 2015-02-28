
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Singer
// Assignment 02, DUE 09/07/11
// Modification 01

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
  ellipse(368, 413, 150, 150);  // shadow 3 pixels right & down
  fill(229, 242, 255);  // blue (light)
  ellipse(365, 410, 150, 150);
  fill(0, 150);  // black (transparent)
  arc(365, 410, 25, 125, radians(10), radians(350));  // pupil
  // Why won't the arc display in the flip direction?:
  // arc(365, 410, 25, 125, radians(190), radians(170));
    
  // eye (right)
  fill(185, 144, 174, 75);  // pink (dark transparent)
  ellipse(483, 413, 60, 60);  // shadow 3 pixels right & down
  fill(229, 242, 255);  // blue (light)
  ellipse(480, 410, 60, 60);
  fill(0, 150);  // black (transparent)
  arc(480, 410, 10, 25, radians(10), radians(350));  // pupil
  
  // whiskers
  fill(0, 100);  // black (transparent)
  
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
  
  // broken blink
  // Caroline Record helped me with the blink code (thank you!!), and it worked as a rectangle...
  // ...But when I translated it to an arc, it looks like a windshield wiper. Mrowwwwwww...
  float ey = 40;
  fill(0);
  float dy = constrain((mouseY-ey)/20, -13, 14);
  fill(255, 224, 250);  // pink (light)
  arc(365, 410, 150, 150, PI, dy);  // eyelid (left)
  arc(480, 410, 60, 60, PI, dy);  // eyelid (right)
  
}


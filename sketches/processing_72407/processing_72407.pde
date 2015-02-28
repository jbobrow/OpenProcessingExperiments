
color[] colors = new color[24];

void setup() {
  size(640, 360);
  smooth();
  background(250);
  frameRate(5);
//  noLoop();
  
  colors[0] = color(220, 20, 60, 97);
  colors[1] = color(255, 48, 48, 100);
  colors[2] = color(255, 69, 0, 75);
  colors[3] = color(255, 125, 64, 75);
  colors[4] = color(255, 153, 18, 75);
  colors[5] = color(255, 255, 0, 75);
  colors[6] = color(192, 255, 62, 75);
  colors[7] = color(127, 255, 212, 75);
  colors[8] = color(0, 250, 154, 75);
  colors[9] = color(0, 238, 118, 75);
  colors[10] = color(0, 201, 87, 75);
  colors[11] = color(0, 199, 140, 75);
  colors[12] = color(72, 209, 204, 75);
  colors[13] = color(121, 205, 205, 75);
  colors[14] = color(0, 255, 255, 75);
  colors[15] = color(152, 245, 255, 75);
  colors[16] = color(0, 191, 255, 75);
  colors[17] = color(51, 161, 201, 75);
  colors[18] = color(67, 110, 238, 75);
  colors[19] = color(0, 0, 205, 75);
  colors[20] = color(0, 0, 139, 90);
  colors[21] = color(71, 60, 139, 75);
  colors[22] = color(155, 48, 255, 75);
  colors[23] = color(205, 0, 205, 75);
  
  noStroke();
  
//miscellaneous infographics
noStroke();

//smaller light blue circle
fill(0, 245, 255, 14);
ellipse(100, 200, 75, 75);

//big light blue circle
fill(0, 245, 255, 34);
ellipse(200, 260, 225, 225);

//yellow pie chart
fill(179, 238, 58, 55);
arc(170, 160, 110, 110, 0, PI+HALF_PI);

//turquoise thing radiating from top left
fill(127, 225, 212, 15);
for (int i = 1; i <400; i +=20) {
  ellipse(i+5, i+1, i+5, i+5);
}

//yellow thing radiating from top left
fill(225, 225, 0, 2);
for (int i = 1; i <400; i +=20) {
  ellipse(-5, i+50, i+50, i+50);
}

//purple polka dots, looped
fill(176, 5, 255, 13);
noStroke();
  for (int fff = 1; fff <= height+360; fff += 70) {
  for (int eee = 1; eee <= width-60; eee += 70) {
    ellipse(fff, eee, 20, 20);
  }
}

//more pie charts

//bluish-purple ones
fill(0, 0, 225, 70);
arc(80, 260, 120, 120, QUARTER_PI, PI+QUARTER_PI);

arc(220, 290, 100, 100, 2, TWO_PI+HALF_PI);

//red one
fill(255, 64, 64, 99);
arc(160, 240, 100, 100, 1, PI+HALF_PI);

//outline banner, just exterior
line(170.95, 35.27, 341.3, 35.27);
line(341.3, 35.27, 341.3, 17.35);
line(341.3, 17.35, 469, 17.35);
line(469, 17.35, 450.33, 53.61);
line(450.33, 53.61, 404.12, 53.75);
line(404.12, 53.75, 404.12, 71.95);
line(404.12, 71.95, 233.76, 71.95);
line(233.76, 71.95, 233.76, 90.15);
line(233.76, 90.15, 106.1, 90.15);
line(106.1, 90.15, 124.77, 53.75);
line(124.77, 53.75, 170.95, 53.75);
line(170.95, 53.75, 170.95, 35.27);
  
}

void draw() {

//polka dots! (the ones on the right)
noStroke();

  for (int i=0; i<23; i++) {
  for (int a = 0; a < width; a += 15) {
  for (int b = 0; b < height+15; b += 15) {
      fill(colors[int(random(23))]);
      ellipse(430+a, b, 10, 10);
    }
  }
} 

//rectangle
//fill(225, 5);
//rect(425, 0, 215, 360);

//platonic solid
noStroke();

//third darkest
fill(192);
beginShape();
vertex(509, 419.75); 
vertex(491, 324);
vertex(540.5, 234.5);
vertex(470.5, 299);
vertex(372.5, 299);
vertex(461, 331);
endShape();

beginShape();
vertex(540.5, 234.5);
vertex(596.25, 319);
vertex(652, 342);
vertex(586, 353.5);
vertex(509, 419.75);
vertex(569, 334);
endShape(CLOSE);

beginShape();
vertex(288, 286);
vertex(311, 333);
vertex(372.5, 299);
vertex(322.5, 367);
vertex(313, 367);
endShape(CLOSE);

triangle(372.5, 299, 412, 396, 383, 399.5);

//absolute darkest
noStroke();
fill(128);
quad(391.5, 408, 466, 305, 591.5, 329.5, 475, 326.5);
quad(288, 286, 336, 289, 391.5, 408, 336, 308);
quad(587, 168, 565.5, 219.5, 591.5, 329.5, 551, 204.5);
triangle(591.5, 329.5, 571.5, 367, 565.5, 367);
triangle(591.5, 329.5, 647, 266, 640, 291);

beginShape();
vertex(587, 168);
vertex(640, 267.5);
vertex(652, 342);
vertex(614, 246.5);
vertex(540.5, 234.5);
vertex(608, 218);
endShape();

beginShape();
vertex(587, 168);
vertex(540.5, 164.5);
vertex(540.5, 234.5);
vertex(507, 162.5);
vertex(406.11, 147.35);
vertex(467.5, 138.5);
endShape(CLOSE);

//third darkest, also
fill(192);
triangle(591.5, 329.5, 626, 408, 606, 411.5);
quad(587, 168, 647, 266, 591.5, 329.5, 627, 261);

beginShape();
vertex(406.11, 147.35);
vertex(346.5, 224.5);
vertex(372.5, 299);
vertex(324, 249);
vertex(288, 286);
vertex(347.06, 199.5);
endShape(CLOSE);

beginShape();
vertex(406.11, 147.35);
vertex(444, 198);
vertex(540.5, 234.5);
vertex(440, 229);
vertex(372.5, 299);
vertex(415, 209);
endShape();

//white
fill(255);
quad(427, 194, 466, 305, 391.5, 408, 446, 305);
quad(427, 194, 538.5, 196.5, 587, 168, 551, 204.5);
quad(406, 147.39, 472, 126, 427, 194, 450.5, 142.5);
quad(406, 147.39, 368, 174.5, 427, 194, 340, 180);
quad(288, 286, 340, 270.5, 427, 194, 336, 289);
triangle(288, 286, 313, 367, 299, 360);
triangle(591.5, 329.5, 565.5, 367, 554.5, 367);

//second darkest
fill(245);
quad(427, 194, 480.5, 289, 591.5, 329.5, 466, 305);
quad(427, 194, 551, 204.5, 591.5, 329.5, 538, 223.75);
quad(427, 194, 472, 126, 587, 168, 482.5, 146);
quad(427, 194, 347, 199.5, 288, 286, 340, 180);
quad(427, 194, 361, 292, 391.5, 408, 336, 289);
quad(1, 1, 2, 2, 3, 3, 4, 4);
triangle(591.5, 329.5, 626, 382, 626, 408);

//banner
stroke(1);
strokeWeight(.15);
strokeJoin(ROUND);
fill(176, 226, 255);
quad(341.3, 17.35, 469, 17.35, 450.33, 53.61, 341.3, 53.61);
quad(124.77, 53.75,  233.76, 53.75, 233.76, 90.15, 106.1, 90.15);
fill(141, 182, 205);
triangle(170.95, 71.95, 233.76, 71.95, 233.76, 90.02);
triangle(404.12, 35.27, 341.3, 35.27, 341.3, 17.35);
fill(176, 226, 255);
quad(170.95, 35.27, 404.12, 35.27, 404.12, 71.95, 170.95, 71.95);

}

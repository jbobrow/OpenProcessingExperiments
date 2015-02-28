
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064
 
 
 
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
 
void setup() {
  size(600, 600);
  stroke(600);
  colorMode (RGB, 600);
 
 
 
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.3;
  minutesRadius = radius * 0.2;
  hoursRadius = radius * 0.1;
  clockDiameter = radius * 1.8;
 
  cx = width / 2;
  cy = height / 3;
}
 
 
 
 
 
 
void draw() {
   
   
  background(590, 550, 480);
  //body
  noStroke();
  fill(400, 150, 150);
  quad (90, 210, 70, 275, 535, 386, 551, 316);
  fill(400, 150, 150);
  quad (69, 274, 59, 336, 523, 448, 536, 383);
  fill(400, 150, 150);
  quad (90, 212, 112, 183, 558, 282, 550, 320);
  fill(400, 150, 150);
  quad (74, 352, 68, 337, 523, 447, 520, 462);
 
  fill(400, 150, 150);
  bezier(117, 186, 107, 177, 79, 204, 92, 224);
  fill(400, 150, 150);
  bezier(92, 210, 71, 193, 33, 262, 76, 277);
  fill(400, 150, 150);
  bezier(73, 275, 49, 267, 30, 326, 61, 337);
  fill(400, 150, 150);
  bezier(557, 279, 572, 289, 560, 344, 541, 341);
  fill(400, 150, 150);
  bezier(551, 320, 562, 327, 548, 386, 531, 389);
  fill(400, 150, 150);
  bezier(535, 380, 548, 389, 538, 447, 521, 446);
  fill(400, 150, 150);
  bezier(525, 442, 535, 445, 524, 471, 513, 469);
 
  //body-darkside
  noStroke();
  fill(300, 100, 100);
  quad (70, 275, 58, 255, 540, 366, 535, 386);
  fill(300, 100, 100);
  quad (59, 336, 46, 323, 526, 432, 523, 448);
  fill(300, 100, 100);
  quad (90, 212, 97, 195, 553, 302, 549, 318);
  fill(300, 100, 100);
  quad (71, 349, 84, 358, 515, 469, 520, 459);
 
  //body-light
  noStroke();
  fill(450, 250, 250);
  quad (88, 220, 86, 227, 548, 338, 549, 329);
  fill(450, 250, 250);
  quad (66, 298, 69, 286, 535, 396, 531, 411);
  fill(450, 250, 250);
  quad (110, 188, 116, 183, 560, 281, 558, 286);
 
  //tape
  fill(500, 510, 380);
  bezier(270, 220, 194, 226, 195, 361, 236, 402);
  fill(500, 510, 380);
  quad (311, 421, 308, 362, 247, 316, 235, 400);
  fill(500, 510, 380);
  quad (308, 362, 316, 286, 253, 249, 240, 342);
  fill(500, 510, 380);
  quad (316, 286, 345, 235, 270, 223, 252, 276);
 
  //line
  stroke(random(255),random(255),random(255));
  strokeWeight (4);
  noFill();
  bezier(233, 213, 120, 100, 100, 100, 90, 200);
 
  stroke(random(180),random(90),random(50));
  strokeWeight (9);
  noFill();
  bezier(211, 205, 114, 135, 14, 170, 64, 216);
 
  stroke(random(390),random(300),random(300));
  strokeWeight (8);
  noFill();
  bezier(202, 195, 66, 120, 0, 226, 53, 251);
 
  stroke(random(390),random(200),random(180));
  strokeWeight (8);
  noFill();
  bezier(202, 195, 100, 110, 10, 220, 53, 251);
 
  stroke(random(100),random(0),random(0));
  strokeWeight (4);
  noFill();
  bezier(233, 213, 105, 95, 49, 137, 90, 200);
 
//starlight-1
  stroke(random(500),random(400),random(300));
  strokeWeight (4);
  noFill();
  line(180,100,200,180);
  stroke(random(500),random(400),random(300));
  strokeWeight (6);
  noFill();
  line(130,100,200,180);
  stroke(random(500),random(400),random(300));
  strokeWeight (3);
  noFill();
  line(155,100,200,180);
 
 
  //timer
  noStroke();
  fill(255, 255, 255);
  ellipse(310, 225, 250, 220);
 
  noStroke();
  fill(300, 300, 300);
  ellipse(303, 210, 235, 215);
 
  stroke(480,320,350);
  strokeWeight (3);
  fill(400, 400, 400);
  ellipse(298, 198, 220, 200);
 
  
 
 
 
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
 
  // Draw the hands of the clock
  stroke(RGB, mouseX/(width/600), mouseY/(height/600), 600);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  stroke(100, 350, 550);
  strokeWeight(6);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  stroke(550, 150, 150);
  strokeWeight(9);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
 
  // Draw the minute ticks
 
    stroke(RGB, mouseX/(width/600), mouseY/(height/600), 600);
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
 
  //Clock Text 
  fill(600, 600, 600);
  textSize(40);
  text("A", 50, 550);
 
  fill(580, 250, 280);
  textSize(40);
  text("TIME", 90, 550);
 
  fill(380, 220, 500);
  textSize(40);
  text("BOMB", 190, 550);
 
  if(second()==59){
   
  fill(random(255),20,20);
  rect(0,0,width,height);
  
  //BOMB!!!!!
    fill(random(400), 200, 200);
  textSize(150);
  text("BOMB!!!!!", 0, 150);
  
  fill(random(400), 200, 200);
  textSize(150);
  text("BOMB!!!!!", 0, 300);
 
   fill(random(550), 200, 200);
  textSize(150);
  text("BOMB!!!!!", 0, 450);
 
  fill(random(550), 200, 200);
  textSize(150);
  text("BOMB!!!!!", 0, 580);
  
 }

  endShape();
 
 
 
 
  translate(mouseX, mouseY);
  noStroke();
  fill(random(600), 550, 100, 100);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
   
   
 
 
} 


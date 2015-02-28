
float speed  = 0.0;
float easing = 0.07; 

void setup() {
  size(863, 550);
  smooth();
}

void draw() {
  background(255);
  translate(220, 43);
  scale(0.7, 0.7);
  noFill();
  strokeWeight(2.5);
  stroke(0);
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * easing;
  rect(-280, -35, 1168, 735);
  line(-227, -11, 826, -11);
  line(826, -11, 826, 675);
  line(826, 675, -227, 675);
  line(-227, 675, -227, 126);
  line(-227, 126, -227, -11);  
  bezier(-26, 336, -26, 307, -39, 277, -61, 260);
  bezier(-61, 403, -40, 388, -26, 364, -26, 336); 
  bezier(-62, 259, -61, 259, -61, 259, -61, 260);
  line(-61, 260, -61, 127);
  line(-61, 127, -227, 127);
  line(-227, 127, -227, 240);
  line(-227, 240, -227, 295);
  line(-227, 295, -245, 295);
  line(-245, 295, -245, 367);
  line(-245, 367, -227, 367);
  line(-227, 367, -227, 424);
  line(-227, 424, -227, 535);
  line(-227, 535, -61, 535);
  line(-61, 535, -61, 403);
  bezier(-61, 403, -61, 403, -61, 403, -62, 404);
  bezier(-62, 404, -61, 403, -61, 403, -61, 403);
  line(-61, 403, -61, 260);
  bezier(-61, 260, -61, 259, -61, 259, -62, 259);
  bezier(625, 336, 625, 307, 638, 277, 660, 260);
  line(660, 260, 660, 403);
  bezier(660, 406, 639, 388, 625, 364, 625, 336);
  bezier(661, 264, 660, 259, 660, 259, 660, 260);
  line(660, 260, 660, 127);
  line(660, 127, 826, 127);
  line(826, 127, 826, 240);
  line(826, 240, 826, 295);
  line(826, 295, 844, 295);
  line(844, 295, 844, 367);
  line(844, 367, 826, 367);
  line(826, 367, 826, 424);
  line(826, 424, 826, 535);
  line(826, 535, 660, 535);
  line(660, 535, 660, 403);
  bezier(660, 403, 660, 403, 660, 403, 660, 404);
  bezier(660, 404, 660, 403, 660, 403, 660, 403);
  line(660, 403, 660, 260);
  bezier(660, 260, 660, 259, 660, 259, 661, 259);
  bezier(396, 331, 396, 383, 354, 424, 303, 424);
  bezier(303, 424, 252, 424, 210, 383, 210, 331);
  bezier(210, 331, 210, 280, 252, 238, 303, 238);
  bezier(303, 238, 354, 238, 396, 280, 396, 331);

  line(304, -10, 304, 676);
  rect(-227, 240, 55, 184);
  rect(770, 240, 55, 184);
  bezier(-227, 11, -215, 11, -206, 1, -206, -10);
  bezier(826, 11, 814, 11, 804, 1, 804, -10);
  bezier(826, 653, 814, 653, 804, 663, 804, 675);
  bezier(-227, 653, -216, 653, -206, 663, -206, 675);
  pushMatrix();
  fill(0);
  ellipse(716, 327, 9, 9);
  ellipse(-119, 327, 9, 9);
  ellipse(304, 332, 9, 9);
  popMatrix();



  noFill();
  stroke(3);
  stroke(0); 
  ellipse(mouseX%140, 330, speed,  speed);
  pushMatrix();
  translate(500, 0);
    ellipse(-mouseX%200+150, 330, speed,  speed);
   popMatrix();

//  ellipse(-200, 50*5+80, target, target); 
//  ellipse(-200, 50*5+80, speed, speed);
//  ellipse(width-50, 50*5+80, speed, speed);
}



void setup() {
  size(200,200);
  smooth();
  noCursor();
  frameRate(30);
}

void draw() {
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  noStroke();
  
  // TATAMI WALL
  fill(150,50,15);
  rect(33,100,3,200);
  rect(66.6,100,6,200);
  rect(100,100,3,200);
  rect(133.3,100,6,200);
  rect(167,100,3,200);
  
  // FLOOR
  fill(250,220,170);
  rect(100,170,200,60);
  stroke(45,20,0);
  strokeWeight(4);
  line(55,140,33,200);
  line(145,140,167,200);
  noStroke();
  fill(150,50,15);
  rect(100,20,200,2);
  rect(100,40,200,2);
  rect(100,60,200,2);
  rect(100,80,200,2);
  rect(100,100,200,2);
  rect(100,120,200,2);
  rect(100,140,200,4);
  
  // EARS
  fill(239,171,118);
  triangle(65,35,90,35,78,18);
  triangle(110,35,135,35,123,18);
  fill(247,220,232);
  triangle(69,35,86,35,78,23);
  triangle(114,35,131,35,123,23);
  
  // HEAD
  fill(239,171,118);
  rect(100,52,70,7);
  triangle(65,55,135,55,100,105);
  triangle(65,54,61,82,100,105);
  triangle(135,54,139,82,100,105);
  
  // TORSO
  fill(239,171,118);
  triangle(100,82,65,130,135,130);
  
  // MOUTH
  fill(0);
  ellipse(100,70,52,52);
  fill(239,171,118);
  rect(100,55,64,30);
  
  // TEETH
  fill(255);
  rect(100,73,13,6);
  
  // NOSE
  fill(255,0,0);  
  triangle(97,63,103,63,100,67);
  
  // HEADBAND
  fill(255,0,0);
  rect(100,42,70,14);
  triangle(66,48,45,52,48,58);
  triangle(66,48,49,61,53,66);
  
  // HEADBAND DETAIL
  fill(255);
  ellipse(100,42,8,8);
  
  // EYES
  fill(0);
  ellipse(80,60,14,14);
  ellipse(120,60,14,14);
  
  // EYE SHINE
  fill(255);
  ellipse(77,56,3,3);
  ellipse(117,56,3,3);
  
  // SHIRT
  fill(0);
  quad(85,102,100,112,80,130,72,120);
  quad(115,102,100,112,120,130,128,120);
  quad(103,112,120,130,80,130,97,112);
  
  // PANTS
  fill(0);
  quad(80,130,120,130,120,160,103,160);
  quad(120,130,80,130,80,160,97,160);
  
  // FEET
  fill(239,171,118);
  triangle(80,160,97,160,88,175);
  triangle(120,160,103,160,111,175);
  
  // BELT
  fill(255,0,0);
  rect(100,134,40,8);
  
  // BELT DETAIL
  fill(255,242,0);
  ellipse(100,134,20,16);
  
  // WHISKERS
  stroke(0);
  strokeWeight(1);
  line(132,72,152,67);
  line(132,78,152,83);
  line(132,75,152,75);
  line(68,72,48,67);
  line(68,78,48,83);
  line(68,75,48,75);
  
  // SWORD
  noStroke();
  fill(82,45,0);
  rect(mouseX,mouseY,6,16);
  fill(255,210,0);
  rect(mouseX,mouseY-8,12,4);
  fill(175);
  quad(mouseX-3,mouseY-10,mouseX+3,mouseY-10,mouseX+3,mouseY-56,mouseX-3,mouseY-49);
  
  // SLASH
  stroke(255,255,0);
  strokeWeight(abs(pmouseX-mouseX)/2);
  line(pmouseX+3,pmouseY-56,mouseX+3,mouseY-56); 
  
}


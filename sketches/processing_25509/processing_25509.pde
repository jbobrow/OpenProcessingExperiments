
float angle = 0
;
void setup() {
  size(348,538);
  //size(1000,1000);
  background(255);
  
}

void draw() {
  if(mousePressed && (mouseButton == RIGHT)) {
   angle++;
  }
  
  background(255);
  smooth();
  noStroke();
  fill(18,44,118);
  ellipse(853,-97, 1800,1000);
  rectMode(CENTER);
  
  pushMatrix();
  stroke(0,0,255);
  fill(255);
  translate(27, 532);
  rotate(radians(42));
  rect(0, 0, 30, 90);
  popMatrix();

pushMatrix();
  noStroke();
  fill(42, 76, 99);
  translate(41, 430);
  rotate(radians(42));
  rect(0, 0, 85, 333);
  popMatrix();
  
  
  
  pushMatrix();
  noStroke();
  fill(0);
  translate(164,297);
  rotate(radians(42));
  rect(0, 0, 133, 40);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(0);
  translate(118, 319);
  rotate(radians(42));
  rect(0, 0, 63, 32);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(255,0,0);
  translate(98, 312);
  rotate(radians(42));
  rect(0, 0, 24, 17);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(255);
  translate(120, 321);
  rotate(radians(42));
  rect(0, 0, 5, 32);
  popMatrix();

  
  
 
  if(mousePressed && (mouseButton == LEFT)) {
    println("pos of rect " + mouseX+ ", " + mouseY + " at " + angle+ " degrees");
  }



  //rect(mouseX, mouseY,)
}


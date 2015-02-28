
int scale = 40;
int near = -3*scale;
int far = 8*scale;

void setup() {
  size(800, 800, P3D);
}

void draw() {

  background(0);
  fill(0);
  //stroke(255);
  //lights();
  
  // KEYS TO PRESS TO ADD OR REMOVE DISTANCE FROM NEAR OR FAR CLIPPING PLANE //
  // A - NEAR + Z // O - FAR + P //
  ortho(0, width, 0, height, near, far);
  //println("near: "+near+"   far:  "+far);
  
  camera(0, 0, 100, 0, 0, 0, 0, 1, 0);

  // FREE ROTATION //
  /*float mmX = map(mouseX, 0, width, -2, 2);
  float mmY = map(mouseY, 0, height, -2, 2);
  rotateX(mmY);
  rotateY(mmX);
  println(mmX+" "+mmY);*/
  
  // CONTROLLED ORTHO ROTATION //
  //float mmMX = map(mouseX, 0, width, 0.785, 0);
  float mmMX = map(mouseX, 0, width, PI/4, 0);
  //float mmMY = map(mouseX, 0, width, -0.625, 0);
  float mmMY = map(mouseX, 0, width, -PI/5, 0);
  translate(8*scale, -4*scale, 0);
  rotateX(mmMY);
  rotateY(mmMX);
  //println(mmMX+" "+mmMY);
  
  
  // - - - BACKGROUND - - - //
  
  fill(200, 0, 0);
  //fill(255);
  //stroke(0, 0, 200); // UNCOMMENT TO REVEIL BACKGROUND
  //stroke(255);
  noStroke();  // COMMENT FOR BEST RESULTS !
  if (mousePressed == true) {
 stroke(255);
  }
  
  // - - - F BACKGROUND - - - //
  pushMatrix();
  
  translate(-4*scale - 1.5*scale, - 2*scale, 0);
  
  beginShape();
  
  // F BACKGROUND FILLER //
  beginShape();
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(1 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // F BACKGROUND TO E //
  beginShape();
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(4 * scale, 0 * scale, 0 * scale);
  vertex(4 * scale, 4 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // F TOP TRIANGLE BACKGROUND TO E //
  beginShape();
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(4 * scale, 0 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F BOTTOM TRIANGLE BACKGROUND TO E //
  beginShape();
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(4 * scale, 4 * scale, 1 * scale);
  vertex(4 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F LEFT BACKGROUND //
  beginShape();
  vertex(0 * scale, -2 * scale, 0 * scale);
  vertex(-2 * scale, -2 * scale, 0 * scale);
  vertex(-2 * scale, 6 * scale, 0 * scale);
  vertex(0 * scale, 6 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F LEFT BACKGROUND TO E BOTTOM BACKGROUND //
  beginShape();
  vertex(0 * scale, 4 * scale, 0 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 6 * scale, 1 * scale);
  vertex(0 * scale, 6 * scale, 0 * scale);
  endShape(CLOSE);
  
  endShape();
  
  popMatrix();
  
  
  // - - - E BACKGROUND - - - //
  pushMatrix();
  
  translate(- 1.5*scale, - 2*scale, 0);
  
  beginShape();
  
  // - - - E TOP BACKGROUND - - - //
  beginShape();
  vertex(-4 * scale, 0 * scale, 0 * scale);
  vertex(7 * scale, 0 * scale, 0 * scale);
  vertex(7 * scale, -2 * scale, 0 * scale);
  vertex(-4 * scale, -2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // - - - E BOTTOM BACKGROUND - - - //
  beginShape();
  vertex(-4 * scale, 4 * scale, 1 * scale);
  vertex(7 * scale, 4 * scale, 1 * scale);
  vertex(7 * scale, 6 * scale, 1 * scale);
  vertex(-4 * scale, 6 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E BACKGROUND TO Z //
  beginShape();
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(4 * scale, 0 * scale, 0 * scale);
  vertex(4 * scale, 4 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E TOP TRIANGLE BACKGROUND TO Z //
  beginShape();
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(4 * scale, 0 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E BOTTOM TRIANGLE BACKGROUND TO Z //
  beginShape();
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(4 * scale, 4 * scale, 1 * scale);
  vertex(4 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E TOP FILLER BACKGROUND //
  beginShape();
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E TRIANGLE FILLER BACKGROUND 1 //
  beginShape();
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E BOTTOM RIGHT FILLER BACKGROUND //
  beginShape();
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(2 * scale, 3 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E SHAPESHIFTING TRIANGLE FILLER BACKGROUND //
  /*beginShape();
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 3 * scale, 0 * scale);
  
  float var1 = map(mmMY, 0, -0.625, 3, 2);                // TESTING HERE ! //
  float var2 = map(mmMX, 0, 0.785, 3, 2);
  
  vertex(1 * scale, var1+var2 * scale, 1 * scale);
  endShape(CLOSE);*/
  
  endShape();
  
  popMatrix();
  
  
  // - - - Z BACKGROUND - - - //
  pushMatrix();
  
  translate(4*scale - 1.5*scale, - 2*scale, 0);
  
  beginShape();
  
  // Z RIGHT BACKGROUND //
  beginShape();
  vertex(3 * scale, -2 * scale, 1 * scale);
  vertex(5 * scale, -2 * scale, 1 * scale);
  vertex(5 * scale, 6 * scale, 1 * scale);
  vertex(3 * scale, 6 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z RIGHT BACKGROUND TO E TOP BACKGROUND //
  beginShape();
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, -2 * scale, 1 * scale);
  vertex(3 * scale, -2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z BOTTOM TRIANGLE FILLER BACKGROUND 1 //
  beginShape();
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z BOTTOM TRIANGLE FILLER BACKGROUND 2 //
  beginShape();
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z TOP TRIANGLE FILLER BACKGROUND 1 //
  beginShape();
  vertex(0 * scale, 1 * scale, 1 * scale);
  vertex(0 * scale, 1 * scale, 0 * scale);
  vertex(0 * scale, 2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z TOP FILLER BACKGROUND 1 //
  beginShape();
  vertex(0 * scale, 1 * scale, 1 * scale);
  vertex(1 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(0 * scale, 2 * scale, 0 * scale);
  endShape(CLOSE);
  
  endShape();
  
  popMatrix();
  
  
  // - - - F E Z - - - //
  
  //scale(6);
  //fill(100, 0, 0);
  noFill();
  stroke(255);
  
  //  - - - F - - - //
  pushMatrix();
  
  translate(-4*scale - 1.5*scale, - 2*scale, 0);
  
  // FEZ F //
  beginShape();
  
  // F FRONT //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(1 * scale, 2 * scale, 0 * scale);
  vertex(1 * scale, 4 * scale, 0 * scale);
  vertex(0 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F BACK //
  beginShape();
  vertex(0 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // F TOP //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(0 * scale, 0 * scale, 1 * scale);
  endShape(CLOSE);
  
  // F LEFT SIDE //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(0 * scale, 0 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F RIGHT SIDE TOP //
  beginShape();
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F RIGHT SIDE MIDDLE //
  beginShape();
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F RIGHT SIDE BOTTOM //
  beginShape();
  vertex(1 * scale, 2 * scale, 0 * scale);
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 4 * scale, 1 * scale);
  vertex(1 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // F BOTTOM SIDE LEFT //
  beginShape();
  vertex(0 * scale, 4 * scale, 0 * scale);
  vertex(1 * scale, 4 * scale, 0 * scale);
  vertex(1 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // F BOTTOM SIDE MIDDLE //
  beginShape();
  vertex(1 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 2 * scale, 1 * scale);
  endShape(CLOSE);
  
  // F BOTTOM SIDE RIGHT //
  beginShape();
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(3 * scale, 1 * scale, 0 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  endShape(CLOSE);
  
  endShape();
  
  popMatrix();


  // - - - E - - - //
  pushMatrix();
  
  translate(- 1.5*scale, - 2*scale, 0);

  // FEZ E //
  beginShape();
  
  // E FRONT //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(1 * scale, 2 * scale, 0 * scale);
  vertex(1 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 0 * scale);
  vertex(0 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E FRONT //
  beginShape();
  vertex(0 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E TOP //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(0 * scale, 0 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E TOP - BOTTOM LEG //
  beginShape();
  vertex(1 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(1 * scale, 3 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E LEFT SIDE //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(0 * scale, 0 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E BOTTOM //
  beginShape();
  vertex(0 * scale, 4 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E BOTTOM LEFT - TOP LEG //
  beginShape();
  vertex(1 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 2 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E BOTTOM RIGHT - TOP LEG //
  beginShape();
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(3 * scale, 1 * scale, 0 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  endShape(CLOSE);
  
  // E RIGHT SIDE TOP //
  beginShape();
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 1 * scale);
  vertex(3 * scale, 1 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E RIGHT SIDE MIDDLE 1 //
  beginShape();
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E RIGHT SIDE MIDDLE 2 //
  beginShape();
  vertex(1 * scale, 2 * scale, 0 * scale);
  vertex(1 * scale, 2 * scale, 1 * scale);
  vertex(1 * scale, 3 * scale, 1 * scale);
  vertex(1 * scale, 3 * scale, 0 * scale);
  endShape(CLOSE);
  
  // E RIGHT SIDE BOTTOM //
  beginShape();
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  endShape();
  
  popMatrix();


  // - - - Z - - - //
  pushMatrix();

  translate(4*scale - 1.5*scale, - 2*scale, 0);

  // FEZ Z //
  beginShape();
  
  // Z FRONT TOP //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(0 * scale, 1 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z FRONT BOTTOM //
  beginShape();
  vertex(0 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 0 * scale);
  vertex(0 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z BACK TOP //
  beginShape();
  vertex(0 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(0 * scale, 1 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z BACK BOTTOM //
  beginShape();
  vertex(0 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z TOP //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(0 * scale, 0 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z TOP LEFT - BOTTOM LEG //
  beginShape();
  vertex(0 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(0 * scale, 2 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z TOP RIGHT - BOTTOM LEG //
  beginShape();
  vertex(2 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(2 * scale, 3 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z LEFT TOP //
  beginShape();
  vertex(0 * scale, 0 * scale, 0 * scale);
  vertex(0 * scale, 0 * scale, 1 * scale);
  vertex(0 * scale, 1 * scale, 1 * scale);
  vertex(0 * scale, 1 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z LEFT MIDDLE //
  beginShape();
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z LEFT SIDE BOTTOM //
  beginShape();
  vertex(0 * scale, 2 * scale, 0 * scale);
  vertex(0 * scale, 2 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z BOTTOM //
  beginShape();
  vertex(0 * scale, 4 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 0 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(0 * scale, 4 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z BOTTOM LEFT - TOP LEG //
  beginShape();
  vertex(0 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 0 * scale);
  vertex(2 * scale, 1 * scale, 1 * scale);
  vertex(0 * scale, 1 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z BOTTOM RIGHT - TOP LEG //
  beginShape();
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(3 * scale, 2 * scale, 0 * scale);
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  endShape(CLOSE);
  
  // Z RIGHT SIDE TOP //
  beginShape();
  vertex(3 * scale, 0 * scale, 0 * scale);
  vertex(3 * scale, 0 * scale, 1 * scale);
  vertex(3 * scale, 2 * scale, 1 * scale);
  vertex(3 * scale, 2 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z RIGHT SIDE MIDDLE //
  beginShape();
  vertex(2 * scale, 2 * scale, 0 * scale);
  vertex(2 * scale, 2 * scale, 1 * scale);
  vertex(2 * scale, 3 * scale, 1 * scale);
  vertex(2 * scale, 3 * scale, 0 * scale);
  endShape(CLOSE);
  
  // Z RIGHT SIDE BOTTOM //
  beginShape();
  vertex(3 * scale, 3 * scale, 0 * scale);
  vertex(3 * scale, 3 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 1 * scale);
  vertex(3 * scale, 4 * scale, 0 * scale);
  endShape(CLOSE);
  
  endShape();
  
  popMatrix();
}



void keyPressed(){
  
if (key == 'z') {
  near += 1;
}

if (key == 'a') {
  near -= 1;
  }

if (key == 'p') {
  far += 1;
}

if (key == 'o') {
  far -= 1;
  }
}


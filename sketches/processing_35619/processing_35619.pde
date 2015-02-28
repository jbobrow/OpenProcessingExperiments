
void setup() {
  setupAudio();
  size(500, 500);
}

void draw() {
  background(#D1C6CC); 

  //BACKGROUND PATTERN
  noStroke();
  fill(#D8BECD);
  rect (0, 0, 500, 10);
  rect (0, 80, 500, 15);
  rect (0, 160, 500, 20);
  rect (0, 240, 500, 10);
  rect (0, 320, 500, 15);
  rect (0, 400, 500, 20);
  rect (0, 480, 500, 10);

  //FACE
  fill (#3E6C93);
  noStroke();
  ellipse (250, 250, 350, 250);
  //main face shape


  //EYEBROWS
  //noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(135, 170);
  curveVertex(135, 170); 
  curveVertex(155, 180); 
  curveVertex(175, 170);
  curveVertex(195, 180);
  curveVertex(215, 170);
  curveVertex(235, 180); 
  curveVertex(255, 170); 
  curveVertex(275, 180);
  curveVertex(295, 170);
  curveVertex(315, 180);
  curveVertex(335, 170);
  curveVertex(355, 180);
  curveVertex(375, 170);
  curveVertex(375, 170);
  endShape();

  noStroke ();
  fill(#3E6C93);
  smooth();
  ellipse (250, 390, 40, 80);
  ellipse (250, 600, 450, 400);


  // Draw the mouth.
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0, 100, 2, 120);  // now we can use it for something!

  //CHIN
  noStroke();
  fill (#3E6C93);
  arc (250, 250, 350, 250+(Y/7), 0, PI);

  //MOUTH
  fill(0, 0, 0);
  arc (250, 310, 250, Y, 0, PI); 

  //NEW NOSE
  noFill();
  stroke(0);
  strokeWeight (2);
  arc(250, 260, 30, 40, 0, PI);


  //EAR MOVEMENT
  //EARS
  noStroke();
  fill(#3E6C93); 
  ellipse (70, 240+(Y/35), 60, 60);
  ellipse (430, 240+(Y/35), 60, 60);


  // The rest of the code just draws the Eye:

  noStroke();

  //LEFT EYE
  float ex = 155;
  float ey = 209;
  fill(255);
  ellipse(ex, ey, 35, 45);
  // fill(0);
  // float dx = constrain((mouseX-ex)/25, -14, 14);
  //float dy = constrain((mouseY-ey)/25, -14, 14);
  //ellipse(ex+dx, ey+dy, 10, 10);

  //LEFT EYE COLOR
  float exxxx = 157;
  float eyyyy = 212;
  fill(255);
  ellipse(exxxx, eyyyy, 35, 45);
  fill(#E0D60E);
  float dxxxx = constrain((mouseX-exxxx)/30, -14, 14);
  float dyyyy = constrain((mouseY-eyyyy)/30, -14, 14);
  ellipse(exxxx+dxxxx, eyyyy+dyyyy, 20, 25);

  fill(0);
  float dx = constrain((mouseX-ex)/25, -14, 14);
  float dy = constrain((mouseY-ey)/25, -14, 14);
  ellipse(ex+dx, ey+dy, 10, 10);


  //MIDDLE EYE
  float exx = 247;
  float eyy = 212;
  fill(255);
  ellipse(exx, eyy, 70, 45);
  //fill(0);
  //float dxx = constrain((mouseX-exx)/25, -14, 14);
  //float dyy = constrain((mouseY-eyy)/25, -14, 14);
  //ellipse(exx+dxx, eyy+dyy, 10, 10);

  //MIDDLE EYE COLOR
  float exxxxx = 247;
  float eyyyyy = 212;
  fill(255);
  ellipse(exxxxx, eyyyyy, 70, 45);
  fill(#E0D60E);
  float dxxxxx = constrain((mouseX-exxxxx)/30, -14, 14);
  float dyyyyy = constrain((mouseY-eyyyyy)/30, -14, 14);
  ellipse(exxxxx+dxxxxx, eyyyyy+dyyyyy, 33, 27);

  fill(0);
  float dxx = constrain((mouseX-exx)/25, -14, 14);
  float dyy = constrain((mouseY-eyy)/25, -14, 14);
  ellipse(exx+dxx, eyy+dyy, 10, 10);


  //RGIHT EYE
  float exxx = 338;
  float eyyy = 209;
  fill(255);
  ellipse(exxx, eyyy, 32, 50);
  // fill(0);
  // float dxxx = constrain((mouseX-exxx)/25, -14, 14);
  //float dyyy = constrain((mouseY-eyyy)/25, -14, 14);
  //ellipse(exxx+dxxx, eyyy+dyyy, 10, 10);

  //RIGHT EYE COLOR
  float exxxxxx = 338;
  float eyyyyyy = 209;
  fill(255);
  ellipse(exxxxxx, eyyyyyy, 32, 50);
  fill(#E0D60E);
  float dxxxxxx = constrain((mouseX-exxxxxx)/30, -14, 14);
  float dyyyyyy = constrain((mouseY-eyyyyyy)/30, -14, 14);
  ellipse(exxxxxx+dxxxxxx, eyyyyyy+dyyyyyy, 22, 28);


  fill(0);
  float dxxx = constrain((mouseX-exxx)/25, -14, 14);
  float dyyy = constrain((mouseY-eyyy)/25, -14, 14);
  ellipse(exxx+dxxx, eyyy+dyyy, 10, 10);

  //TEETH
  fill(255, 255, 255);
  //upper teeth

  triangle (330, 327, 315, 310, 345, 310);
  //rght3
  triangle (300, 327, 285, 310, 315, 310);
  //rght2
  triangle (266, 327, 250, 310, 285, 310);
  //rhgt1
  triangle (232, 327, 215, 310, 250, 310);
  //mid.
  triangle (200, 327, 185, 310, 215, 310);
  //left1
  triangle (170, 327, 155, 310, 185, 310);
  //left2
}



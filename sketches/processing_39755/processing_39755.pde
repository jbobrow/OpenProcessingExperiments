
import netscape.javascript.*;


 float rdm=random(1,1.3);
 float girlposition=random(0,105);
void setup() {
  size(335,390);
  background(145);
}

void draw() {
  float pupilsx= constrain(mouseX, 175.6, 191.5);
  float pupilsy= constrain(mouseY, 157, 174.3);
  drawGirl(1,1,1,1);
  drawPupils(pupilsx,pupilsy,1,1,0,0);
  if (mouseX>85&&mouseX<212&&mouseY>98&&mouseY<231) {
    drawEyesclosed(1,1,1,1);
  }
}
void drawGirl(float x, float y, float objectWidth, float objectHeight) {
  smooth();
  stroke(0);
  rect(48.5*objectWidth+x,59*objectHeight+y,217*objectWidth,251*objectHeight);
  fill(55, 99, 155);
  rect(80*objectWidth+x, 109*objectHeight+y, 149*objectWidth, 172*objectHeight);

  //Neck
  strokeWeight(2.7*objectWidth);
  fill(255, 247, 215);
  beginShape();
  curveVertex(135*objectWidth+x, 175*objectHeight+y);
  curveVertex(135*objectWidth+x, 175*objectHeight+y);
  curveVertex(150*objectWidth+x, 275*objectHeight+y);
  curveVertex(185*objectWidth+x, 275*objectHeight+y);
  curveVertex(185*objectWidth+x, 200*objectHeight+y);
  curveVertex(135*objectWidth+x, 175*objectHeight+y);
  endShape();

  //Head
  beginShape();
  curveVertex(100*objectWidth+x, 15*objectHeight+y);
  curveVertex(90*objectWidth+x, 100*objectHeight+y);
  curveVertex(95*objectWidth+x, 220*objectHeight+y);
  curveVertex(155*objectWidth+x, 235*objectHeight+y);
  curveVertex(225*objectWidth+x, 200*objectHeight+y);
  curveVertex(225*objectWidth+x, 110*objectHeight+y);
  curveVertex(78*objectWidth+x, 10*objectHeight+y);
  endShape(CLOSE);

  strokeWeight(1.2*objectWidth);
  line(130*objectWidth+x, 195*objectHeight+y, 139*objectWidth+x, 195*objectHeight+y);

  //Shirt
  fill(190);
  strokeWeight(2.7*objectWidth);
  beginShape();
  curveVertex(189*objectWidth+x, 254*objectHeight+y);
  curveVertex(189*objectWidth+x, 254*objectHeight+y);
  curveVertex(170*objectWidth+x, 260*objectHeight+y);
  curveVertex(144*objectWidth+x, 260*objectHeight+y);
  curveVertex(100*objectWidth+x, 275*objectHeight+y);
  curveVertex(86*objectWidth+x, 300*objectHeight+y);
  curveVertex(86*objectWidth+x, 310*objectHeight+y);
  curveVertex(86*objectWidth+x, 310*objectHeight+y);
  curveVertex(86*objectWidth+x, 310*objectHeight+y);
  curveVertex(250*objectWidth+x, 310*objectHeight+y);
  curveVertex(200*objectWidth+x, 310*objectHeight+y);
  curveVertex(263*objectWidth+x, 310*objectHeight+y);
  curveVertex(263*objectWidth+x, 310*objectHeight+y);
  curveVertex(257*objectWidth+x, 276*objectHeight+y);
  curveVertex(189*objectWidth+x, 254*objectHeight+y);
  curveVertex(189*objectWidth+x, 254*objectHeight+y);
  endShape();

  //Shirt Continued
  fill(252);
  stroke(252);
  bezier(260*objectWidth+x, 286*objectHeight+y, 259*objectWidth+x, 313*objectHeight+y, 264*objectWidth+x, 303*objectHeight+y, 232*objectWidth+x, 307*objectHeight+y);
  bezier(89*objectWidth+x, 295*objectHeight+y, 85*objectWidth+x, 310*objectHeight+y, 98*objectWidth+x, 308*objectHeight+y, 107*objectWidth+x, 306*objectHeight+y);
  noFill();
  strokeWeight(7.5*objectWidth);
  bezier(144*objectWidth+x, 263*objectHeight+y, 157*objectWidth+x, 266*objectHeight+y, 181*objectWidth+x, 265*objectHeight+y, 190*objectWidth+x, 258*objectHeight+y);
  line(130*objectWidth+x, 305*objectHeight+y, 130*objectWidth+x, 291*objectHeight+y);
  line(159*objectWidth+x, 305*objectHeight+y, 159*objectWidth+x, 291*objectHeight+y);
  line(159*objectWidth+x, 291*objectHeight+y, 189*objectWidth+x, 291*objectHeight+y);
  line(189*objectWidth+x, 291*objectHeight+y, 189*objectWidth+x, 305*objectHeight+y);
  stroke(0);
  strokeWeight(1.2*objectWidth);
  bezier(111*objectWidth+x, 308*objectHeight+y, 110*objectWidth+x, 306*objectHeight+y, 115*objectWidth+x, 298*objectHeight+y, 114*objectWidth+x, 296*objectHeight+y);

  //Eyebrows
  stroke(0);
  strokeWeight(1.8*objectWidth);
  bezier(160*objectWidth+x, 141*objectHeight+y, 170*objectWidth+x, 135*objectHeight+y, 186*objectWidth+x, 134*objectHeight+y, 205*objectWidth+x, 136*objectHeight+y);
  bezier(126*objectWidth+x, 141*objectHeight+y, 116*objectWidth+x, 135*objectHeight+y, 100*objectWidth+x, 134*objectHeight+y, 81*objectWidth+x, 136*objectHeight+y);

  //Eyelashes
  strokeWeight(1.7*objectWidth);
  line(183*objectWidth+x, 165*objectHeight+y, 201*objectWidth+x, 145*objectHeight+y);
  line(183*objectWidth+x, 165*objectHeight+y, 206*objectWidth+x, 152*objectHeight+y);
  line(183*objectWidth+x, 165*objectHeight+y, 209*objectWidth+x,159*objectHeight+y);

  line(108*objectWidth+x, 165*objectHeight+y, 92*objectWidth+x, 142*objectHeight+y);

  //Eyes
  fill(255);
  strokeWeight(2.7*objectHeight);
  ellipse(108*objectWidth+x, 165*objectHeight+y, 42*objectWidth, 48*objectHeight);
  ellipse(183*objectWidth+x, 165*objectHeight+y, 42*objectWidth, 48*objectHeight);
  noFill();
  strokeWeight(3.4*objectHeight);
  bezier(166*objectWidth+x,151.8*objectHeight+y, 178*objectWidth+x, 137.5*objectHeight+y, 198*objectWidth+x, 144*objectHeight+y,201*objectWidth+x,152.5*objectHeight+y);
  bezier(125.8*objectWidth+x,151.8*objectHeight+y,110*objectWidth+x,137.5*objectHeight+y,100*objectWidth+x,144*objectHeight+y,90.5*objectWidth+x,152.5*objectHeight+y);

  //Shading
  fill(224,181,129,80);
  noStroke();
  bezier(132*objectWidth+x, 196*objectHeight+y, 132*objectWidth+x, 202*objectHeight+y, 138*objectWidth+x, 202*objectHeight+y, 141*objectWidth+x, 197*objectHeight+y);
  stroke(0);
  
  //Mouth
  strokeWeight(1.2*objectWidth);
  bezier(132*objectWidth+x, 215*objectHeight+y, 137*objectWidth+x, 212*objectHeight+y, 142*objectWidth+x, 214*objectHeight+y, 149*objectWidth+x, 216*objectHeight+y);
  
  strokeWeight(2.7*objectWidth);
  
  //Hair
  fill(34, 138, 240);
  beginShape();
  curveVertex(170*objectWidth+x, 103*objectHeight+y);
  curveVertex(170*objectWidth+x, 103*objectHeight+y);
  curveVertex(130*objectWidth+x, 128*objectHeight+y);
  curveVertex(98*objectWidth+x, 132*objectHeight+y);
  curveVertex(89.9*objectWidth+x, 132*objectHeight+y);
  curveVertex(85*objectWidth+x, 149*objectHeight+y);
  curveVertex(86*objectWidth+x, 190*objectHeight+y);
  curveVertex(91*objectWidth+x, 260*objectHeight+y);
  curveVertex(93*objectWidth+x, 270*objectHeight+y);
  curveVertex(93*objectWidth+x, 270*objectHeight+y);
  curveVertex(104*objectWidth+x, 300*objectHeight+y);
  curveVertex(104*objectWidth+x, 300*objectHeight+y);
  curveVertex(80*objectWidth+x, 283*objectHeight+y);
  curveVertex(55*objectWidth+x, 200*objectHeight+y);
  curveVertex(70*objectWidth+x, 110*objectHeight+y);
  curveVertex(120*objectWidth+x, 70*objectHeight+y);
  curveVertex(165*objectWidth+x, 70*objectHeight+y);
  curveVertex(190*objectWidth+x, 85*objectHeight+y);
  curveVertex(215*objectWidth+x, 95*objectHeight+y);
  curveVertex(236*objectWidth+x, 120*objectHeight+y);
  curveVertex(250*objectWidth+x, 180*objectHeight+y);
  curveVertex(230*objectWidth+x, 265*objectHeight+y);
  curveVertex(200*objectWidth+x, 290*objectHeight+y);
  curveVertex(200*objectWidth+x, 290*objectHeight+y);
  curveVertex(210*objectWidth+x, 220*objectHeight+y);
  curveVertex(206*objectWidth+x, 139*objectHeight+y);
  curveVertex(130*objectWidth+x, 15*objectHeight+y);
  endShape(CLOSE);

  //Blush
  noStroke();
  fill(255, 148, 120, 55);
  ellipse(107*objectWidth+x, 200*objectHeight+y, 30*objectWidth, 13*objectHeight);
  ellipse(184*objectWidth+x, 200*objectHeight+y, 30*objectWidth, 13*objectHeight);
  fill(255,200);
  ellipse(102*objectWidth+x,196*objectHeight+y,6*objectWidth,4*objectHeight);
  ellipse(178*objectWidth+x,195*objectHeight+y,6*objectWidth,4*objectHeight);
}

void drawPupils(float x,float y,float objectWidth,float objectHeight,float x2,float y2) {
  stroke(0);
  fill(43); 
  strokeWeight(2.7*objectWidth);
  ellipse(x*objectWidth+x2, y*objectHeight+y2, 23*objectWidth, 23*objectHeight);
  ellipse((x-74.8)*objectWidth+x2, y*objectHeight+y2, 23*objectWidth, 23*objectHeight);
}

void drawEyesclosed(float x, float y, float objectWidth, float objectHeight) {
  stroke(255, 247, 215);
  strokeWeight(4.5*objectWidth);
  fill(255, 247, 215);
  ellipse(110*objectWidth+x, 165.5*objectHeight+y, 44.5*objectWidth, 53*objectHeight);
  ellipse(183*objectWidth+x, 165*objectHeight+y, 45.5*objectWidth, 49.5*objectHeight);

  strokeWeight(4*objectWidth);
  stroke(0);
  line(96*objectWidth+x, 160*objectHeight+y, 127*objectWidth+x, 172*objectHeight+y);
  line(127*objectWidth+x, 172*objectHeight+y, 96.7*objectWidth+x, 182.7*objectHeight+y);

  line(163*objectWidth+x, 172*objectHeight+y, 196*objectWidth+x, 160*objectHeight+y);
  line(163*objectWidth+x, 172*objectHeight+y, 196*objectWidth+x, 180*objectHeight+y);

  strokeWeight(4*objectWidth);
  line(87.5*objectWidth+x, 151*objectHeight+y, 88*objectWidth+x, 184*objectHeight+y);

  stroke(255, 247, 215);
  strokeWeight(4.5);
  bezier(196.5*objectWidth+x, 142*objectHeight+y, 202.5*objectWidth+x, 148*objectHeight+y, 204.5*objectWidth+x, 149*objectHeight+y, 208.5*objectWidth+x, 159*objectHeight+y);
  rect(93*objectWidth+x, 140*objectHeight+y, 2*objectWidth, 3*objectHeight);
  fill(210,0,0);
}



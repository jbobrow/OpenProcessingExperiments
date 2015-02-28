
void setup () {
  size (700, 500);
  background (255);
  smooth ();
}
 
 
void draw () {
  
  float ra = map(mouseX,0,width,1,3*random(1.5));
  //ra = constrain(ra,1,4);
  //println(ra);

    /*if (mousePressed) {
      ra = random(5);
    }
    */
  fill (255);
  rect (0,0,700,500);
    strokeWeight (5);
  stroke (252, 159, 71);
noFill ();
  //body and head line
  beginShape ();
  curveVertex (150*ra, 330);
  curveVertex (150*ra, 330);
  curveVertex (130, 210*ra);
  curveVertex (150*ra, 150);
  curveVertex (200, 70*ra);
  curveVertex (300*ra, 55);
  curveVertex (380, 85*ra);
  //shoulder
  curveVertex (480/ra, 180);
  curveVertex (490, 200/ra);
  curveVertex (510/ra, 230);
  curveVertex (550, 235/ra);
  curveVertex (580/ra, 250);
  curveVertex (600, 270/ra);
  curveVertex (620/ra, 330);
  curveVertex (610, 350/ra);
  curveVertex (600/ra, 370);
  //lower jaw
  curveVertex (550, 410*ra);
  curveVertex (500/ra, 390);
  //cheek
  curveVertex (470/ra, 360);
  curveVertex (480/ra, 330);
  curveVertex (480/ra, 330);
  endShape ();
 
  //front foot
  strokeWeight (8);
  beginShape ();
  curveVertex (490*ra, 387);
  curveVertex (490, 387/ra);
  curveVertex (480, 400*ra);
  curveVertex (450/ra, 405);
  curveVertex (430/ra, 400);
 
  curveVertex (390*ra, 350);
  curveVertex (350/ra, 330);
  curveVertex (290, 290*ra);
  curveVertex (250, 200/ra);
  curveVertex (250*ra, 200);
  endShape ();
 
  //back foot
  strokeWeight (12);
  beginShape ();
  curveVertex (150/ra, 330);
  curveVertex (150, 330*ra);
  curveVertex (350/ra, 370);
  curveVertex (400, 365*ra);
  curveVertex (400/ra, 365);
  endShape ();
 
  //right ear
  strokeWeight (5);
  fill (0);
  stroke (0);
  strokeWeight (5);
  beginShape ();
  curveVertex (580, 260);
  curveVertex (580, 260);
  curveVertex (600, 250);
  curveVertex (640, 250);
  curveVertex (642, 248);
  curveVertex (607, 300);
  curveVertex (607, 300);
  endShape ();
 
  //left ear
  beginShape ();
  curveVertex (500, 320);
  curveVertex (530, 280);
  curveVertex (475, 255);
  curveVertex (485, 310);
  curveVertex (535, 300);
  endShape ();
 
  //left eye
  noFill ();
  stroke (60*ra, 123/ra, 229/ra);
  beginShape ();
  curveVertex (535, 370);
  curveVertex (535, 350);
  curveVertex (512, 338);
  curveVertex (500, 340);
  curveVertex (500, 340);
  endShape ();
  beginShape ();
  curveVertex(530, 350);
  curveVertex(530, 350);
  curveVertex(515, 357);
  curveVertex(500, 340);
  curveVertex(500, 340);
  endShape ();
  stroke (0);
  line (512, 342, 515, 348);
 
  // right eye
  stroke (60*ra, 123/(ra), 229/(ra));
  beginShape ();
  curveVertex (575, 350);
  curveVertex (575, 350);
  curveVertex (592, 338);
  curveVertex (600, 340);
  curveVertex (600, 340);
  endShape ();
  beginShape ();
  curveVertex (580, 350);
  curveVertex (580, 350);
  curveVertex (590, 355);
  curveVertex (600, 340);
  curveVertex (600, 300);
  endShape ();
  stroke (0);
  line (588, 345, 585, 350);
 
  //nose
  strokeWeight (2);
  fill (0);
  triangle (542, 392, 558, 393, 547, 400);
  noFill ();
 
 
 
  //tail
  stroke(0);
  strokeWeight (40);
  beginShape ();
  if (mousePressed) {
    curveVertex (130,280);
    curveVertex (130,280);
    curveVertex (mouseX,mouseY);
    curveVertex (mouseX,mouseY);
    endShape ();}
  else {
  curveVertex (300, 280);
  curveVertex (130, 280);
  curveVertex (100, 400);
  curveVertex (250, 450);
  curveVertex (250, 300);}
   
  endShape ();
  noStroke();
}

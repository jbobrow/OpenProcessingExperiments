
/*
Konkuk University
SOS iDesign

Name: Song YoungJun
ID: 201420083

*/

void setup(){
size (600, 600);
smooth();
}

float c = random(255);

void draw(){

//Head - Brown
stroke (0);
strokeWeight (1);
fill (197, 120, 64);
beginShape ();
vertex (210, 410);
vertex (140, 240);
vertex (180, 80);
vertex (300, 50);
vertex (420, 80);
vertex (460, 240);
vertex (390, 410);
vertex (325, 250);
vertex (325, 100); //Right
vertex (275, 100); //Left
vertex (275, 250);
endShape (CLOSE);

//Ears
beginShape ();
vertex (180, 80);
vertex (110, 70);
vertex (10, 205);
vertex (65, 470);
vertex (115, 490);
vertex (175, 470);
vertex (185, 350);
vertex (140, 240);
endShape (); //Left Ears

beginShape ();
vertex (420, 80);
vertex (490, 70);
vertex (590, 205);
vertex (535, 470);
vertex (485, 490);
vertex (425, 470);
vertex (415, 350);
vertex (460, 240);
endShape (); //Right Ears

//Head - White
fill (255);
beginShape ();
vertex (220, 480);
vertex (210, 440);
vertex (210, 410);
vertex (275, 250);
vertex (275, 100);
vertex (325, 100);
vertex (325, 250);
vertex (390, 410);
vertex (390, 440);
vertex (380, 480);
vertex (330, 510);
vertex (270, 510);
endShape (CLOSE);

//Mouth
noStroke();
fill (204, 146, 132);
triangle (300, 420, 250, 480, 350, 480);
quad (250, 480, 270, 490, 330, 490, 350, 480);

//Eyes
fill (255);
rectMode(CENTER);
rect (210, 220, 70, 60); //left
rect (390, 220, 70, 60); //Right

float mx1 = constrain (mouseX, 185, 235);
float mx2 = constrain (mouseX, 365, 415);
float my = constrain (mouseY, 200, 240);

fill (0);
rect (mx1, my, 20, 20); //left - Iris
rect (mx2, my, 20, 20); //Right - Iris

//Nose
fill (105, 77, 74);
rectMode (CORNERS);
rect (250, 380, 350, 440);
quad (250, 440, 270, 460, 330, 460, 350, 440);

//Whiskers
stroke(120);
strokeWeight (3);
line (240, 400, 200, 450);
line (240, 430, 200, 480);
line (240, 460, 200, 510);
line (360, 400, 400, 450);
line (360, 430, 400, 480);
line (360, 460, 400 ,510);

//bonus

  if(mousePressed){
  noFill();
  stroke (random(255), random(255), random(255));
  ellipse (210, 220, 100, 100); //left
  ellipse (390, 220, 100, 100); //Right
  line (260, 220, 275, 250);
  line (340, 220, 325, 250);
  line (260, 220, 340, 220);
  line (160, 220, 60, 140);
  line (440, 220, 540, 140);
  
  rectMode (CENTER);
  fill(random(255), random(255), random(255));
  rect (275, 250, 20, 30);
  rect (325, 250, 20, 30);
  
  noStroke();
  fill (random(255));
  rectMode (CORNERS);
  rect (250, 380, 350, 440);
  quad (250, 440, 270, 460, 330, 460, 350, 440); //nose - colorchange
  
  //Dog bone
  float r1 = random(255);
  
  stroke (r1);
   rectMode (CENTER);
  fill (c, mouseY ,c);
  ellipse (mouseX+30, mouseY+15, 30, 30);
  ellipse (mouseX+30, mouseY-15, 30, 30);
  ellipse (mouseX-30, mouseY+15, 30, 30);
  ellipse (mouseX-30, mouseY-15, 30, 30);
  
  noStroke();
  rect (mouseX, mouseY, 60, 30);
  
  stroke(r1);
  line(mouseX-15, mouseY-15, mouseX+15, mouseY-15);
  line(mouseX-15, mouseY+15, mouseX+15, mouseY+15);
  
  ellipse (mouseX+30, height-mouseY+15, 30, 30);
  ellipse (mouseX+30, height-mouseY-15, 30, 30);
  ellipse (mouseX-30, height-mouseY+15, 30, 30);
  ellipse (mouseX-30, height-mouseY-15, 30, 30);
  
  noStroke();
  rect (mouseX, height-mouseY, 60, 30);
  
  stroke(r1);
  line(mouseX-15, height-mouseY-15, mouseX+15, height-mouseY-15);
  line(mouseX-15, height-mouseY+15, mouseX+15, height-mouseY+15);
  
  ellipse (width-mouseX+30, mouseY+15, 30, 30);
  ellipse (width-mouseX+30, mouseY-15, 30, 30);
  ellipse (width-mouseX-30, mouseY+15, 30, 30);
  ellipse (width-mouseX-30, mouseY-15, 30, 30);
  
  noStroke();
  rect (width-mouseX, mouseY, 60, 30);
  
  stroke(r1);
  line(width-mouseX-15, mouseY-15, width-mouseX+15, mouseY-15);
  line(width-mouseX-15, mouseY+15, width-mouseX+15, mouseY+15);
  
  ellipse (width-mouseX+30, height-mouseY+15, 30, 30);
  ellipse (width-mouseX+30, height-mouseY-15, 30, 30);
  ellipse (width-mouseX-30, height-mouseY+15, 30, 30);
  ellipse (width-mouseX-30, height-mouseY-15, 30, 30);
  
  noStroke();
  rect (width-mouseX, height-mouseY, 60, 30);
  
  stroke(r1);
  line(width-mouseX-15, height-mouseY-15, width-mouseX+15, height-mouseY-15);
  line(width-mouseX-15, height-mouseY+15, width-mouseX+15, height-mouseY+15);
  
  if (keyPressed){
    setup();
    c = random(255);
   }

 }

}


void keyPressed(){
  background(random(255));

}




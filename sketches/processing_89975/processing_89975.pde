


void setup() {
  size (displayWidth, displayHeight);
  textFont (createFont("CenturyGothic", 30));
  
}

void draw() {
  background (250, 250, 250);
frameRate(3); 

  float r = random(150, 250); // Red value
  float r2 = random(40, 50); // Green value
  float r3 = random(50, 112); // Blue value 
  // adding the comma allows me to put in a range.
  float r4 = random (100, 180);
  float r5 = random(40,80);
  float r6 = random(60, 225);  

  color dkPink = color(182, 31, 99); //After messing about with int / floats I
  // found the right thing to search for was 'create a fill value' which lead
  // me to this piece of code.
  color purple = color(158, 31, 50);
  color dkRed = color (169, 41, 50);
  color napierRed = color (189, 41, 50);
  color pink = color (192, 31, 99);
  color grPink = color(158, 68, 99);
  color grPurp = color(146, 68, 99);
  color brPurp = color(158, 31, 126);

 
if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke(dkPink);
  fill (dkPink);}
  noStroke();
  rect(30, 100, 32, 50); // 1a  H Left Column 
  bezier (30, 100, 40, 90, 52, 90, 62, 100);
  bezier (30, 150, 40, 160, 52, 160, 62, 150); 
 
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(purple);
  fill(purple);}
  noStroke();
  rect(30, 168, 32, 50); // 2a
  bezier (30, 168, 40, 158, 52, 158, 62, 168);
  bezier (30, 218, 40, 228, 52, 228, 62, 218);  

if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(30, 236, 32, 50); // 3a
  bezier (30, 236, 40, 226, 52, 226, 62, 236);
  bezier(30, 286, 40, 296, 52, 296, 62, 286); 
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke(purple);
  fill(purple); }
  noStroke();
  rect(30, 304, 32, 50); // 4a
  bezier (30, 304, 40, 294, 52, 294, 62, 304);
  bezier (30, 354, 40, 364, 52, 364, 62, 354);  
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(pink);
  fill(pink);}  
  noStroke();
  rect(30, 372, 32, 50); // 5a
  bezier (30, 372, 40, 362, 52, 362, 62, 372);
  bezier (30, 422, 40, 432, 52, 432, 62, 422);   
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();
  rect(65, 100, 32, 50); // 1b H 2nd Column
  bezier (65, 100, 75, 90, 85, 90, 97, 100);
  bezier (65, 150, 75, 160, 85, 160, 97, 150); 
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke(dkPink);
  fill (dkPink);}
  noStroke();
  rect(65, 168, 32, 50); // 2b
  bezier (65, 168, 75, 158, 85, 158, 97, 168);
  bezier (65, 218, 75, 228, 85, 228, 97, 218);
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r5, r3);
  fill (r4, r5, r3);
} else{
  stroke (purple);
  fill(purple);  }
  noStroke();
  rect(65, 236, 32, 50); // 3b
  bezier (65, 236, 75, 226, 85, 226, 97, 236);
  bezier(65, 286, 75, 296, 85, 296, 97, 286);  
  
 
 if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r3, r6);
  fill (r4, r3, r6);
} else{ 
  stroke(grPurp);
  fill(grPurp);  }
  noStroke();
  rect(65, 304, 32, 50); // 4a
  bezier (65, 304, 75, 294, 85, 294, 97, 304);
  bezier (65, 354, 75, 364, 85, 364, 97, 354);  
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke (napierRed);
  fill(napierRed);}
  noStroke();
  rect(65, 372, 32, 50); // 5a
  bezier (65, 372, 75, 362, 85, 362, 97, 372);
  bezier (65, 422, 75, 432, 85, 432, 97, 422); 

  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke(pink);
  fill(pink);
  noStroke();}
  rect(100, 236, 32, 50); // 3c H MIDDLE 1
  bezier (100, 236, 110, 226, 122, 226, 132, 236);
  bezier (100, 286, 110, 296, 122, 296, 132, 286);

   if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(brPurp);
  fill (brPurp);}
  noStroke();
  rect(135, 236, 32, 50); // 3d H MIDDLE 2
  bezier (135, 236, 145, 226, 157, 226, 167, 236);
  bezier (135, 286, 145, 296, 157, 296, 167, 286);  

if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(170, 100, 32, 50); // 1e  H 1st Right Column 
  bezier (170, 100, 180, 90, 192, 90, 202, 100);
  bezier (170, 150, 180, 160, 192, 160, 202, 150); 
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(170, 168, 32, 50); // 2e
  bezier (170, 168, 180, 158, 192, 158, 202, 168);
  bezier (170, 218, 180, 228, 192, 228, 202, 218); 
  
   if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke(purple);
  fill(purple); }
  noStroke();
  rect(170, 236, 32, 50); // 3e
  bezier (170, 236, 180, 226, 192, 226, 202, 236);
  bezier (170, 286, 180, 296, 192, 296, 202, 286);  
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(170, 304, 32, 50); // 4e
  bezier (170, 304, 180, 294, 192, 294, 202, 304);
  bezier (170, 354, 180, 364, 192, 364, 202, 354);  
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r5, r3);
  fill (r4, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(170, 372, 32, 50); // 5e
  bezier (170, 372, 180, 362, 192, 362, 202, 372);
  bezier (170, 422, 180, 432, 192, 432, 202, 422);  

  rect(205, 100, 32, 50); // 1f  H 2nd Right Column 
  bezier (205, 100, 215, 90, 227, 90, 237, 100);
  bezier (205, 150, 215, 160, 227, 160, 237, 150); 
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  
   if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke(grPurp);
  fill(grPurp); }
  noStroke();
  rect(205, 168, 32, 50); // 2f
  bezier (205, 168, 215, 158, 227, 158, 237, 168);
  bezier (205, 218, 215, 228, 227, 228, 237, 218); 
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  rect(205, 236, 32, 50); // 3f
  bezier (205, 236, 215, 226, 227, 226, 237, 236);
  bezier (205, 286, 215, 296, 227, 296, 237, 286);  

if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();  
  rect(205, 304, 32, 50); // 4f
  bezier (205, 304, 215, 294, 227, 294, 237, 304);
  bezier (205, 354, 215, 364, 227, 364, 237, 354);  
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(205, 372, 32, 50); // 5f
  bezier (205, 372, 215, 362, 227, 362, 237, 372);
  bezier (205, 422, 215, 432, 227, 432, 237, 422);  



  ////// U

  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(275, 100, 32, 50); // 1h  U 1st Column 
  bezier (275, 100, 285, 90, 297, 90, 307, 100);
  bezier (275, 150, 285, 160, 297, 160, 307, 150); 
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(275, 168, 32, 50); // 2h
  bezier (275, 168, 285, 158, 297, 158, 307, 168);
  bezier (275, 218, 285, 228, 297, 228, 307, 218); 
  
    if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(275, 236, 32, 50); // 3h
  bezier (275, 236, 285, 226, 297, 226, 307, 236);
  bezier (275, 286, 285, 296, 297, 296, 307, 286); 
 
 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke(); 
  rect(275, 304, 32, 50); // 4h
  bezier (275, 304, 285, 294, 297, 294, 307, 304);
  bezier (275, 354, 285, 364, 297, 364, 307, 354);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  rect(275, 372, 32, 50); // 5h
  bezier (275, 372, 285, 362, 297, 362, 307, 372);
  bezier (275, 422, 285, 432, 297, 432, 307, 422);  


 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke(purple);
  fill(purple); }
  noStroke();
  rect(310, 100, 32, 50); // 1i  U 2nd Column 
  bezier (310, 100, 320, 90, 332, 90, 342, 100);
  bezier (310, 150, 320, 160, 332, 160, 342, 150); 
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r5, r6);
  fill (r4, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();
  rect(310, 168, 32, 50); // 2i
  bezier (310, 168, 320, 158, 332, 158, 342, 168);
  bezier (310, 218, 320, 228, 332, 228, 342, 218);
 
 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke(); 
  rect(310, 236, 32, 50); // 3i
  bezier (310, 236, 320, 226, 332, 226, 342, 236);
  bezier (310, 286, 320, 296, 332, 296, 342, 286);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(310, 304, 32, 50); // 4i
  bezier (310, 304, 320, 294, 332, 294, 342, 304);
  bezier (310, 354, 320, 364, 332, 364, 342, 354);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(dkRed);
  fill(dkRed);}
  noStroke();
  rect(310, 372, 32, 50); // 5i
  bezier (310, 372, 320, 362, 332, 362, 342, 372);
  bezier (310, 422, 320, 432, 332, 432, 342, 422); 
 
  
 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke(purple);
  fill(purple); }
  noStroke();
  rect(345, 372, 32, 50); // 5k U Bottom
  bezier (345, 372, 355, 362, 367, 362, 377, 372);
  bezier (345, 422, 355, 432, 367, 432, 377, 422);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(380, 372, 32, 50); // 5k U Bottom 2nd
  bezier (380, 372, 390, 362, 402, 362, 412, 372);
  bezier (380, 422, 390, 432, 402, 432, 412, 422);  

 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke(purple);
  fill(purple); }
  noStroke();
  rect(415, 100, 32, 50); // 1l  U 2nd Left Column 
  bezier (415, 100, 425, 90, 437, 90, 447, 100);
  bezier (415, 150, 425, 160, 437, 160, 447, 150); 
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(grPurp);
  fill(grPurp);}
  noStroke();
  rect(415, 168, 32, 50); // 2l
  bezier (415, 168, 425, 158, 437, 158, 447, 168);
  bezier (415, 218, 425, 228, 437, 228, 447, 218);
 
 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(dkRed);
  fill(dkRed);} 
  noStroke();
  rect(415, 236, 32, 50); // 3l
  bezier (415, 236, 425, 226, 437, 226, 447, 236);
  bezier (415, 286, 425, 296, 437, 296, 447, 286);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(415, 304, 32, 50); // 4l
  bezier (415, 304, 425, 294, 437, 294, 447, 304);
  bezier (415, 354, 425, 364, 437, 364, 447, 354);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r5, r3);
  fill (r4, r5, r3);
} else{
  stroke(grPurp);
  fill(grPurp);}
  noStroke();
  rect(415, 372, 32, 50); // 5l
  bezier (415, 372, 425, 362, 437, 362, 447, 372);
  bezier (415, 422, 425, 432, 437, 432, 447, 422);  

  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(grPink);
  fill(grPink);}
  noStroke();
  rect(450, 100, 32, 50); // 1m  U 2nd right Column 
  bezier (450, 100, 460, 90, 472, 90, 482, 100);
  bezier (450, 150, 460, 160, 472, 160, 482, 150);
 
 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(pink);
  fill(pink);} 
  noStroke();
  rect(450, 168, 32, 50); // 2m
  bezier (450, 168, 460, 158, 472, 158, 482, 168);
  bezier (450, 218, 460, 228, 472, 228, 482, 218); 
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(dkRed);
  fill(dkRed);}
  noStroke();
  rect(450, 236, 32, 50); // 3m
  bezier (450, 236, 460, 226, 472, 226, 482, 236);
  bezier (450, 286, 460, 296, 472, 296, 482, 286);  
  
  if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(450, 304, 32, 50); // 4m
  bezier (450, 304, 460, 294, 472, 294, 482, 304);
  bezier (450, 354, 460, 364, 472, 364, 482, 354);  
  
 if (mouseX >= 250 && mouseX <= 575 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke(); 
  rect(450, 372, 32, 50); // 5m
  bezier (450, 372, 460, 362, 472, 362, 482, 372);
  bezier (450, 422, 460, 432, 472, 432, 482, 422);  
  
  
  
  
//// B

if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();
  rect(520, 100, 32, 50); // 1n  B 1st Column 
  bezier (520, 100, 530, 90, 542, 90, 552, 100);
  bezier (520, 150, 530, 160, 542, 160, 552, 150); 
 
 if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(dkRed);
  fill(dkRed);}
  noStroke(); 
  rect(520, 168, 32, 50); // 2n
  bezier (520, 168, 530, 158, 542, 158, 552, 168);
  bezier (520, 218, 530, 228, 542, 228, 552, 218); 
  
    if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(520, 236, 32, 50); // 3n
  bezier (520, 236, 530, 226, 542, 226, 552, 236);
  bezier (520, 286, 530, 296, 542, 296, 552, 286); 
 
 if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke (grPurp);
  fill(grPurp);}
  noStroke(); 
  rect(520, 304, 32, 50); // 4n
  bezier (520, 304, 530, 294, 542, 294, 552, 304);
  bezier (520, 354, 530, 364, 542, 364, 552, 354);  
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(dkRed);
  fill(dkRed);}
  noStroke();
  rect(520, 372, 32, 50); // 5n
  bezier (520, 372, 530, 362, 542, 362, 552, 372);
  bezier (520, 422, 530, 432, 542, 432, 552, 422);
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();
  rect(555, 100, 32, 50); // 1n  B 2nd Column 
  bezier (555, 100, 565, 90, 577, 90, 587, 100);
  bezier (555, 150, 565, 160, 577, 160, 587, 150); 
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r6);
  fill (r, r2, r6);
} else{
  stroke (grPink);
  fill(grPink);}
  noStroke();
  rect(555, 168, 32, 50); // 2n
  bezier (555, 168, 565, 158, 577, 158, 587, 168);
  bezier (555, 218, 565, 228, 577, 228, 587, 218); 
  
    if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(555, 236, 32, 50); // 3n
  bezier (555, 236, 565, 226, 577, 226, 587, 236);
  bezier (555, 286, 565, 296, 577, 296, 587, 286);  
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(555, 304, 32, 50); // 4n
  bezier (555, 304, 565, 294, 577, 294, 587, 304);
  bezier (555, 354, 565, 364, 577, 364, 587, 354);  
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke(grPurp);
  fill(grPurp);}
  noStroke();
  rect(555, 372, 32, 50); // 5n
  bezier (555, 372, 565, 362, 577, 362, 587, 372);
  bezier (555, 422, 565, 432, 577, 432, 587, 422);

if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke (purple);
  fill(purple);}
  noStroke();
  rect(590, 100, 32, 50); // 1o  B
  bezier (590, 100, 600, 90, 612, 90, 622, 100);
  bezier (590, 150, 600, 160, 612, 160, 622, 150); 
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(590, 236, 32, 50); // 3o B
  bezier (590, 236, 600, 226, 612, 226, 622, 236);
  bezier (590, 286, 600, 296, 612, 296, 622, 286);  
  
    if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(590, 372, 32, 50); // 5o B
  bezier (590, 372, 600, 362, 612, 362, 622, 372);
  bezier (590, 422, 600, 432, 612, 432, 622, 422);
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (brPurp);
  fill(brPurp);}
  noStroke();
  rect(625, 100, 32, 50); // 1p  B  
  bezier (625, 100, 635, 90, 647, 90, 657, 100);
  bezier (625, 150, 635, 160, 647, 160, 657, 150); 
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke (pink);
  fill(pink);}
  noStroke();
  rect(625, 236, 32, 50); // 3p B
  bezier (625, 236, 635, 226, 647, 226, 657, 236);
  bezier (625, 286, 635, 296, 647, 296, 657, 286);  
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r5, r6);
  fill (r4, r5, r6);
} else{
  stroke(napierRed);
  fill(napierRed);}
  noStroke();
  rect(625, 372, 32, 50); // 5p B
  bezier (625, 372, 635, 362, 647, 362, 657, 372);
  bezier (625, 422, 635, 432, 647, 432, 657, 422);
  
if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r3);
  fill (r, r5, r3);
} else{
  stroke(grPink);
  fill(grPink);}
  noStroke();
  rect(660, 100, 32, 50); // 1q B  
  bezier (660, 100, 670, 90, 682, 90, 692, 100);
  bezier (660, 150, 670, 160, 682, 160, 692, 150); 
 
 
 if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke (dkRed);
  fill(dkRed);}
  noStroke(); 
  rect(660, 236, 32, 50); // 3q B
  bezier (660, 236, 670, 226, 682, 226, 692, 236);
  bezier (660, 286, 670, 296, 682, 296, 692, 286);  
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r4, r2, r3);
  fill (r4, r2, r3);
} else{
  stroke(pink);
  fill(pink);}
  noStroke();
  rect(660, 372, 32, 50); // 5q B
  bezier (660, 372, 670, 362, 682, 362, 692, 372);
  bezier (660, 422, 670, 432, 682, 432, 692, 422);

if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r5, r6);
  fill (r, r5, r6);
} else{
  stroke (pink);
  fill(pink);}
  noStroke();
  rect(678, 304, 32, 50); // 2r B
  bezier (678, 304, 688, 294, 700, 294, 710, 304);
  bezier (678, 354, 688, 364, 700, 364, 710, 354);
  
  if (mouseX >= 600 && mouseX <= 900 && mouseY >= 100 && mouseY <= 410) {
  stroke(r, r2, r3);
  fill (r, r2, r3);
} else{
  stroke(dkRed);
  fill(dkRed);}
  noStroke();
  rect(678, 168, 32, 50); // 4r B
  bezier (678, 168, 688, 158, 700, 158, 710, 168);
  bezier (678, 218, 688, 228, 700, 228, 710, 218); 


  fill (napierRed); // now i've assigned these colour values i can change these.
  rect(740, 100, 352, 310); // NOTICE BOARD PANEL
  bezier (740, 100, 770, 50, 1092, 50, 1092, 100);
  bezier (740, 410, 770, 480, 1062, 480, 1092, 410);  

  fill(250, 250, 250);
  textSize(30); //Eventually found this is what I need to have the same font
  // in two different sizes.
  text ("CV Doctor", 840, 260);
  text ("Drop in Session", 810, 310);
  text ("9 to 5pm", 860, 385);
  textSize(67);
  text ("Today", 815, 170);
  textSize(35);
  fill(napierRed);
  text ("the", 30, 85);

  noFill();
  stroke(250, 250, 250);
  strokeWeight(2);
  bezier(812, 200, 825, 200, 947, 193, 963, 198);

}




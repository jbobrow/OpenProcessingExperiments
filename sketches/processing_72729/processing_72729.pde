
//start program
void setup() {
  size(640, 500);
  background (0);
  smooth();
  noStroke();
  strokeJoin(ROUND);
  frameRate(20);
}

//move object and rotate
void draw() {
  
  //rectangle fill overlays with background and is redrawn everytime
  fill (43, 113, 160);
  //hide object trace that follows with neverending rectangle redrawn
  rect (0, 0, 640, 500);
  
  //open first effect (moving background lines)
  pushMatrix();
  
  //BACKGROUND LINES PERSPECTIVE
  noFill ();
  stroke (204, 255, 51, 50);
  for (int e = 5; e < 1500; e += 5) {
    for (int d = 5; d < 1000; d += 200) {
      translate(mouseX, mouseY);
      rotate(radians(frameCount/20));
      ellipse (d, d, e, e);
    }
  }

  noFill ();
  stroke (235, 0, 139, 50);
  for (int e = 5; e < 1500; e += 20) {
    for (int d = 0; d < 500; d += 150) {
      translate(mouseX, mouseY);
      rotate(radians(frameCount/20));
      ellipse (d, d, e, e);
    }
  }

  noFill ();
  stroke (235, 0, 139, 50);
  for (int e = 5; e < 1500; e += 20) {
    for (int d = 200; d < 500; d += 150) {
      translate(mouseX, mouseY);
      rotate(radians(frameCount/20));
      ellipse (d, 320, e, e);
    }
  }
  
  //close first effect
  popMatrix();
  
  
  //open second effect (moving tesseract)
  pushMatrix();
  
  //tesseract has no stroke
  stroke (255, 255, 255, 70);
 
  //track where the mouse is...
  translate(mouseX, mouseY);
  //and move object according to that
  rotate(radians(frameCount));

  //variables to relocate object to (0,0)
  float left = 110.139;
  float up = 200.847;
  int moveleft = 170;
  int moveright = 170;
  int moveup = 170;
  int movedown = 170;
  
  //upon mouseclick tesseract explodes
  if (mousePressed == true) {
    
    //open third effect cube around tesseract
    pushMatrix(); 
    rotate(radians(frameCount*-2));
   
   //START CUBE around Tesseract
   fill(23, 209, 255, 50);
   quad (0, 44.394, 104.114, 75.074, 106.988, -75.376, 2.875, -106.06);
   fill(185, 241, 255, 50);
   quad (-104.908, 71.069, 0.303, 44.388, 3.178, -106.063, -102.032, -79.382);
   fill(139, 232, 235, 50);
   quad(-1.166, 102.036, 104.67, 75.074, 0.303, 44.388, -105.281, 71.354);
   fill(190, 241, 255, 30);
   quad (-104.988, 71.727, -0.875, 102.407, 2, -48.043, -102.113, -78.726);
   fill(185, 241, 255, 30);
   quad (0, 101.069, 105.211, 74.388, 108.086, -76.063, 2.875, -49.382);
   fill(0, 184, 230, 30);
   quad (2.069, -47.948, 107.544, -75.376, 3.178, -106.063,-102.046, -78.627);
   
   
   
  //close third effect
  popMatrix();
  }
  //when mouse is not pressed tesseract continues
  
  
  //START TESSERACT
  fill (14, 117, 143, 50);
  quad (109.815 -left, 233.224 -up, 185.253 -left, 253.896 -up, 185.253 -left, 145.454 -up, 109.815 -left, 124.781 -up);
  //START INSIDE CUBE
  fill (139, 232, 255, 50);
  quad (34.195 -left, 253.896 -up, 109.634 -left, 233.224 -up, 109.634 -left, 124.781 -up, 34.195 -left, 145.454 -up);
  fill (116, 132, 161, 50);
  quad (73.624 -left, 242.761 -up, 125.442 -left, 264.943 -up, 174.089 -left, 203.785 -up, 122.27 -left, 181.604 -up);
  fill (116, 227, 255, 50);
  quad (73.522 -left, 242.68 -up, 122.168 -left, 181.521 -up, 88.896 -left, 136.022 -up, 40.251 -left, 197.18 -up);
  fill (0, 184, 230, 50);
  quad (122.168 -left, 181.521 -up, 174.331 -left, 203.478 -up, 140.958 -left, 157.897 -up, 88.896 -left, 136.022 -up);
  fill (139, 232, 255, 50);
  quad (73.522 -left, 242.372 -up, 125.687 -left, 264.635 -up, 92.313 -left, 219.055 -up, 40.251 -left, 196.873 -up);
  fill (185, 241, 255, 50);
  quad (40.495 -left, 196.873 -up, 92.313 -left, 219.055 -up, 140.958 -left, 157.897 -up, 89.14 -left, 135.715 -up);
  fill (23, 209, 255, 50);
  quad (92.416 -left, 219.136 -up, 125.687 -left, 264.635 -up, 174.331 -left, 203.478 -up, 141.062 -left, 157.979 -up);
  //END OF INSIDE CUBE
  //START DIVISIONS REFLECTIONS
  fill (162, 255, 232, 50);
  triangle (34.195 -left, 253.896 -up, 108.642 -left, 274.842 -up, 73.624 -left, 243.092 -up);
  fill (162, 236, 255, 50);
  quad (34.195 -left, 254.441 -up, 109.634 -left, 275.114 -up, 109.634 -left, 166.671 -up, 34.195 -left, 145.998 -up);
  fill (14, 117, 143, 50);
  quad (34.195 -left, 254.441 -up, 109.634 -left, 274.842 -up, 185.253 -left, 254.168 -up, 109.634 -left, 232.952 -up);
  fill (16, 132, 161, 50);
  quad (109.815 -left, 275.114 -up, 185.253 -left, 254.441 -up, 185.253 -left, 145.998 -up, 109.815 -left, 166.671 -up);
  fill (125, 255, 223, 50);
  triangle (125.687 -left, 264.635 -up, 184.758 -left, 253.896 -up, 143.642 -left, 242.286 -up);
  fill (51, 255, 204, 50);
  quad (143.642 -left, 242.286 -up, 184.758 -left, 253.896 -up, 185.302 -left, 145.998 -up, 174.105 -left, 203.565 -up);
  fill (61, 192, 160, 50);
  triangle (110.312 -left, 124.96 -up, 140.977 -left, 158.343 -up, 184.758 -left, 145.906 -up);
  fill (181, 255, 236, 50);
  quad (34.195 -left, 253.896 -up, 40.495 -left, 196.873 -up, 72.592 -left, 156.52 -up, 34.195 -left, 145.998 -up);
  fill (61, 192, 160, 50);
  triangle (34.195 -left, 145.454 -up, 72.592 -left, 156.52 -up, 88.896 -left, 136.022 -up);
  line (109.815 -left, 124.781 -up, 141.062 -left, 157.979 -up);
  fill (116, 227, 255, 50);
  quad (34.195 -left, 145.998 -up, 109.634 -left, 166.671 -up, 185.253 -left, 145.998 -up, 109.634 -left, 124.781 -up);
  //FINISH TESSERACT








  //close second effect
  popMatrix();
}

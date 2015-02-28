
/*****************************
* Self Portrait in the style of Alfred Hitchcock's in Dial M for Murder.
* class 1
* Angela Stempel 07.07.2012
* Includes adapted Reach2 example, based on code from Keith Peters (www.bit-101.com)

*****************************/

int numSegments = 15;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 11;
float targetX, targetY;

void setup() {
  size(350, 250);
  background(211, 141, 28);
  smooth();
}

void draw() {
  rectMode(CORNER);
  ellipseMode(CORNER);
  noStroke();
  
// colors black background rectangle
  fill(0);
  rect(0, 0, 70, 400);

// Colors the door behind Grace.
  fill(242, 182, 86, 70);
  rect(67, 0, 40, 400);

  fill(129, 85, 13, 70);
  rect(98, 0, 120, 400);

  fill(242, 182, 86, 70);
  rect(215, 0, 50, 400);

  fill(129, 85, 13, 70);
  rect(255, 0, 120, 400);

//colors in highlights
  fill(245, 197, 119, 70);
  rect(96, 0, 2, 400);
  rect(216, 0, 3, 400);
  rect(254, 0, 4, 400);

/**draws hair, Brown,  integrate Reach2 code for hair. 
Make hair responsive to mouse interaction*/
  fill(90, 45, 8);
  ellipse(50, 20, 200, 180);
  ellipse(45, 100, 140, 130);
 
// draws body, grey
  fill(51, 143, 252);
  quad(135, 175, 220, 150, 300, 260, 135, 260);
  
/* draws neck black
arc(x1(TOP CORNER), y1(TOP CORNER), width, height, start angle, radian(?), 2nd angle);
*/ 
  fill(242, 214, 176);
  arc(150, 100, 50, 100, 0, PI);
    
// draws head
  fill(252, 224, 186);
  arc(125, 10, 100, 150, 0, TWO_PI/2);

//draws eye lids
  fill(222, 180, 125);
  arc(140, 100, 23, 16, 0, TWO_PI);
  arc(190, 100, 23, 16, 0, TWO_PI);

//draws eye lashes, 
  fill(95, 56, 24);
  arc(140, 103, 23, 11, 0, TWO_PI);
  arc(190, 103, 23, 11, 0, TWO_PI);

// draws eye whites
  fill(255);
  arc(140, 104, 23, 9, 0, TWO_PI);
  arc(190, 104, 23, 9, 0, TWO_PI);

// draw iris
  fill(139, 79, 30, 100);
  ellipse(149, 103, 9, 9);
  ellipse(199, 103, 9, 9);

  fill(139, 79, 30, 150);
  ellipse(151, 104, 7, 7);
  ellipse(201, 104, 7, 7);

//draw pupil
  fill(139, 79, 30, 220);
  ellipse(150, 105, 5, 5);
  ellipse(200, 105, 5, 5);

  fill(0, 0, 0, 250);
  ellipse(153, 106, 3, 3);
  ellipse(203, 106, 3, 3);

//draws eyebrows
  fill(95, 56, 24);
  beginShape();
  vertex(135, 105);
  bezierVertex(135, 85, 165, 85, 165, 95);
  bezierVertex(165, 95, 135, 85, 135, 105);
  endShape(); //right eyebrow

  fill(95, 56, 24);
  beginShape();
  vertex(218, 98);
  bezierVertex(218, 90, 190, 85, 190, 95);
  bezierVertex(190, 95, 210, 90, 218, 98);
  endShape(); // left eyebrow

//draw nose shadow
  fill(198, 150, 86, 170);
  arc(170, 100, 15, 40, TWO_PI-PI, TWO_PI);

//draw nose
  fill(252, 224, 186);
  arc(167, 100, 15, 40, TWO_PI-PI, TWO_PI);

//draw nosetip shadow
  fill(198, 150, 86, 170);
  curveTightness(7);
  curve(160, 110, 170, 130, 185, 130, 198, 120);

//draw nosetip
  fill(252, 224, 186);
  curveTightness(7);
  curve(160, 110, 167, 130, 182, 130, 195, 110);

//draw nostrils
  fill(82, 54, 17, 170);
  curve(167, 123, 172, 125, 175, 125, 175, 123); // right 
  curve(186, 122, 180, 124, 183, 125, 188, 124); // left

//draw lips
  fill(229, 151, 123, 200);
  curveTightness(7);
  curve(160, 135, 167, 150, 182, 150, 198, 125); //top
  curve(160, 155, 167, 140, 182, 140, 198, 155);//bottom

//draw black mouth interior
  fill(108, 63, 47);
  curveTightness(7);
  curve(168, 142, 168, 145, 182, 145, 186, 135); //top

//draws lip overlap
  fill(229, 151, 123, 200);
  curve(168, 145, 168, 148, 182, 148, 186, 140);// bottom

//draws teeth
  fill(255);
  curve(169, 142, 169, 142, 182, 142, 186, 135);

//draws arm
  fill(252, 224, 186);
  ellipse(199, 148, 50, 100);
  ellipse(200, 195, 40, 100);

//draws forearm/hand
  fill(252, 224, 186);
  beginShape();
  vertex(220, 240);
  bezierVertex(100, 200, 220, 190, 145, 160);
  bezierVertex(100, 160, 150, 300, 220, 260);
  endShape();
  
//filter
  fill(255, 209, 82, 20);
  rect(0, 0, 350, 250);
  
// Reach2 code for interaction
  smooth();
  strokeWeight(20.0);
  stroke(90, 45, 8, 255);
  x[x.length-1] = 125;     // Set base x-coordinate
  y[x.length-1] = 80;  // Set base y-coordinate

  
 reachSegment(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)*2); 
  }
  
}

// reach2 code continued
void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength; 
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}





/***** CODE CHEATSHEET ***********************

bezierVertex(cx1, cy1, cx2, cy2, x, y);
bezierVertex(cx1, cy1, cz1, cx2, cy2, x, y, z);
curve(cx1, cy1, x1, y1, x2, y2, cx2, cy2);
arc(x1, y1, width, height, start pt., end pt);
ellipse(x1, y1, width, height);

*********************************************/



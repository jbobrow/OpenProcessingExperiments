
/**********************************
 * Assignment:   #1
 * Name:         Wang Xiang
 * E-mail:       wxiang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    09/11/2012
 * Description: For this sketch, I used skills of lines, dots, triangles, ellipses, custom shapes and some other skills related to color fill and color changing.
                Also I tried mousePressed so that I can design my D's hair style! 
 ***********************************************/

void setup() {
  //set the window
  size(500, 500);
  smooth();
  //draw a yellow background
  background(242, 252, 110);

  //set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);

  //draw D's head
  stroke(0);
  fill(255);
  strokeWeight(4);
  beginShape();
  vertex(180, 90);
  vertex(180, 210);
  vertex(240, 240);
  vertex(270, 240);
  vertex(330, 210);
  vertex(330, 90);
  endShape(CLOSE);


  //draw D's nose
  fill(255);
  stroke(0);
  ellipse(255, 150, 5, 5);

  //draw D's mouse
  strokeWeight(4);
  beginShape(TRIANGLE_STRIP);  
  vertex(225, 205);  
  vertex(235, 190);  
  vertex(245, 205);  
  vertex(255, 190);  
  vertex(265, 205);  
  vertex(275, 190);  
  vertex(285, 205);  
  endShape();

  //draw D's chin
  stroke(0);
  strokeWeight(4);
  line(240, 240, 270, 240);

  stroke(0);
  strokeWeight(4);
  line(180, 210, 240, 240);
  line(330, 210, 270, 240);

  //draw D's neck
  stroke(0);
  strokeWeight(4);
  line(255, 240, 255, 260);

  //draw D's dress
  stroke(0);
  fill(110, 252, 120);
  strokeWeight(4);
  triangle(255, 260, 120, 400, 390, 400);

  //draw D's hands
  fill(250, 55, 55);
  stroke(0);
  strokeWeight(4);
  line(212, 300, 130, 270);
  line(298, 300, 380, 270);
  ellipse(125, 265, 20, 20);
  ellipse(385, 265, 20, 20);

  //draw D's legs
  stroke(0);
  strokeWeight(4);
  line(220, 400, 200, 480);
  line(290, 400, 310, 480);

  //draw D's feet
  fill(250, 55, 55);
  stroke(0);
  strokeWeight(4);
  ellipse(175, 480, 50, 40);
  ellipse(335, 480, 50, 40);

  //draw dots on D's dress
  fill(110, 115, 252);
  int r=225;
  int m=310;
  ellipse(r, m, 10, 10);
  ellipse(r+15, m, 10, 10);
  ellipse(r+30, m, 10, 10);
  ellipse(r+45, m, 10, 10);
  ellipse(r+60, m, 10, 10);

  fill(110, 115, 252);
  int a=180;
  int b=370;
  ellipse(a, b, 20, 20);
  ellipse(a+30, b, 20, 20);
  ellipse(a+60, b, 20, 20);
  ellipse(a+90, b, 20, 20);
  ellipse(a+120, b, 20, 20);
  ellipse(a+150, b, 20, 20);
}

void draw() {
  //eye color change
  fill(random(255), random(255), random(255));
  ellipse(220, 140, 25, 25);
  ellipse(290, 140, 25, 25);
  int mouseX=200;
  int mouseY=80;
  if (mousePressed == true); 
  strokeWeight(2);
  fill(255, 0, 0);
  float R=random(20, 40);
  ellipse(mouseX, mouseY, R, R);
}

void mousePressed() {
  strokeWeight(2);
  fill(255, 0, 0);
  float R=random(20, 40);
  ellipse(mouseX, mouseY, R, R);
}

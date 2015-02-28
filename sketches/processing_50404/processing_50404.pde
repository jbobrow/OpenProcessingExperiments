
/*****************************************
 * Assignment #1
 * Name:         Hoang Ha
 * E-mail:       hha@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    1/26/12
 * 
 * One distinctive feature of my sketch is the fact that I 
 rotated the ellipse for the head, and the bamboo on the side.
 After rotating it, the position changed so I used the function 
 translate to move it back to its original position. Instead of 
 using the text for the word Panda, I chose to use lines and curves instead.
 What took me the longest time to figure out was how to draw the curves 
 that I wanted. I think that the coordinate rule for curves are very 
 confusing. However, after spending some time looking over the descriptions,
 I have a better feel for it.
 ***********************************************/ 
void setup(){
  size(500,500);
  background(255);
  noLoop();
  smooth();
}

void draw() {
  /*RightLeg
  Rotating will change the position of shape
  so you have to translate it back into its original position.
  pushMatrix is used to let program know to start at current matrix position 
  and popMatrix is to restore it to prior coordinate system (0,0).
  Same reasoning is applied for the rest of the code
  */
  pushMatrix();
  translate(215,-150);
  rotate(.7);
  fill(0);
  ellipse(325,225,35,50);
  popMatrix();
  
  //LeftLeg
  fill(0);
  ellipse(190,250,50,30);
  
  //Body
  fill(255);
  ellipseMode(CENTER);
  ellipse(250,225,120,75);
  
  //Head
  pushMatrix();
  rotate(-.11);
  translate(-20, 40);
  fill(255);
  ellipse(250,150,150,100);
  
  //Ears
  fill(0);
  ellipse(200,105,25,20); 
  
  fill(0); 
  ellipse(300,105,25,20);

  //Eyes rings
  fill(0);
  ellipse(225,150,40,40);
  
  fill(0);
  ellipse(275,150,40,40);
  
  //Eyes
  fill(225);
  ellipse(230,155,10,10);
  
  fill(225);
  ellipse(270,155,10,10);
  
  //Nose
  fill(0);
  arc(250,175,20,20,.297,3.013);
  popMatrix();
  
  //bambooBody
  fill(80,191,60);
  quad(210,240,215,245,300,235,295,230);
  
  //bambooBodyleaf
  pushMatrix();
  rotate(.4);
  translate(65,-140);
  ellipse(295,230,5,10);
  popMatrix();
  
  //Hands
  pushMatrix();
  translate(-60,80);
  rotate(-.30);
  fill(0);
  ellipse(235,235,25,30);
  popMatrix();
  
  //RightHand
  pushMatrix();
  translate(90,-60);
  rotate(1);
  fill(0);
  ellipse(345,7,25,30);
  popMatrix();
 
  //Bamboo
  pushMatrix();
  fill(80,191,60);
  translate(10,-40);
  rotate(.12);
  rect(375,150,10,100);
  
  rect(375,90,10,50);
  
  rect(375,50,10,30);
  
  //Bamboo(2nd right)
  rect(405,150,10,100);
  
  rect(405,100,10,40);
 
  //Bamboo(right leaves)
  beginShape();
  curveVertex(390,85);
  curveVertex(390,85);
  curveVertex(393,76);
  curveVertex(405,65);
  curveVertex(400,80);
  curveVertex(390,85);
  curveVertex(390,85);
  endShape(CLOSE);
  
  beginShape();
  curveVertex(420,145);
  curveVertex(420,145);
  curveVertex(423,136);
  curveVertex(435,125);
  curveVertex(430,140);
  curveVertex(420,145);
  curveVertex(420,145);
  endShape();
  
  popMatrix(); 
  
  //TEXT(PANDA)
  noFill();
  strokeWeight(5);
  line(100,300,100,375);
  
  curve(100, 300, 100, 300, 130, 300, 130, 325);
  curve(100, 300, 130, 300, 150, 325, 130, 350);
  curve(130, 300, 150, 325, 130, 350, 100, 350);
  curve(150, 325, 130, 350, 100, 350, 100, 350);
  
  line(150, 375, 175, 325);
  line(175, 325, 200, 375);
  line(163, 350, 187, 350);
  
  line(212, 375, 212, 325);
  line(212, 325, 260, 375);
  line(260, 375, 260, 325);
  
  line(275, 375, 275, 325);
  
  /*using the same curve part of the P in Panda to make the D,
  copy the same coding with the same coordinate. However, 
  translate(move) the code to the wanted position.
  Like before, pushMatrix is used to let program know that 
  it need to start at current matrix position and not (0,0). 
  PopMatrix is to restore to prior coordinate system.
  */
  pushMatrix();
  translate(175,25);
  curve(100, 300, 100, 300, 130, 300, 130, 325);
  curve(100, 300, 130, 300, 145, 325, 130, 350);
  curve(130, 300, 145, 325, 130, 350, 100, 350);
  curve(145, 325, 130, 350, 100, 350, 100, 350);
  popMatrix();
  
  /*The same concept used for D is now used for A. Using the same 
  code, translate the A into the wanted position. 
  Same concept as above is used for pushMatrix and popMatrix.
  */
  pushMatrix();
  translate(175,0);
  line(150, 375, 175, 325);
  line(175, 325, 200, 375);
  line(163, 350, 187, 350);
  popMatrix();
}


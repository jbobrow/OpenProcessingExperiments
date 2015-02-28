
/*********************************************
*Assignment #1
*Name: Kelli Breeden 
*Email: kbreeden@bmc
*Course: CS 110
*submitted: 1/26/2012
*
* This sketch, using basic shapes such as 
* ellipse, triangle, rectangle and curve, 
* draws the form as an owl. Symmetry was 
* pretty difficult to achieve, especially
* when using curves.
**********************************************/
  
void setup () {
  colorMode(RGB);
  background(0,132,154);
  size(800,500);
}

void draw() {
  //body
  fill(140,114,108);
  ellipse (400,280,155,180);
  curve(643,219,456,216,460,340,670,420);
  curve(124,336,347,213,342,343,119,195);
  fill(156,133,128);
  ellipse(400,280,65,100);
  
  //face
  fill(156,133,128);
  triangle(360,110,375,105,370,85);
  triangle(440,110,425,105,430,85);
  fill(140,114,108);
  ellipse (400,150,110,110);
  fill(199,140,78);
  triangle(400,190,395,165,415,165);
  fill(0);
  ellipse(385,140,7,7);
  ellipse(415,140,7,7);

  //left leg
  fill(156,133,128);
  rect(370,365,5,50);
  line(370,415,365,425);
  line(372.5,415,372,425);
  line(375,415,380,425);
  
  //right leg
  rect(420,365,5,50);
  line(420,415,415,425);
  line(422.5,415,422,425);
  line(425,415,430,425);
}




  //sets size of window
size(200,200);

  //Makes background Yellow
  background(255,255,0);
  
  //Makes ground (grass)
  noStroke();
  fill(0,255, 0);
  rect(0, 175, 200, 25);
  //Sets center mode
  ellipseMode (CENTER);
  rectMode(CENTER);
  
  
  //Draw Bob's head
  stroke(0);
  fill(177, 92, 211);
  ellipse(100, 100, 50, 50);
  
  //Draw Bob's eyes
  fill(0);
  ellipse(90, 90, 20, 20);
  ellipse(110, 90, 20, 20);
 
 //Draw Bob's body
 triangle(100,125,60,160,140,160);
 
 //Draw Bob's mouth
 stroke(222,31,79);{
   fill(255);
   ellipse(100, 110, 10,10);
 
 
 //Bob's arms
 //right arm
 line(93,130,60,140);
 //left arm
 line(107,130,140,140);
 
 //Translate to (100, 160)
 translate(100, 160);
 //Bob's legs
 //Bob's right leg
 line(0, 0, -20 ,20);
 //Bob's left leg
 line(0, 0, 20, 20);
 }
 //Translate to (0, -57)
 translate(0, -57);
 
 //Bob's Hat
 fill(255);
 triangle(0, -50, -15, -29, 15, -29);
 ellipse(0, -55, 10, 10);
 
 //translate to (-50, 50)
 translate(-50, 50);
 
 //Bob's Breifcase
 //Body of breifcase
 rect(5, 5, 30, 20);
 //Handle of breifcase
 noFill(); {
 rect(6, -10, 15, 8);
 }
 
 //translate to (55, -22)
 translate(55, -22);
 
 //Bob's buttons
 //Top button
 rect(-4, 5, 5, 5);
 //Middle button
 rect(-4, 13, 5, 5);
 //Bottom button
 rect(-4, 22, 5, 5);
 
 //translate to (35, -90)
 translate(35, -90);
 
 //Bob's balloon
 //Balloon body
 ellipse(0, 0, 30, 40);
 //Ballon tie
 triangle(0, 20, -5, 25, 5, 25);
 //Balloon string
 line(0, 25, 0, 100);


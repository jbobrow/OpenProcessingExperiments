
/*
  MFADT BOOTCAMP DAY01 CODE ASSIGNMENT by Sherry Zhang
  MR. BROCCOLI
*/

  //set window size
  size(600, 800);

  //set background color
  background(255);

  //draw a face
  noStroke();
  fill(124,250,129);
  triangle(150,200,450,200,300,600);
  
  //draw a body
  quad(250,525,350,525,350,650,250,650);

  //draw curly hair
  ellipseMode(CORNER);
  fill(101,227,106);
  ellipse(100,50,150,150);
  ellipse(200,50,150,150);
  ellipse(300,50,150,150);
  ellipse(400,50,150,150);
  ellipse(100,100,150,150);
  ellipse(200,100,150,150);
  ellipse(300,100,150,150);
  ellipse(400,100,150,150);
  
  //draw two arms
  stroke(0);
  strokeWeight(3);
  line(150,600,250,550);
  line(450,600,350,550);
  
  //draw two legs
  line(275,650,275,750);
  line(325,650,325,750);
  
  //draw two eyebrows
  strokeWeight(3);
  noFill();
  arc(250,250,40,30, HALF_PI, PI);
  arc(350,250,40,30, HALF_PI, PI);
  
  //draw two eyes
  strokeWeight(15);
  point(250,300);
  point(350,300);
  
  //draw a nose
  strokeWeight(3);
  ellipse(300,400,5,5);
  
  //draw a mouth
  arc(285,450,40,30, HALF_PI, PI);
  

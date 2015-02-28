
/*
 
 DNA CODEINE 
 Stephanie Harris 2013 February
 
 */

void setup() {
  size( 600, 600);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(#011B48);

  //Body

  fill(#0F95FF, 60);  
  rect(300, 300, 350, 600, 100);

  ellipseMode(CENTER);
  fill(#E8EDFF);
  ellipse(300, 150, 300, 300);

  ellipseMode(CENTER);
  fill(#E8EDFF);
  ellipse(300, 450, 300, 300);

  // Upper Eye

  //Tear
  fill(#013274);
  bezier (300, 300, -20, -40, 620, -40, 300, 300);

  fill(#014E76);
  noStroke();
  //arc( 300,175, 175,250, 0, TWO_PI);

  fill(#0097E5);
  noStroke();
  arc( 300, 175, 150, 225, -4.3, 1.15);

  fill(#45C1FC);
  noStroke();
  arc( 300, 175, 138, 200, -4.3, 1.15);


  fill(255);
  arc( 300, 175, 120, 180, -4.3, 1.15);

  //pupil
  fill(0);
  arc( 300, 175, 80, 80, -4.45, 1.3);

  fill(#FFFFFF);
  arc( 320, 170, 20, 20, -TWO_PI, 4.45);

  fill(0);
  triangle(300, 10, 275, 100, 325, 100);

  fill(0);
  triangle(250, 10, 250, 150, 275, 100);

  fill(0);
  triangle(350, 10, 350, 150, 325, 100);



  // Lower Eye

  //Tear
  fill(#013274);
  bezier (300, 300, -20, 640, 620, 640, 300, 300);

  fill(#014E76);
  noStroke();
  //arc( 300,425, 175,250, 0, TWO_PI);

  fill(#0097E5);
  noStroke();
  arc( 300, 425, 150, 225, -1.15, 4.3);

  fill(#45C1FC);
  noStroke();
  arc( 300, 425, 138, 200, -1.15, 4.3);

  fill(255);
  arc( 300, 425, 120, 180, -1.15, 4.3);

  //pupil
  fill(0);
  arc( 300, 425, 80, 80, -1.3, 4.45);

  fill(#FFFFFF);
  arc( 280, 430, 20, 20, -TWO_PI, 4.45);

  fill(0);
  triangle(300, 590, 275, 500, 325, 500);

  fill(0);
  triangle(250, 590, 250, 450, 275, 500);

  fill(0);
  triangle(350, 590, 350, 450, 325, 500);





  //Lips

  fill(#810009);
  quad(125, 300, 250, 340, 350, 340, 475, 300);

  fill(#FF4B57);
  triangle(125, 300, 275, 270, 325, 300);

  fill(#C1000D);
  triangle(475, 300, 325, 270, 275, 300);

  //Tongue

  fill(#FF1212);
  //arc(300,300, 100,80, -.0, 3.14);

  //Teeth

  fill(#FFFFFF);
  quad(300, 300, 260, 300, 270, 310, 290, 310); 

  fill(#FFFFFF);
  quad(300, 300, 340, 300, 330, 310, 310, 310);

  fill(#FFFFFF);
  quad(340, 300, 365, 300, 356.6, 308, 348.3, 308); 

  fill(#FFFFFF);
  quad(260, 300, 235, 300, 243.4, 308, 251.7, 308); 




  println(mouseX +"   "+ mouseY);
}





/*

 This is the basis for my monster sketch
 matt richard 2013 February
 
 */

void setup() {
  size( 600, 600);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(255);

  //shoulders
  // style
  fill(#ff0000);// black inside
  stroke(0);
  ellipse(280, 550, 500, 600);

  
  //head
  // style
  fill(#0fcfcf);
  ellipse(width/2, height/2 - 50, 250, 350);

  //left eye
  // style
  fill(255);
  stroke(0);
  strokeWeight(5);
  ellipse(240, 200, 50, 50);

  //right eye
  // style
  ellipse(240, 210, 10, 10);

  //right eye
  // style
  ellipse(360, 200, 50, 50);

  //right eye
  // style
  ellipse(360, 210, 10, 10);

  //nose
  // style
  //strokeJoin(ROUND);
  noStroke();
  fill(#00afaa);
  triangle(width/2, 210, 330, 283, width/2, 290);

  //mouth
  // style
  stroke(#0d514f);
  strokeWeight(7);
  fill(#093534);
  ellipse(width*.55, 340, 80, 25);

  //hat
  fill(0);
  noStroke();
  quad(195, 139, 383, 110, 381, 22, 183, 45);

  //brim
  fill(0);
  noStroke();
  quad(120, 150, 118, 140, 448, 98, 450, 100);
  
  //left arm
  stroke(0);
  strokeWeight(5);
  line(107, 400, 43, 258);
  
  //left hand
  fill(#0fcfcf);
  ellipse(43, 258, 25, 25);
  
  //right arm
  line(460, 412, 520, 180);

//right hand
ellipse(520, 180, 35, 35);
  print(mouseX+ "   " +mouseY);
}


/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */
 
//setup -----

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  smooth();
}

//draw -----

void draw() {
  background(0);

  //MIDDLE HAIR PIECE - does not move
  noFill();
  stroke(255);
  strokeWeight(.7);
  rect(244, 18, 12, 132);

  //RIGHT HAIR PIECE 1 
  float rx1=map(mouseX, 0, width, width/2+20, width/2+60);
  noFill();
  stroke(255);
  strokeWeight(.7);
  rect(rx1, 18, 12, 132); 

  //RIGHT HAIR PIECE 2
  float rx2=map(mouseX, 0, width, width/2+46, width/2+128);
  rect(rx2, 18, 12, 132); 

  //RIGHT HAIR PIECE 3
  float rx3=map(mouseX, 0, width, width/2+70, width/2+194);
  rect(rx3, 18, 12, 132); 

  //RIGHT HAIR PIECE 4
  float rx4=map(mouseX, 0, width, width/2+96, width/2+260);
  rect(rx4, 18, 12, 132);

  //_____________________

  //LEFT HAIR PIECE 1
  float lx1=map(mouseX, 0, width, width/2-30, width/2-72);
  rect(lx1, 18, 12, 132);

  //LEFT HAIR PIECE 2
  float lx2=map(mouseX, 0, width, width/2-55, width/2-140);
  rect(lx2, 18, 12, 132);

  //LEFT HAIR PIECE 3
  float lx3=map(mouseX, 0, width, width/2-80, width/2-207);
  rect(lx3, 18, 12, 132);

  //LEFT HAIR PIECE 4
  float lx4=map(mouseX, 0, width, width/2-105, width/2-270);
  rect(lx4, 18, 12, 132);

  //____________________

  //MOUTH
  float m1=map(mouseX, 0, width, 25, 600);
  float m2=map(mouseX, 0, width, 15, 250);
  float thickness=map(mouseX, 0, width, 1, 5);
  strokeWeight(thickness);
  ellipse(248, 420, m1, m2);

  //____________________

  //LINE OF SNOT
  float s1=map(mouseX, 0, width, 270, 500);
  float s2=map(mouseX, 0, width, 0, 360);
  float s3=map(mouseX, 0, width, 55, 71);
  float s4=map(mouseX, 0, width, 0, 52);
  stroke(s3, s4, s2);
  strokeWeight(7);
  line(254, 267, 254, s1); 

  //BALL OF SNOT

  float d=map(mouseX, 0, width, 10, 30);
  noStroke();
  fill(s3, s4, s2);
  ellipseMode(CENTER);
  ellipse(254, s1, d, d);

  //____________________

  //NOSE IS GOING TO TWIRLLLL
  float b = map(mouseX, 0, width, 260, 249);
  float c = map(mouseX, 0, width, 267, 164);
  float dx = map(mouseX, 0, width, 236, 302);
  float e = map(mouseX, 0, width, 267, 382);
  float f = map(mouseX, 0, width, 248, 196);
  float g = map(mouseX, 0, width, 220, 382);

  fill(255);
  strokeWeight(7);
  stroke(255);
  triangle(b, c, dx, e, f, g);


  //EYES
  noFill();
  float d2=map(mouseX, 0, width, 15, 6);
  ellipse(161, 188, d2, d2); //left eye
  ellipse(334, 188, d2, d2); //right eye


  for (float i = 0; i<=height; i+=25) {
    for ( int j = 0; j <=width; j += 25) {
      noFill();
      stroke(255);
      strokeWeight(1.5);
      point(i, j);
      point(j, i);
    }
  }
}




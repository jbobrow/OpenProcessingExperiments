
// Jill Goodwyn
// Carnegie Mellon University
// Electronic Media Studio II Section D
// Professor Singer
// September 2011
// jpgoodwyn@gmail.com

// Wolfhead - animated eyes
// SO NERDY BUT I LOVE ANIMALS

void setup()
{
  size (500, 600);
  smooth();
  background(50);
}

void draw()
{
  // fuzz on top of head
  fill(85);
  stroke(85);
  strokeWeight(12);
  strokeJoin(ROUND);
  triangle(150,150, 175,45, 250,125);
  triangle(175,125, width/2,25, 325,125);
  triangle(350,150, 325,45, 250,125);

  // sideburn fuzz
  fill(75);
  stroke(75);
  strokeWeight(12);
  strokeJoin(ROUND);
  triangle(90,200, 25,300, 90,300);
  triangle(90,300, 60,375, 130,350);
  triangle(410,200, 475,300, 410,300);
  triangle(410,300, 440,375, 370,350);

  // bottom jaw
  fill(75);
  noStroke();
  ellipse(width/2, 515, 100,75);

  // ears
  fill(80);
  stroke(100);
  strokeWeight(12);
  strokeJoin(ROUND);
  triangle(40,40, 200,100, 90,200);
  triangle(460,40, 300,100, 410,200);

  // ear shadows
  fill(125);
  noStroke();
  triangle(40,40, 200,100, 125,150);
  triangle(460,40, 300,100, 375,150);

  // base circles for the head
  fill(100);
  noStroke();
  ellipse(width/2,(height/3)+50,350,350);

  // eye shadows
  fill(75);
  ellipse(175,230, 125,65);
  ellipse(325,230, 125,65);

  // shadows under the eyes
  noStroke();
  fill(90);
  ellipse(165,300, 100,150);
  ellipse(335,300, 100,150);

  // whitish-yellow inside the eyes
  fill(240,240,200);
  quad(110, 220, 190, 230, 220, 290, 130, 280);
  quad(390, 220, 310, 230, 280, 290, 370, 280);

  // pupils - moving part of the eyes

  // variables to allow the pupils to move
  int leftEyeX = int(map(mouseX, 0, width, 145, 175));
  int leftEyeY = int(map(mouseY, 0, height, 245, 265));

  noStroke();
  // green part
  fill(0,150,0);
  ellipse(leftEyeX, leftEyeY,45,45);
  ellipse(leftEyeX+180, leftEyeY,45,45);
  // black part
  fill(0);
  ellipse(leftEyeX, leftEyeY, 30,30);
  ellipse(leftEyeX+180, leftEyeY,30,30);
  // white highlight dots
  // (+10 pixel shift added on x and y axes because it looks nicer)
  fill(250);
  ellipse(leftEyeX+10, leftEyeY-10,10,10);
  ellipse(leftEyeX+190, leftEyeY-10,10,10);

  // eye outlines
  noFill();
  stroke(125);
  strokeWeight(12);
  strokeJoin(ROUND);
  quad(110, 220, 190, 230, 220, 290, 130, 280);
  quad(390, 220, 310, 230, 280, 290, 370, 280);

  // snout
  noStroke();
  fill(95);
  ellipse(225,410, 150,225);
  ellipse(275,410, 150,225);

  // stripe on nose
  fill(110);
  ellipse(width/2, 385, 115,215);

  // nose
  fill(25);
  ellipse(width/2,475, 100,50);
  fill(50);
  ellipse(width/2,465, 90, 30);
}



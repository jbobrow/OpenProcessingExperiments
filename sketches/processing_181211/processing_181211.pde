
float moonx = 100;
float moony = 20;

float smokex = 100;
float smokey = 150;

float bearx =50;

void setup()
{
  size(400, 350);
  frameRate (7);
}

void draw() {
  background(#423664);

  //stars
  stroke (255);
  strokeWeight (2);
  point (random (5, 395), random (50, 200));
  strokeWeight (2);
  point (random (5, 395), random (25, 200));

  //grtbear
  strokeWeight (3);
  stroke (255);
  point (bearx, 60);
  point (bearx +50, 50);
  point (bearx +100, 60);
  point (bearx+150, 60);
  point (bearx+220, 60);
  point (bearx+150, 110);
  point (bearx +215, 110);
  
  //moon
  strokeWeight (2);
  fill (255);
  ellipse (moonx, moony, 30, 30); 
  
  //land
  noStroke ();
  fill (50);
  rect (0, 300, width, 50);
  noFill();
  strokeWeight(random(30, 300));
  stroke(random(200, 255), random(200, 255), random(100, 180));

  float rainbow_size = random(800, 300);
  ellipse(150, 300, rainbow_size, rainbow_size);

  //house
  noStroke ();
  fill (#5D5BA7);
  rect (100, 250, 100, 50);
  rect (80, 240, 140, 10);
  rect (120, 230, 10, 20);

  //smoke
  fill (#C6BEBE);
  ellipse (105, 210, 10, 12);
  ellipse (120, 215, 10, 12);

  ellipse (smokex+20, smokey +10, 10, 30);
  ellipse (smokex, smokey, 15, 30);
  fill (#EAAF18);
  rect (120, 260, 15, 15);
  rect (140, 260, 15, 15);

  strokeWeight (3);  
  stroke (#EAAF18);
  line (202, 253, 202, 300);

  //light
  noStroke();
  fill (#8D8E45);
  triangle (202, 250, 202, 299, 230, 300);

  //me
  fill (0);
  ellipse (230, 290, 20, 45);
  ellipse (230, 270, 15, 22);

  //textBox
  fill(255);
  rect (0, 325, width, 25);

  strokeWeight (3);
  stroke (0);
  fill (0);
  text ("Ooooooohhh, Aurora borealis.", 5, 340);

  if (smokey  <  130)
  {
    smokey = 180;
  }
  moonx = moonx +0.2;
  moony = moony + 0.01;
  smokex = smokex - 0.09;
  smokey = smokey - 0.5;
  bearx = bearx + 0.5;
}


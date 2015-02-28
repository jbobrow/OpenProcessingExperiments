
// HW6 - Computing for the Arts with Processing
// Copyright 2012 Tony Zhang
// keyboard input: arrow keys to change speed/direction, spacebar to stop everything and reset bouncy ball position.
// if the background turns red, slow down!!

float tx, tx2, tx3, tx4, ty, ty2, ty3, ty4, ty5, ty6, td, txSpeed, tySpeed; //wrap variables
float bx, by, bd, bxSpeed, bySpeed; //bounce variables

color c1, c2;

void setup()
{
  size( 400, 400 ); 
  frameRate(60);
  smooth();

  //horizontal starting positions 
  tx = width*.125;
  tx2 = width*.375;
  tx3 = width*.625;
  tx4 = width*.875;

  //vertical starting positions
  ty = height*.875;
  ty2 = height*.625;
  ty3 = height*.375;
  ty4 = height*.125;

  //size of wrapping initials
  td = 30;

  //starting speed of wrapping initials
  txSpeed = 2;
  tySpeed = 0;

  //starting position of bouncy ball
  bx = width*.5;
  by = height*.5;

  //size of bouncy ball
  bd = 40;

  //starting speed of bouncy ball
  bxSpeed = 0;
  bySpeed = 0;

  //bouncy ball color
  c2 = color (random(255), random(255), random(255));
}

void draw()
{
  prepWindow(c1);

  drawInitials(tx, ty, td, td);
  drawInitials(tx, ty2, td, td);
  drawInitials(tx, ty3, td, td);
  drawInitials(tx, ty4, td, td);

  drawInitials(tx2, ty, td, td);
  drawInitials(tx2, ty2, td, td);
  drawInitials(tx2, ty3, td, td);
  drawInitials(tx2, ty4, td, td);

  drawInitials(tx3, ty, td, td);
  drawInitials(tx3, ty2, td, td);
  drawInitials(tx3, ty3, td, td);
  drawInitials(tx3, ty4, td, td);

  drawInitials(tx4, ty, td, td);
  drawInitials(tx4, ty2, td, td);
  drawInitials(tx4, ty3, td, td);
  drawInitials(tx4, ty4, td, td);

  wrapInitials();

  drawBouncyball(bx, by, bd, bd, c2);

  bounceBouncyball();
}

void prepWindow(color col)
{
  if ( txSpeed > 5 || tySpeed > 5 || txSpeed < -5 || tySpeed < -5) //changes background color if you go too fast! bouncy ball color also changes rapidly.
  {
    c1 = color (229, 30, 30);
    c2 = color (random(255), random(255), random(255));
  }
  else //safe speed background color
  {
    c1 = color (30, 74, 229);
  }

  fill(col, 40);
  rect(0, 0, width, height);
}

void bounceBouncyball()
{
  bx = bx + bxSpeed; //horizontal movement
  by = by + bySpeed; //vertical movement

  if ( bx + bd*.5 > width || bx < bd*.5 ) 
  {
    bxSpeed = -bxSpeed; //changes direction after hitting wall
  }
  if ( by + bd*.5 > height || by < bd*.5 ) 
  {
    bySpeed = -bySpeed; //changes direction after hitting wall
  }
}

void wrapInitials( )
{
  tx = tx  + txSpeed; //horizontal movement
  tx2 = tx2 + txSpeed;
  tx3 = tx3 + txSpeed;
  tx4 = tx4 + txSpeed;

  ty = ty + tySpeed; //vertical movement
  ty2 = ty2 + tySpeed;
  ty3 = ty3 + tySpeed;
  ty4 = ty4 + tySpeed;

  //begin horizontal wrapping!
  if ( tx > width + td)  
  {
    tx = -td;
  }
  if (tx < -td)
  {
    tx = width + td;
  }

  if ( tx2 > width + td )  
  {
    tx2 = -td;
  }
  if (tx2 < -td)
  {
    tx2 = width + td;
  }

  if ( tx3 > width + td ) 
  {
    tx3 = -td;
  }
  if (tx3 < -td)
  {
    tx3 = width + td;
  }

  if ( tx4 > width + td ) 
  {
    tx4 = -td;
  }
  if (tx4 < -td)
  {
    tx4 = width + td;
  }

  //begin vertical wrapping!
  if ( ty > height + td)
  {
    ty = -td;
  }
  if (ty < -td)
  {
    ty = height + td;
  }

  if ( ty2 > height + td )
  {
    ty2 = -td;
  }
  if (ty2 < -td)
  {
    ty2 = height + td;
  }

  if ( ty3 > height + td )
  {
    ty3 = -td;
  }
  if (ty3 < -td)
  {
    ty3 = height + td;
  }

  if ( ty4 > height + td )
  {
    ty4 = -td;
  }
  if (ty4 < -td)
  {
    ty4 = height + td;
  }
}

void keyPressed() //changes direction and speed
{
  if (keyCode == RIGHT) 
  {
    txSpeed++;
    bxSpeed++;
  } 
  if (keyCode == LEFT) 
  {
    txSpeed--;
    bxSpeed--;
  }
  if (keyCode == UP) 
  {
    tySpeed--;
    bySpeed--;
  }
  if (keyCode == DOWN)
  {
    tySpeed++;
    bySpeed++;
  }
  if (key == ' ') //stops everything and resets bouncy ball
  {
    txSpeed = 0;
    tySpeed = 0;
    bxSpeed = 0;
    bySpeed = 0;
    bx = width*.5;
    by = height*.5;
    c2 = color (random(255), random(255), random(255));
  }
}

void drawBouncyball(float ex, float ey, float ewd, float eht, color ecol)
{
  fill(ecol);
  noStroke();
  ellipse(ex, ey, ewd, eht);
  
  stroke(random(255), random(255), random(255));
  strokeWeight(1);
  line(width*.5, height*.5, ex, ey); //bouncy ball cord
  noStroke();
}

void drawInitials(float x, float y, float wd, float ht)
{
  //bright blue circle
  ellipseMode(CENTER);
  fill(82, 170, 227);
  noStroke();
  strokeWeight(.5);
  ellipse(x, y, wd*1.5, ht*1.5);

  //yellow with red stroke
  ellipseMode(CENTER);
  fill(255, 255, 188);
  stroke(200, 0, 0);
  strokeWeight(1);
  ellipse(x, y, wd, ht);

  //thin red
  ellipseMode(CENTER);
  noFill();
  stroke(200, 0, 0);
  strokeWeight(1);
  ellipse(x, y, wd*1.05, ht*1.05);

  //thin dark blue
  ellipseMode(CENTER);
  noFill();
  stroke(29, 50, 167);
  strokeWeight(1);
  ellipse(x, y, wd*1.48, ht*1.48);
  ellipse(x, y, wd*1.44, ht*1.44);

  //begin initials
  beginShape();
  //t cap
  stroke(250, 132, 35);
  strokeWeight(1);
  curveVertex(x, y+ht/10);
  curveVertex(x-wd/10, y);
  curveVertex(x-wd/4, y-ht/20);
  curveVertex(x-wd/2.4, y);
  curveVertex(x-wd/2.2, y+ht/10);
  endShape();

  beginShape();
  //t stem
  stroke(26, 69, 160);
  strokeWeight(1);
  curveVertex(x-wd/4, y-ht/10);
  curveVertex(x-wd/4, y);
  curveVertex(x-wd/4, y+ht/3.1);
  curveVertex(x-wd/4, y+ht/3);
  endShape();

  beginShape();
  //t stem pt.2
  stroke(200, 0, 0);
  strokeWeight(1);
  curveVertex(x-wd/5, y-ht/10);
  curveVertex(x-wd/5, y+ht/10);
  curveVertex(x-wd/5, y+ht/3.6);
  curveVertex(x-wd/5, y+ht/2);
  endShape();

  beginShape();
  //y top
  stroke(200, 0, 0);
  strokeWeight(1);
  curveVertex(x-wd/10, y-ht/2);
  curveVertex(x-wd/10, y-ht/3);
  curveVertex(x-wd/12, y-ht/7);
  curveVertex(x, y-ht/10);
  curveVertex(x+wd/12, y-ht/7);
  curveVertex(x+wd/10, y-ht/3);
  curveVertex(x+wd/10, y-ht/2);
  endShape();

  beginShape();
  //y stem
  stroke(26, 69, 160);
  strokeWeight(1);
  curveVertex(x, y-ht/1.5);
  curveVertex(x, y-ht/5);
  curveVertex(x, y+ht/2.5);
  curveVertex(x, y+ht/1.5);
  endShape();

  beginShape();
  //z middle
  stroke(200, 0, 0);
  strokeWeight(1);
  curveVertex(x+wd/2, y-ht/5);
  curveVertex(x+wd/2.7, y);
  curveVertex(x+wd/6.5, y+ht/6);
  curveVertex(x+wd/8, y+ht/3);
  curveVertex(x+wd/9, y+ht/2);
  endShape();

  beginShape();
  //z top
  stroke(250, 132, 35);
  strokeWeight(1);
  curveVertex(x, y+ht/10);
  curveVertex(x+wd/8, y);
  curveVertex(x+wd/2.7, y);
  curveVertex(x+wd/2, y+ht/10);
  endShape();

  beginShape();
  //z bottom
  stroke(26, 69, 160);
  strokeWeight(1);
  curveVertex(x, y+ht/3.3);
  curveVertex(x+wd/6, y+ht/3.3);
  curveVertex(x+wd/3.2, y+ht/3.3);
  curveVertex(x+wd/2, y+ht/3.3);
  endShape();
}



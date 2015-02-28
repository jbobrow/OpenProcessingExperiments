
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/70980*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Homework #6
// Hyunjook, 51-257
// Copyright 2012 Hyunjoo Kim

// Press and hold UP key to increase the speed of wrapping ball
// Press and hold DOWN key to decrease the speed of wrapping ball
// Press and hold ENTER key to increase the speed of bouncing ball
// Press and hold SHIFT key to increase the speed of bouncing ball

float bx, by, bdiam, bxSpeed, bySpeed; //bounce
float tx, ty, tdiam, txSpeed, tySpeed; //wrap

void setup()
{
  size(600, 400);
  frameRate(70);
  smooth();
  bx = width*.1;
  by = random(height);
  bdiam = 100;
  bxSpeed = 7;
  bySpeed = 7;
  
  tx = width/2;
  ty = random(height);
  tdiam = 30;
  txSpeed = 7;
  tySpeed = 7;
}

void draw()
{
  background(43,49,82);
  bounceInitials();
  wrapInitials();
  Initials(bx, by, bdiam);
  Initials(tx, ty, tdiam);
}

void bounceInitials()
{
  bx = bx + bxSpeed;
  by = by + bySpeed;
  
  if (bx + bdiam*.5 > width || bx < 0)
  {
    bxSpeed = -bxSpeed;
  }
  if (by + bdiam*.5 > height || by < 0)
  {
    bySpeed = -bySpeed;
  }
}

void wrapInitials()
{
  tx = tx + txSpeed; 
  ty = ty + tySpeed;
  
  if (tx > width + tdiam)
  {
    tx = 0;
  }
  if (tx < 0)
  {
    tx = width;
  }
  if (ty > height)
  {
    ty = 0;
  }
  if (ty < 0)
  {
    ty = height; 
  }
}

void keyPressed()
{
  if (keyCode == DOWN && txSpeed > 0 && tySpeed > 0) //decrease speed of wrap
  {
    txSpeed--;
    tySpeed--;
  }
  if (keyCode == UP) //increase speed of wrap
  {
    txSpeed++;
    tySpeed++;
  }
  if (keyCode == SHIFT && bxSpeed > 0 && bySpeed > 0) //decrease speed of bounce
  {
    bxSpeed--;
    bySpeed--;
  }
  if (keyCode == ENTER && bxSpeed > 0 && bySpeed > 0) //increase speed of bounce
  {
    bxSpeed++;
    bySpeed++;
  }
}

void Initials(float x, float y, float diam)
{
  // outer circle
  ellipseMode(CENTER);
  fill(210,240,245);
  noStroke( );
  ellipse (x, y, diam+80, diam+80);
 
  // inner circle
  ellipseMode(CENTER);
  fill(255);
  stroke(106,192,206);
  strokeWeight(20);
  ellipse (x, y, diam, diam);
 
  noFill();
  stroke(62,146,162);
  strokeWeight(15);
  beginShape( );
  curveVertex(x-(.23*diam), y-(.42*diam)); // control point
  curveVertex(x-(.25*diam), y-(.4*diam)); // top of h
  curveVertex(x-(.38*diam), y-(.25*diam));
  curveVertex(x-(.45*diam), y);
  curveVertex(x-(.38*diam), y+(.25*diam));
  curveVertex(x-(.25*diam), y+(.4*diam));
  curveVertex(x-(.23*diam), y+(.42*diam));
  endShape();
 
  beginShape( );
  curveVertex(x-(.55*diam), y+(.35*diam)); // control point
  curveVertex(x-(.45*diam), y+(.05*diam)); // right of h
  curveVertex(x-(.38*diam), y-(.10*diam));
  curveVertex(x-(.25*diam), y-(.13*diam));
  curveVertex(x-(.15*diam), y);
  curveVertex(x-(.18*diam), y+(.35*diam));
  curveVertex(x-(.05*diam), y+(.4*diam));
  endShape();
 
  noFill();
  stroke(69, 139, 191);
  strokeWeight(15);
  beginShape( );
  curveVertex(x, y-(.45*diam)); // Control point
  curveVertex(x, y-(.4*diam)); // j
  curveVertex(x+(.01*diam), y);
  curveVertex(x+(.01*diam), y+(.08*diam));
  curveVertex(x+(.01*diam), y+(.28*diam));
  curveVertex(x-(.05*diam), y+(.38*diam));
  curveVertex(x-(.15*diam), y+(.43*diam));
  curveVertex(x-(.19*diam), y+(.5*diam));
  endShape( );
 
  noFill();
  stroke(135, 95, 162);
  strokeWeight(15);
  beginShape();
  curveVertex(x+(.1*diam), y-(.5*diam)); // Control point
  curveVertex(x+(.1*diam), y-(.45*diam)); // left of k
  curveVertex(x+(.15*diam), y-(.20*diam));
  curveVertex(x+(.18*diam), y);
  curveVertex(x+(.15*diam), y+(.20*diam));
  curveVertex(x+(.1*diam), y+(.45*diam));
  curveVertex(x+(.1*diam), y+(.5*diam));
  endShape();
 
  beginShape();
  curveVertex(x+(.3*diam), y-(.28*diam)); // Control point
  curveVertex(x+(.35*diam), y-(.3*diam)); // right of k
  curveVertex(x+(.28*diam), y-(.10*diam));
  curveVertex(x+(.2*diam), y);
  curveVertex(x+(.28*diam), y+(.10*diam));
  curveVertex(x+(.35*diam), y+(.3*diam));
  curveVertex(x+(.3*diam), y+(.28*diam));
  endShape();
  
  //saveFrame("hw6.jpg");
}





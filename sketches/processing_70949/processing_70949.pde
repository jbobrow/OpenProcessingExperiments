
// Homework #5
// Hyunjook, 51-257
// Copyright 2012 Hyunjoo Kim

// Move initials around with the mouse
// Click the mouse to change the color of initials
// Press and hold up key to make the initials bigger 
// Press and hold down key to make the initials smaller

float x, y, diam;
color r, g, b, a, c;

void setup()
{
 size(500,500);
 smooth(); 
 diam = 100;
 
 r = color(210,240,245);
 g = color(106,192,206);
 b = color(62,146,162);
 a = color(69, 139, 191);
 c = color(135, 95, 162);
}

void draw()
{
  background(255);
  fill(r,g,b,a);
  drawInitials(mouseX, mouseY, diam);
}

void drawInitials(float x, float y, float diam)
{
  // outer circle
  ellipseMode(CENTER);
  fill(r);
  noStroke( );
  ellipse (x, y, diam+80, diam+80);
 
  // inner circle
  ellipseMode(CENTER);
  fill(255);
  stroke(g);
  strokeWeight(20);
  ellipse (x, y, diam, diam);
 
  noFill();
  stroke(b);
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
  stroke(a);
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
  stroke(c);
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
}

void keyPressed( )
{
  if (keyCode == UP)
  {
    diam = diam + 3;
    if (diam > 500){
      diam = 100;
  }
  }
  if (keyCode == DOWN)
  {
    diam = diam - 3;
    if (diam < 100){
      diam = 100;
  }
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    r = color (random(255), random(255), random(255));
    g = color (random(255), random(255), random(255));
    b = color (random(255), random(255), random(255));
    a = color (random(255), random(255), random(255));
  }
//saveFrame("hw5.jpg");
}


  
  
  
  
  




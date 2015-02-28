
//Homework 10
//copyright Jessica Schafer, pittsburgh PA
//Oct. 10, 2011

//sphere radius
float r;

//points
float x1, x2, y1, y2, y3, y4, y5, z1, z2, z3;

//colors
color darkblue = color (35, 51, 56);
color olive = color (91, 90, 20);
color mustard = color (197, 149, 46);
color peach = color (250, 171, 98);
color pink = color (250, 55, 67);

void setup()
{
  size (400, 400, P3D);

  y1 = .09*height;
  y2 = .2*height;
  y3 = .35*height;
  y4 = .4*height;
  y5 = .25*height;
  
  x1 = .12*width;
  x2 = .2*width;
  
  z1 = .1*width;
  z2 = .15*width;
  z3 = .2*width;
  
  r = .08*width;
}

void draw ()
{
 setScreen();
 drawLetter(); 
}

void drawLetter()
{
  drawLines();
  
  redSphere();
  yellowSphere();
  
  pushMatrix();
    translate (x1, y1, z1);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();
    translate (x2, y2, z2);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();
    translate (x1, y3, z1);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();  
    translate (0, y4, 0);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();  
    translate (-x1, y3, -z1);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();  
    translate (-x2, y5, -z3);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();
    translate (-x1, -y1, -z1);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();
    translate (-x2, -y2, -z3);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();
    translate (-x1, -y3, -z2);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();  
    translate (0, -y4, 0);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();  
    translate (x1, -y3, z2);
    redSphere();
    yellowSphere();
  popMatrix();
  
  pushMatrix();  
    translate (x2, -y5, z3);
    redSphere();
    yellowSphere();
  popMatrix();
}

void drawLines()
{
 stroke (peach, 175);
 strokeWeight(2);
 //bottom half of S
 line (x2, y2, z2, -x2, y5, -z3); 
 line (x1, y3, z1, -x2, y5, -z3);
 line (0, y4, 0, -x2, y5, -z3);
 line (x1, y1, x1, -x2, y5, -z3);
 line (0,0,0, -x2, y5, -z3);
 line (-x1, y3, -z1, -x2, y5, -z3);
 //top half of S
 line (0,0,0, x2, -y5, z3);
 line (-x1, -y1, -z1, x2, -y5, z3);
 line (-x2, -y2, -z3, x2, -y5, z3);
 line (-x1, -y3, -z2, x2, -y5, z3);
 line (0, -y4, 0, x2, -y5, z3);
 line (x1, -y3, z2, x2, -y5, z3);
 strokeWeight(1);
}

void redSphere()
{
  fill (darkblue, 200);
  stroke (peach, 25);
  sphereDetail (30);
  sphere (r);
}

void yellowSphere()
{
  fill (pink, 240);
  //box (r/2);
  stroke (pink, 25);
  sphereDetail(3);
  sphere (r/2);
}




void setScreen ()
{
  background (darkblue);
  lights();
  translate (width/2, height/2, 0);
}




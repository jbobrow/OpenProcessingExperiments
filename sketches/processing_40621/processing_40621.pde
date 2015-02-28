
//Homework 7
//Copyright Kinnari Thakker 2011, Pittsburgh 15224

float x,y,deltaX, deltaY, wd, ht, maxSpeed;
color col;

void setup()
{
  size (400,400);
  x = width/2;
  y = height/2;
  wd = 50;
  ht = 50;
  col = color(89,160,145,10); // for bg trail effect
  maxSpeed = 5; // slow so that its contrable
}

void draw()
{
  backgrounder();
  moveCircle();
  setSpeed();
  resetAll();
  speedMeter();
}

void backgrounder()
{
  noStroke();
  fill(col);
  rect(0,0,width,height);
}

void moveCircle()
{
  x = x + deltaX;
  if( x > width + wd/2) // too far right?
  {
    x = -wd/2;
  }
  if( x < -wd/2) // too far left?
  {
    x = width + wd/2;
  } 
  y = y + deltaY;
  if( y > height + ht/2) // too far down?
  {
    y = -ht/2;
  }
  if( y < -ht/2) // too far up?
  {
    y = height + ht/2;
  } 
  Initials(x,y,wd,ht);
}

void setSpeed()
{
  deltaX = map(mouseX,0,width,-maxSpeed,maxSpeed);
  deltaY = map(mouseY,0,height,-maxSpeed,maxSpeed);
}

void resetAll()
{
  if (keyPressed == true)
  {
    deltaX = 0;
    deltaY = 0;
    x = width/2;
    y = height/2;
    Initials(x,y,wd, ht);
  }
}

void speedMeter() {
  fill(89,160,145);
  noStroke();
  rect(0, height-50,width, 50);
  fill(0);
  text("Horizontal Speed:", 10, height-30);
  text("Vertical Speed:" , 10, height - 10);
  text(deltaX, 140, height - 30);
  text(deltaY,140, height - 10);
}


//_________________________________________________________

void Initials(float x, float yProc, float wd, float ht) //Setting up Initials
{

  fill(50,165,130);  // Bounding ellipse
  noStroke();
  ellipse(x,y,wd*.9, ht*.9);

  noFill();    // Initial strokes start here
  strokeWeight(4);
  strokeCap(SQUARE);
  stroke(164,211,151);



  //k
  beginShape();
  vertex(x-.3*wd, y+.3*ht);
  vertex(x-.3*wd,y-.3*ht);
  vertex(x-.3*wd,y+.05*ht);
  bezierVertex( x-.15*wd,y-.125*ht,    x-.1*wd,y-.02*ht,      x-.1*wd,y);
  bezierVertex(  x-.150*wd,y+.125*ht,  x-.3*wd,y+.075*ht,    x-.275*wd,y+.05*ht);
  bezierVertex(  x-.125*wd,y+.3*ht,  x-.125*wd,y+.3*ht,    x-.075*wd,y+.3*ht);
  endShape();

  //stem of the a
  //stroke(249,240,205);
  stroke(240,227,245);
  beginShape();
  vertex(x-.05*wd, y);
  //point(x-.05*wd, y-.05*ht);
  bezierVertex(  x+.125*wd,y-.15*ht,  x+.125*wd, y+.15*ht,  x+.125*wd,y+.15*ht);
  bezierVertex(  x+.125*wd,y+.3*ht,  x+.125*wd, y+.3*ht,  x+.175*wd,y+.3*ht);
  endShape();

  //round part of the a
  beginShape();
  vertex(x+.125*wd,y+.15*ht);
  bezierVertex(  x+.025*wd, y+.05*ht,  x-.05*wd, y+.1*ht, x-.05*wd,y+.2*ht );
  bezierVertex(  x-.05*wd, y+.325*ht,  x+.075*wd, y+.325*ht, x+.125*wd,y+.225*ht );
  endShape();

  //t
  stroke(222,191,67);
  beginShape();
  vertex(x+.225*wd,y-.15*ht);
  vertex(x+.225*wd, y+.25*ht);
  bezierVertex(  x+.225*wd,y+.3*ht,  x+.225*wd, y+.3*ht,  x+.275*wd,y+.3*ht);
  endShape();

  //crossing the t
  beginShape();
  vertex(x+.150*wd,y-.075*ht);
  vertex(x+.3*wd, y-.075*ht);
  endShape();
}



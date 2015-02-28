
//homework 7
//copyright Erica Gatts | September 2011 | Pittsburgh, PA 15214

float x, y, deltaX, deltaY, dia, fast, slow;
color col;

void setup()
{
  size(400, 400);
  x = width/2;
  y = height/2;
  deltaX = 2;
  deltaY = 2;
  col = color(200, 200, 0, 20);
  dia = 50; 
  fast = random(1.08, 1.1);
  slow = random(.9, .99);
}

void draw()
{
  prepScreen();
  drawInitials();
  goInitials();
  speedInitials();
  showSpeed();
  stopInitials();
  //saveFrame("hmwk7.jpg");
}

//start initials moving down and right
void goInitials()
{
  x = x + deltaX;
  y = y + deltaY;
  //too far right
  if (x > width + dia/2)
  {
    x = -dia/2;
  }
  //too far left
  if (x < - dia/2)
  {
    x = width + dia/2;
  }
  //too far down
  if (y > height + dia/2)
  {
    y = -dia/2;
  }
  //too far up
  if (y < -dia/2)
  {
    y = height + dia/2;
  }
}

//makes initials move faster and slower depending on mouse movement
void speedInitials()
{
  //if mouse moves right, intials speed up
  if (mouseX > pmouseX)
  {
    deltaX = deltaX + .1;
  }
  //if moves moves left, initials slow down
  if (mouseX < pmouseX)
  {
   deltaX = deltaX -.1;
  }
  //if mouse moves down, initials speed up
  if (mouseY > pmouseY)
  {
    deltaY = deltaY + .1;
  }
  //if mouse moves up, initials slow down
  if (mouseY < pmouseY)
  {
    deltaY = deltaY - .1;
  }
}

//sets up the background color
void prepScreen()
{
  fill(col);
  rect(0, 0, width, height);
}

//draw initials function which we are all too familiar with
void drawInitials()
{ 
  fill(255, 80);
  ellipse(x, y, dia, dia);
  strokeCap(ROUND);
  strokeWeight(1);
  stroke(0);
  beginShape(); 
  curveVertex(x-.12*dia, y-.49*dia);
  curveVertex(x-.1*dia, y-.5*dia);
  curveVertex(x-.05*dia, y-.51*dia); 
  curveVertex(x+.03*dia, y-.51*dia);
  curveVertex(x+.06*dia, y-.505*dia);
  endShape();
  strokeWeight(1);
  line(x-.08*dia, y-.505*dia, x-.08*dia, y+.48*dia);
  line(x-.1*dia, y-.49*dia, x-.1*dia, y+.48*dia);
  line(x-.49*dia, y+.15*dia, x+.09*dia, y-.11*dia); 
  line(x-.5*dia, y+.13*dia, x+.09*dia, y-.13*dia);
  beginShape(); 
  strokeWeight(1);
  curveVertex(x+.3*dia, y-.35*dia);
  curveVertex(x+.3*dia, y-.4*dia);
  curveVertex(x+.19*dia, y-.463*dia); 
  curveVertex(x+.045*dia, y-.5*dia);
  curveVertex(x+.001*dia, y-.5*dia);
  endShape();
  beginShape();
  line(x+.15*dia, y+.47*dia, x+.04*dia, y-.5*dia);
  strokeWeight(1);
  curveVertex(x+.5*dia, y-.4*dia); 
  curveVertex(x+.5*dia, y+.01*dia);  
  curveVertex(x+.4*dia, y+.3*dia);
  curveVertex(x+.15*dia, y+.48*dia); 
  curveVertex(x, y+.4*dia); 
  endShape();
  strokeWeight(1);
  line(x+.26*dia, y-.009*dia, x+.5*dia, y-.009*dia);
  line(x+.26*dia, y-.03*dia, x+.5*dia, y-.03*dia);
  noFill(); 
  stroke(0, 0, 0);
  strokeWeight(1);
  bezier(x-.12*dia, y-.49*dia, x-.65*dia, y-.26*dia, x-.65*dia, y+.278*dia, x-.1*dia, y+.485*dia);
  strokeWeight(1);
}

//displays speed of initials
void showSpeed()
{
  line(0, 380, 400, 380);
  text(slow + mouseX, 8, height-5);
}

//hit enter/return to stop initials moving and reset screen
void stopInitials()
{
  if (keyCode == ENTER)
  {
    x = width/2;
    y = width/2;
    deltaX = 0;
    deltaY = 0;
    background(200, 200, 0);
    rect(0, 0, width, height);
    fill(255);
    ellipse(x, y, dia, dia);
    drawInitials();
    line(0, 380, 400, 380);
    fill(255);
    text("0", 8, height-5);
  }
  //hit up button to restart the initials
  if (keyCode == UP)
  {
 speedInitials();
  }
}



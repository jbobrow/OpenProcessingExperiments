
//homework 4
//copyright Erica Gatts August 2011 Pittsburgh, PA 15214
//setting up my variables
float x, y, dia; 
color bcol, bcol2, ccol, ccol2;

void setup()
{
  size(400, 400);
  smooth();
  x = 200;
  y = 200;
  dia = 300;
  bcol = color(250, 101, 178);
  bcol2 = color(random(256), random(256), random(256));
  ccol = color(250, 175, 215);
  ccol2 = color(random(256), random(256), random(256));
}

void draw()
{
  //background color variable
  background(bcol);
  //this is my circumsribing ellipse
  noStroke();
  fill(ccol);
  ellipse(x, y, dia, dia); 
  //this is the top curve of my "A"
  strokeCap(ROUND);
  strokeWeight(10);
  stroke(137, 237, 31);
  beginShape(); 
  curveVertex(x-.12*dia, y-.49*dia);
  curveVertex(x-.1*dia, y-.5*dia);
  curveVertex(x-.05*dia, y-.51*dia); 
  curveVertex(x+.03*dia, y-.51*dia);
  curveVertex(x+.06*dia, y-.505*dia);
  endShape();
  //these are the legs of my "A"
  strokeWeight(3);
  line(x-.08*dia, y-.505*dia, x-.08*dia, y+.48*dia);
  line(x-.1*dia, y-.49*dia, x-.1*dia, y+.48*dia);
  //these are the middle lines of the "E"
  line(x-.49*dia, y+.15*dia, x+.09*dia, y-.11*dia); 
  line(x-.5*dia, y+.13*dia, x+.09*dia, y-.13*dia);
  //this is the top curve of my "G"
  beginShape(); 
  stroke(255, 57, 3);
  strokeWeight(10);
  curveVertex(x+.3*dia, y-.35*dia);
  curveVertex(x+.3*dia, y-.4*dia);
  curveVertex(x+.19*dia, y-.463*dia); 
  curveVertex(x+.045*dia, y-.5*dia);
  curveVertex(x+.001*dia, y-.5*dia);
  endShape();
  //this is the bottom curve of my "G"
  beginShape();
  line(x+.15*dia, y+.47*dia, x+.04*dia, y-.5*dia);
  strokeWeight(10);
  curveVertex(x+.5*dia, y-.4*dia); 
  curveVertex(x+.5*dia, y+.01*dia);  
  curveVertex(x+.4*dia, y+.3*dia);
  curveVertex(x+.15*dia, y+.48*dia); 
  curveVertex(x, y+.4*dia); 
  endShape();
  //and the middle lines of my "G"
  stroke(255, 57, 3);
  strokeWeight(3);
  line(x+.26*dia, y-.009*dia, x+.5*dia, y-.009*dia);
  line(x+.26*dia, y-.03*dia, x+.5*dia, y-.03*dia);
  //this is my "E" curve (drawn last, to be on top of the other letters)
  noFill(); 
  stroke(0, 0, 0);
  strokeWeight(10);
  bezier(x-.12*dia, y-.49*dia, x-.65*dia, y-.26*dia, x-.65*dia, y+.278*dia, x-.1*dia, y+.485*dia);
  strokeWeight(2);
}

//now for the interaction! arrow keys to make initials move left & right, up & down
void keyPressed()
{
  if (keyCode == UP)
  {
    y = y - 10;
  }
  if (keyCode == DOWN)
  {
    y = y + 10;
  }
  if (keyCode == RIGHT)
  {
    x = x + 10;
  }
  if (keyCode == LEFT)
  {
    x = x - 10;
  }
  if (keyCode == ENTER)
  {
    x = 200;
    y = 200;
    dia = 300;
  }
}
//when the mouse is clicked the background color changes
void mouseClicked() 
{
  if (bcol == bcol)
  {
    bcol = bcol2;
  } 
  else if (bcol2 == bcol2);
  {
    bcol2 = color(random(256), random(256), random(256));
  }
}
//when the mouse is released, the initials scale up
//and the circumscribing ellipse color changes
void mouseReleased()
{
  if (ccol == ccol) 
  {
    ccol = ccol2;
    dia = dia + 50;
  } 
  else if (ccol2 == ccol2);
  {
    ccol = color(random(256), random(256), random(256));
  }
}
//drag the mouse, and the initials drag with it
void mouseDragged() 
{
  if (x == x) 
  {
    x = mouseX;
  }
  if (y == y)
  {
    y = mouseY;
  }
  else if (dia == dia)
  {
    dia = mouseX + mouseY;
  }
  //saveFrame("hmwk4.jpg");
}



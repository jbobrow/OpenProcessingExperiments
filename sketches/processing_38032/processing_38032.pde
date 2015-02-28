
//homework 6
//copyright Erica Gatts September 2011 Pittsburgh, PA 15214

float x, y, x2, y2, x0, y0, dia, midX, midY, dia2, l1, l2;
color col1, col2, col3;

void setup()
{
  size(400, 400);
  background(255, 159, 3);
  smooth();
  x = 0;
  y = 0;
  x2 = 380;
  y2 = 20;
  x0 = 20;
  y0 = 20;
  dia = 20;
  midX = 200;
  midY = 200;
  dia2 = 250;
  col1 = color(255, 230, 70);
  l1 = 7;
  l2 = 2;
}

void draw()
{
  //this uses variables and constants to draw intials along top & bottom of the screen
  while (x < width - x0 && y < height - y0)
  {
    x = x + 20;
    y = y + 20;
    drawInitials(x, y0, dia);
    drawInitials(x, height-y0, dia);
    drawInitials(x0, y, dia);
    drawInitials(width - x0, y, dia);
    drawInitials(x, y, dia);
    drawInitials(x2, y2, dia);
    x2 = x2 -20;
    y2 = y2 + 20;
    print("loop1");
  }
  //this uses another drawInitials funtion with more variables to change the lineweights
  drawInitials(midX, midY, dia2, l1, l2);
  noStroke();
  fill(col1, 10); 
  ellipse(midX, midY, dia2, dia2);
  //saveFrame("hmwk_6.jpg");
}

void drawInitials(float x, float y, float dia)
{ 
  //this is the top curve of my "A"
  strokeCap(ROUND);
  strokeWeight(5);
  stroke(137, 237, 31);
  beginShape(); 
  curveVertex(x-.12*dia, y-.49*dia);
  curveVertex(x-.1*dia, y-.5*dia);
  curveVertex(x-.05*dia, y-.51*dia); 
  curveVertex(x+.03*dia, y-.51*dia);
  curveVertex(x+.06*dia, y-.505*dia);
  endShape();
  //these are the legs of my "A"
  strokeWeight(.25);
  line(x-.08*dia, y-.505*dia, x-.08*dia, y+.48*dia);
  line(x-.1*dia, y-.49*dia, x-.1*dia, y+.48*dia);
  //these are the middle lines of the "E"
  line(x-.49*dia, y+.15*dia, x+.09*dia, y-.11*dia); 
  line(x-.5*dia, y+.13*dia, x+.09*dia, y-.13*dia);
  //this is the top curve of my "G"
  beginShape(); 
  stroke(255, 57, 3);
  strokeWeight(1);
  curveVertex(x+.3*dia, y-.35*dia);
  curveVertex(x+.3*dia, y-.4*dia);
  curveVertex(x+.19*dia, y-.463*dia); 
  curveVertex(x+.045*dia, y-.5*dia);
  curveVertex(x+.001*dia, y-.5*dia);
  endShape();
  //this is the bottom curve of my "G"
  beginShape();
  line(x+.15*dia, y+.47*dia, x+.04*dia, y-.5*dia);
  strokeWeight(1);
  curveVertex(x+.5*dia, y-.4*dia); 
  curveVertex(x+.5*dia, y+.01*dia);  
  curveVertex(x+.4*dia, y+.3*dia);
  curveVertex(x+.15*dia, y+.48*dia); 
  curveVertex(x, y+.4*dia); 
  endShape();
  //and the middle lines of my "G"
  stroke(255, 57, 3);
  strokeWeight(.25);
  line(x+.26*dia, y-.009*dia, x+.5*dia, y-.009*dia);
  line(x+.26*dia, y-.03*dia, x+.5*dia, y-.03*dia);
  //this is my "E" curve (drawn last, to be on top of the other letters)
  noFill(); 
  stroke(0, 0, 0);
  strokeWeight(1);
  bezier(x-.12*dia, y-.49*dia, x-.65*dia, y-.26*dia, x-.65*dia, y+.278*dia, x-.1*dia, y+.485*dia);
  strokeWeight(1);
}

//this additional drawInitials function changes the lineweights with 2 variables
void drawInitials(float x, float y, float dia, float l1, float l2)
{ 
  //this is the top curve of my "A"
  strokeCap(ROUND);
  strokeWeight(l1);
  stroke(70, 180, 44);
  beginShape(); 
  curveVertex(x-.12*dia, y-.49*dia);
  curveVertex(x-.1*dia, y-.5*dia);
  curveVertex(x-.05*dia, y-.51*dia); 
  curveVertex(x+.03*dia, y-.51*dia);
  curveVertex(x+.06*dia, y-.505*dia);
  endShape();
  //these are the legs of my "A"
  strokeWeight(l2);
  line(x-.08*dia, y-.505*dia, x-.08*dia, y+.48*dia);
  line(x-.1*dia, y-.49*dia, x-.1*dia, y+.48*dia);
  //these are the middle lines of the "E"
  line(x-.49*dia, y+.15*dia, x+.09*dia, y-.11*dia); 
  line(x-.5*dia, y+.13*dia, x+.09*dia, y-.13*dia);
  //this is the top curve of my "G"
  beginShape(); 
  stroke(255, 57, 3);
  strokeWeight(l1);
  curveVertex(x+.3*dia, y-.35*dia);
  curveVertex(x+.3*dia, y-.4*dia);
  curveVertex(x+.19*dia, y-.463*dia); 
  curveVertex(x+.045*dia, y-.5*dia);
  curveVertex(x+.001*dia, y-.5*dia);
  endShape();
  //this is the bottom curve of my "G"
  beginShape();
  line(x+.15*dia, y+.47*dia, x+.04*dia, y-.5*dia);
  strokeWeight(l1);
  curveVertex(x+.5*dia, y-.4*dia); 
  curveVertex(x+.5*dia, y+.01*dia);  
  curveVertex(x+.4*dia, y+.3*dia);
  curveVertex(x+.15*dia, y+.48*dia); 
  curveVertex(x, y+.4*dia); 
  endShape();
  //and the middle lines of my "G"
  stroke(255, 57, 3);
  strokeWeight(l2);
  line(x+.26*dia, y-.009*dia, x+.5*dia, y-.009*dia);
  line(x+.26*dia, y-.03*dia, x+.5*dia, y-.03*dia);
  //this is my "E" curve (drawn last, to be on top of the other letters)
  noFill(); 
  stroke(0, 0, 0);
  strokeWeight(l1);
  bezier(x-.12*dia, y-.49*dia, x-.65*dia, y-.26*dia, x-.65*dia, y+.278*dia, x-.1*dia, y+.485*dia);
}



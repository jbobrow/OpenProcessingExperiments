
// hw5
// Copyright Melissa Mak, September 2013, Pittsburgh, PA

float x, y, wd, ht;
color col;

void setup()
{
  size (400, 400);
  background(255);
  smooth();
  col = color(random(255), random(255), random(255));
  wd = width/3;
  ht = height/3;
}

void draw()
{
}

void mousePressed()
{
  col = color(random(255), random(255), random(255));
  stroke(col);
  figure(mouseX, mouseY, wd, ht);
  mustache(mouseX, mouseY, wd, ht);
  glasses(mouseX, mouseY, wd, ht);
  
  if (keyPressed)
  {
    if (key == 'f')
    {
      col = color(random(255), random(255), random(255));
      stroke(col);
      figure(mouseX, mouseY, wd, ht);
      mustache(mouseX, mouseY, wd, ht);
    }
  }
}

void keyPressed()
{
if (key == ' ')
    {
      background(255);
    }
}
    
void figure( float x, float y, float wd, float ht )  // defining Jim
{   
  // head
  fill(252, 246, 235);
  ellipse (x, y, wd, ht);
  
  // hair
  stroke(col);
  strokeWeight(5);
  line(x, y - (ht * .49), x, y - (ht * .4));
  line(x - (wd * .15), y - (ht * .47), x - (wd * .15), y - (ht * .4));
  line(x + (wd * .15), y - (ht * .47), x + (wd * .15), y - (ht * .4));
  
  // head outline
  noFill();
  strokeWeight(3);
  ellipse (x, y, wd, ht);
  
  // eyes
  stroke(147, 119, 108);
  strokeWeight(10);
  point(x - (wd * .2), y - (ht * .08));
  point(x + (wd * .2), y - (ht * .08));
  
  // eyebrows
  stroke(200);
  strokeWeight(20);
  line(x - (wd * .3), y - (ht * .15), x - (wd * .12), y - (ht * .15));
  line(x + (wd * .3), y - (ht * .15), x + (wd * .12), y - (ht * .15));
  
}

void mustache( float x, float y, float wd, float ht ) 
{
  fill(col);
  noStroke();
    triangle(x - (wd * .32), y + (ht * .28), x - (wd * .125), y + (ht * .12), x + (wd * .32), y + (ht * .28));
    triangle(x - (wd * .28), y + (ht * .28), x + (wd * .125), y + (ht * .12), x + (wd * .32), y + (ht * .28));
    stroke(252, 246, 235);
    strokeWeight(2.5);
    line(x - (wd * .25), y + (ht * .28), x - (wd * .25), y + (ht * .22));
    line(x - (wd * .15), y + (ht * .28), x - (wd * .15), y + (ht * .1));
    line(x - (wd * .05), y + (ht * .28), x - (wd * .05), y + (ht * .1));
    line(x + (wd * .05), y + (ht * .28), x + (wd * .05), y + (ht * .1));
    line(x + (wd * .15), y + (ht * .28), x + (wd * .15), y + (ht * .1));
    line(x + (wd * .25), y + (ht * .28), x + (wd * .25), y + (ht * .22));
}

void glasses (float x, float y, float wd, float ht)
{
  // left lens
  stroke(col);
  strokeWeight(4);
  fill(240, 255, 254, 125);
  beginShape();
    curveVertex(x, y - (ht * .5)); // reference point
    curveVertex(x - (wd * .05), y - (ht * .15));
    curveVertex(x - (wd * .12), y + (ht * .01));
    curveVertex(x - (wd * .3), y + (ht * .01));
    curveVertex(x - (wd * .37), y - (ht * .15));
    curveVertex(x - (wd * .42), y - (ht * .5)); // reference point
  endShape();
  
  // right lens
  beginShape();
    curveVertex(x, y - (ht * .5)); // reference point
    curveVertex(x + (wd * .05), y - (ht * .15));
    curveVertex(x + (wd * .12), y + (ht * .01));
    curveVertex(x + (wd * .3), y + (ht * .01));
    curveVertex(x + (wd * .37), y - (ht * .15));
    curveVertex(x + (wd * .42), y - (ht * .5)); // reference point
  endShape();
  
  // glasses
  line(x - (wd * .5), y - (ht * .15), x + (wd * .5), y - (ht * .15));
}




// Homework 5, 01-29-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu January 2013 Pittsburgh PA 15232

//Completely close the card and open it again to change the color of the heart. Press any key to change background color.

float a, b, c, d, e, f, g, h; //figure 1 the book
float x, y; //mouse position
float colr, colg, colb, bg; //colors

void setup()
{
  size(400, 400);
  smooth();
  a = 200;
  b = 100;
  c = 350;
  d = 100;
  e = 350;
  f = 300;
  g = 200;
  h = 300;
  colr = 255;
  colg = 0;
  colb = 0;
  bg = 0;
}

void draw()
{
  background(bg);
  
  //the book (right part)
  figure(a, b, c, d, e, f, g, h);
  
  //the heart
  noStroke();
  fill(colr, colg, colb);
  heart(275, 215, 195, 205, 275, 240, 315, 235);
  if(pmouseX>350)
  {
    colr = random(50, 255);
    colg = random(50, 255);
    colb = random(50, 255);
  }
  
  //the book (left part)
  figure(a, b, x, y, x, y+200, g, h);
  if(mouseX > (width-e) && mouseX < e)
  {
    x = mouseX;
  }
    else if(mouseX< (width-e))
    {
      x = width-e;
    }
      else
      {
        x = e;
      }
  if(mouseY> (width-h)*.5 && mouseY< (height-b*2))
  {
    y = mouseY;
  }
    else if(mouseY< (width-h)*.5)
    {
      y = (width-h)*.5;
    }
      else
      {
        y = height-b*2;
      }
}

//function for the book
void figure(float fa, float fb, float fc, float fd, float fe, float ff, float fg, float fh)
{
  strokeWeight(3);
  stroke(200);
  fill(255);  
  quad (fa, fb, fc, fd, fe, ff, fg, fh);
}

//function for the heart
void heart(float ha, float hb, float hc, float hd, float he, float hf, float hg, float hh)
{
  beginShape();
    vertex(ha, hb); 
    bezierVertex(ha, hc, hg, hd, he, hf); 
    vertex(ha, hb); 
    bezierVertex(ha, hc, hh, hd, he, hf); 
  endShape();
}

//change color of background
void keyPressed()
{
  bg = random(0, 255);
}

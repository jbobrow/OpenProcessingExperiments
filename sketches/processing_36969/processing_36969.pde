
//homework 4
//copyright Jessica Schafer, Sept. 2011, pittsburgh, pa

float x,y, d, c, ds;

void setup ()
{
  size(400,400);
  smooth();
  //background (255,250,162);
  x=200;
  y=200;
  d=200;
  c=0;
  //saveFrame("hw4.jpg");
}

void draw ()
{
 background (255,250,162);
 ds = dist(200,200, mouseX, mouseY);


//CIRCLE
noStroke();
fill(217,c,94);
ellipse (x, y, d, d);
noFill();

//HIGHLIGHT
strokeWeight (.05*d);
//S highlight
stroke (255,213,107); 
beginShape();
//first anchor point
vertex (x+.35*d, y-.15*d);
//beziers (control, control, anchor);
  bezierVertex (x+.425*d, y-.4*d,  x, y-.4*d,  x, y-.2*d);
  bezierVertex (x,y, x+.4*d,y, x+.4*d, y+.2*d);
  bezierVertex (x+.4*d, y+.4*d, x-.025*d, y+.4*d, x+.05*d, y+.15*d);
endShape();
//J highlight
beginShape();
  vertex (x-.35*d, y-.15*d);
  bezierVertex (x-.365*d, y-.275*d, x-.15*d, y-.375*d, x-.15*d, y-.32*d);
  vertex (x-.05*d, y+.2*d);
  bezierVertex (x-.05*d, y+.4*d, x-.45*d, y+.4*d, x-.4*d, y+.15*d);
endShape();
//H highlight
beginShape();
  vertex (x-.02*d, y-.05*d);
  bezierVertex (x-.05*d, y-.04*d, x-.05*d, y+.04*d, x-.02*d, y+.05*d);
endShape();
beginShape();
  vertex (x+.025*d, y-.05*d);
  bezierVertex (x+.055*d, y-.04*d, x+.055*d, y+.04*d, x+.025*d, y+.05*d);
endShape();
line (x-.03*d, y, x+.03*d, y);

//MAIN LETTERS
strokeWeight (.025*d);
//S
stroke (255,105,79); 
beginShape();
//first anchor point
vertex (x+.35*d, y-.15*d);
//beziers (control, control, anchor);
  bezierVertex (x+.425*d, y-.4*d,  x, y-.4*d,  x, y-.2*d);
  bezierVertex (x,y, x+.4*d,y, x+.4*d, y+.2*d);
  bezierVertex (x+.4*d, y+.4*d, x-.025*d, y+.4*d, x+.05*d, y+.15*d);
endShape();
//J
beginShape();
  vertex (x-.35*d, y-.15*d);
  bezierVertex (x-.365*d, y-.275*d, x-.15*d, y-.375*d, x-.15*d, y-.32*d);
  vertex (x-.05*d, y+.2*d);
  bezierVertex (x-.05*d, y+.4*d, x-.45*d, y+.4*d, x-.4*d, y+.15*d);
endShape();
//H
beginShape();
  vertex (x-.02*d, y-.05*d);
  bezierVertex (x-.05*d, y-.04*d, x-.05*d, y+.04*d, x-.02*d, y+.05*d);
endShape();
beginShape();
  vertex (x+.025*d, y-.05*d);
  bezierVertex (x+.055*d, y-.04*d, x+.055*d, y+.04*d, x+.025*d, y+.05*d);
endShape();
line (x-.03*d, y, x+.03*d, y);
}

void keyPressed ()
{
  if (keyCode == UP)
  {
   d = d+10; 
  }
  else if (keyCode == DOWN)
  {
    d=d-10;
  }
  else if (keyCode == TAB)
  {
    x=x+20;
  }
  else if (keyCode == DELETE)
  {x = x-20;
  }
}

void mouseDragged ()
{
  c = mouseY/2;
  
  if (ds >= 200)
    { 
    x=200;
    y=200;
    }
  else
    {
    x=mouseX;
    y=mouseY;
    }
}




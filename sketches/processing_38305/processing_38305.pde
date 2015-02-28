

//homework 7
//Caroline Record Pittsburgh PA September 20, 2011
float xpos, ypos, xspeed, edge, dia, yspeed, cFill;

void setup()
{
  size (600, 600);
  textSize(24);
  xspeed= 1;
  yspeed= 1;
  dia= 50;
}

void draw()
{
  background(255,80);
  stamp();
  info();
  moveStamp();
  returntoCenter();
}

void returntoCenter()
{
  if (keyPressed)
  {
    xpos=width/2;
    ypos=height/2;
  }
}


void mouseMoved()
{
  float dx= mouseX-pmouseX;
  dx= map(mouseX, 0, width, -5, 5);
  xspeed=dx;
  float dy= mouseY-pmouseY;
  dy= map(mouseY, 0, height, -5, 5);
  yspeed=dy;
}

void moveStamp()
{
  xpos= xpos+ xspeed;
  if (xpos > width+ dia/2)
  {
    xpos= -dia/2;
  }
  if (xpos<-dia/2)
  {
    xpos=width+dia/2;
  }
  ypos=ypos+ yspeed;

  if (ypos > width+ dia/2)
  {
    ypos= -dia/2;
  }
  if (ypos<-dia/2)
  {
    ypos=width+dia/2;
  }
}

void info()
{
  fill (0);
  text ("vertical speed"+ yspeed, 50, 580);
  text ("horizontal speed"+ xspeed, 50, 545);
}

void stamp ()
{
  float x, y, wd, ht;
  x=xpos;
  y=ypos;
  wd=dia;
  ht=dia;
  //circle
  stroke (247, 22, 22, 98);
  fill(#FAFAFA);
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(x, y, wd, ht);
  //settings for all the letters
  noFill();
  smooth();
  strokeCap(SQUARE);
  //curve for the C
  beginShape();
  curveVertex(x-.1*wd, y-.2*ht);
  curveVertex(x-.15*wd, y-.35*ht);
  curveVertex(x-.4*wd, y-.15*ht);
  curveVertex(x-.4*wd, y+.15*ht);
  curveVertex(x-.15*wd, y+.35*ht);
  curveVertex(x-.1*wd, y+.2*ht);
  endShape();
  //curves for the B
  beginShape();
  curveVertex(x-.1*wd, y-.35*ht);
  curveVertex(x-.05*wd, y-.35*ht);
  curveVertex(x+.1*wd, y-.27*ht);
  curveVertex(x+.1*wd, y-.08*ht);
  curveVertex(x-.05*wd, y);
  curveVertex(x-.1*wd, y);
  endShape();
  beginShape();
  curveVertex(x-.1*wd, y);
  curveVertex(x-.05*wd, y);
  curveVertex(x+.1*wd, y+.08*ht);
  curveVertex(x+.1*wd, y+.27*ht);
  curveVertex(x-.05*wd, y+.35*ht);
  curveVertex(x-.1*wd, y+.35*ht);
  endShape();
  //curve for the R
  beginShape();
  curveVertex(x+.1*wd, y-.35*ht);
  curveVertex(x+.2*wd, y-.35*ht);
  curveVertex(x+.35*wd, y-.27*ht);
  curveVertex(x+.35*wd, y-.08*ht);
  curveVertex(x+.2*wd, y);
  curveVertex(x+.1*wd, y);
  endShape();
  //lines
  line(x-.05*wd, y-.35*ht, x-.05*wd, y+.35*ht);
  line(x+.2*wd, y-.35*ht, x+.2*wd, y+.35*ht);
  line(x+.2*wd, y, x+.35*wd, y+.25*ht);
  // new color

  float e, r, wt, hd;
  e=x+2;
  r=y-3;
  wt=wd+2;
  hd=ht+3;

  stroke (17, 209, 204, 98);
  noFill();
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(e, r, wt, hd);
  beginShape();
  curveVertex(e-.1*wt, r-.2*hd);
  curveVertex(e-.15*wt, r-.35*hd);
  curveVertex(e-.4*wt, r-.15*hd);
  curveVertex(e-.4*wt, r+.15*hd);
  curveVertex(e-.15*wt, r+.35*hd);
  curveVertex(e-.1*wt, r+.2*hd);
  endShape();
  //curves for the B
  beginShape();
  curveVertex(e-.1*wt, r-.35*hd);
  curveVertex(e-.05*wt, r-.35*hd);
  curveVertex(e+.1*wt, r-.27*hd);
  curveVertex(e+.1*wt, r-.08*hd);
  curveVertex(e-.05*wt, r);
  curveVertex(e-.1*wt, r);
  endShape();
  beginShape();
  curveVertex(e-.1*wt, r);
  curveVertex(e-.05*wt, r);
  curveVertex(e+.1*wt, r+.08*hd);
  curveVertex(e+.1*wt, r+.27*hd);
  curveVertex(e-.05*wt, r+.35*hd);
  curveVertex(e-.1*wt, r+.35*hd);
  endShape();
  //curve for the R
  beginShape();
  curveVertex(e+.1*wt, r-.35*hd);
  curveVertex(e+.2*wt, r-.35*hd);
  curveVertex(e+.35*wt, r-.27*hd);
  curveVertex(e+.35*wt, r-.08*hd);
  curveVertex(e+.2*wt, r);
  curveVertex(e+.1*wt, r);
  endShape();
  //lines
  line(e-.05*wt, r-.35*hd, e-.05*wt, r+.35*hd);
  line(e+.2*wt, r-.35*hd, e+.2*wt, r+.35*hd);
  line(e+.2*wt, r, e+.35*wt, r+.25*hd);

  float h, u, it, od;
  h=x+3;
  u=y+7;
  it=wd-4;
  od=ht;

  stroke (#D9FA0D, 99);
  noFill();
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(h, u, it, od);
  noFill();
  beginShape();
  curveVertex(h-.1*it, u-.2*od);
  curveVertex(h-.15*it, u-.35*od);
  curveVertex(h-.4*it, u-.15*od);
  curveVertex(h-.4*it, u+.15*od);
  curveVertex(h-.15*it, u+.35*od);
  curveVertex(h-.1*it, u+.2*od);
  endShape();
  //curves for the B
  beginShape();
  curveVertex(h-.1*it, u-.35*od);
  curveVertex(h-.05*it, u-.35*od);
  curveVertex(h+.1*it, u-.27*od);
  curveVertex(h+.1*it, u-.08*od);
  curveVertex(h-.05*it, u);
  curveVertex(h-.1*it, u);
  endShape();
  beginShape();
  curveVertex(h-.1*it, u);
  curveVertex(h-.05*it, u);
  curveVertex(h+.1*it, u+.08*od);
  curveVertex(h+.1*it, u+.27*od);
  curveVertex(h-.05*it, u+.35*od);
  curveVertex(h-.1*it, u+.35*od);
  endShape();
  //curve for the R
  beginShape();
  curveVertex(h+.1*it, u-.35*od);
  curveVertex(h+.2*it, u-.35*od);
  curveVertex(h+.35*it, u-.27*od);
  curveVertex(h+.35*it, u-.08*od);
  curveVertex(h+.2*it, u);
  curveVertex(h+.1*it, u);
  endShape();
  //lines
  line(h-.05*it, u-.35*hd, h-.05*wt, u+.35*hd);
  line(h+.2*it, u-.35*hd, h+.2*wt, u+.35*hd);
  line(h+.2*it, u, h+.35*it, u+.25*hd);
}

                
                                                

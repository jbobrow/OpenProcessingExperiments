
//homework 4
// copyright Caroline Record September 8 2011 pittsburgh PA

//Directions:
//to move the initials to the left or to the right use the left and right arrow buttons.
//to make the initials bigger or smaller use the up and down arrow keys.
//to change the color, click the mouse.

float x, y, wd, ht;
float e, r, wt, hd;
float h, u, it, od;
color  gr, re, ye;
void setup()
{
  size ( 400, 400) ;

  //variables

  x=200;
  y=200;
  wd=384;
  ht=384;


  e=x+2;
  r=y-3;
  wt=wd+2;
  hd=ht+3;


  h=x+3;
  u=y+7;
  it=wd-4;
  od=ht;

  //color variables 
  re=color(247, 22, 22);
  gr=color(17, 209, 204);
  ye=color(217, 250, 13);
}

void draw()
{
  //circle
  stroke (re, 98);
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



  stroke (gr, 98);
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



  stroke (ye, 99);
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

void keyPressed () {
  if (keyCode ==RIGHT) {
    x=x+5;

    e=x+2;
    r=y-3;
    wt=wd+2;
    hd=ht+3;


    h=x+3;
    u=y+7;
    it=wd-4;
    od=ht;
  }
  else if (keyCode==UP) {
    wd=wd-5;
    ht=ht-5;

    e=x+2;
    r=y-3;
    wt=wd+2;
    hd=ht+3;
    h=x+3;
    u=y+7;
    it=wd-4;
    od=ht;
  }
  else if (keyCode==DOWN) {
    wd=wd+5;
    ht=ht+5;

    e=x+2;
    r=y-3;
    wt=wd+2;
    hd=ht+3;

    h=x+3;
    u=y+7;
    it=wd-4;
    od=ht;
  }
  else if (keyCode ==LEFT) {
    x=x-5;
    e=x+2;
    r=y-3;
    wt=wd+2;
    hd=ht+3;


    h=x+3;
    u=y+7;
    it=wd-4;
    od=ht;
  }
}
void mousePressed() {
  re=color(random(255), random(255), random(255));
  gr=color(random(255), random(255), random(255));
  ye=color(random(255), random(255), random(255));
}
                    

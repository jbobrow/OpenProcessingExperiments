
     
       //homework 6
//Copyright Caroline Record PA pittsburgh setember 15, 2011

float xPos;
float yPos;
float amplitude;
int f=15;
int g=400-15;

void setup() {


  size ( 400, 400) ;
}

void draw()
{
    float centerX = 200;
  float amplitudeX = 100.0 ;
  float amplitudeY = 100.0 ;
  float periodX = 0.003;
  float periodY = .0007 ;
  
  
  xPos = centerX + amplitudeX  * sin(millis()*periodX-1);
  yPos = centerX + amplitudeY  * cos(millis()*periodY);
  
  initials(xPos, yPos, 30, 30, color (#E85252), color (#E7EA39), color (#39EACB));
  
  while (f<400)
  {
    initials(f, f, 30, 30, color (#E85252), color (#E7EA39), color (#39EACB));
   initials(width-f, f, 30, 30, color (#E85252), color (#E7EA39), color (#39EACB));
   f=f+40;  
  }
}

void initials(float x, float y, float wd, float ht, color re, color gr, color ye)
{
  float e, r, wt, hd;
  float h, u, it, od;

  e=x+2;
  r=y-3;
  wt=wd+2;
  hd=ht+3;


  h=x+3;
  u=y+7;
  it=wd-4;
  od=ht;

  //color variables
  /*
  re=color(ref);
   gr=color(g);
   ye=color(b);
   */
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
         

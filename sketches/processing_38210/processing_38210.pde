
// homework 6
// copyright EMILY SO

float doh = 250;
float reh = 230;
float mih = 430;
float fah = 120;

void setup() {
  size (500 , 500);
  smooth();
  frameRate(2);
}

void draw() {
  background(random(255), random(255), random(255));
  doh = 250;
  reh = 230;
  mih = 430;
  fah = 120;
  while (doh < 300)
  {
    initials(doh, reh, mih, fah);
    doh += 50;
    if (doh > 350)
    {
      initials(doh, reh, mih, fah);
      doh -= 25;
    }
    
  }
  while (reh < 300)
  {
    initials(doh, reh, mih, fah);
    reh += 40;
    if (reh > 290)
    {
      initials(doh + 40, reh + 40, mih/2, fah/2);
      reh -=20;
    }
    
    
  }
  while (mih < 600)
  {
    initials(doh/3, reh/3, mih/3, fah/3);
    mih += 50;
    if (mih > 570)
    {
      initials(doh*.43, reh*.47, mih*.65, fah*.8);
      mih -= 25;
      
    }
    
  }
}

void initials(float x, float y, float wd, float ht)
{
  noFill();
  stroke(0, 155, 120);
  strokeWeight(20);
  ellipse(x, y, wd, wd);
  strokeWeight(.035*x);
  stroke(0, 40, 60);
  ellipse(x, y, .9*wd, .9*wd);
  //"E"
  stroke(100, 20, 80);
  strokeWeight(.02*wd);
  beginShape();
  curveVertex(x - .2*ht, y - ht);
  curveVertex(x - .2*ht, y - ht);
  curveVertex(x - ht, y - ht);
  curveVertex(x - (ht+30), y - .1*wd);
  curveVertex(x - (ht-20), y - .1*wd);
  curveVertex(x - (ht-20), y - .1*wd);
  curveVertex(x - (ht+30), y+.05*wd);
  curveVertex(x - (ht+30), y+.1*wd);
  curveVertex(x - ht, y + .12*wd);
  curveVertex(x - .2*ht, y+.1*wd);
  curveVertex(x - .2*ht, y+.1*wd);
  endShape();
  //"S"
  stroke(100, 40, 140);
  beginShape();
  curveVertex(x + .3*wd, y - .8*ht);
  curveVertex(x + .3*wd, y - .8*ht);
  curveVertex(x + .25*wd, y - ht);
  curveVertex(x + .1*wd, y - .8*ht);
  curveVertex(x + .08*wd, y - .7*ht);
  curveVertex(x + .12*wd, y - .6*ht);
  curveVertex(x + .4*wd, y);
  curveVertex(x + .4*wd, y + .2*ht);
  curveVertex(x + .2*wd, y + .4*ht);
  curveVertex(x + .07*wd, y + .1*ht);
  curveVertex(x + .07*wd, y + .1*ht);
  endShape();
}

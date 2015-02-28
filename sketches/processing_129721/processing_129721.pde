
//copyright Irene Joung 2014
//51-257: hw#3
float x,y;
float wd,ht;
float xDist,yDist;
float easingCoef;

void setup()
{
  size(400,400);
  background(107,139,53);
  noCursor();
  easingCoef=.1;
  wd=20;
  ht=20;
}

void draw()
{
  background(107,139,53);
  xDist=mouseX-x;
  yDist=mouseY-y;
  x=x+xDist*easingCoef;
  y=y+yDist*easingCoef;
  wd=100;
  ht=100;
  
  //head
fill(250,229,209);
noStroke();
ellipse(x,y,2.7*wd,2.5*ht);

//glasses
noFill();
stroke(70,70,70);
strokeWeight(8);
rect(x-wd,y-.2*ht,.8*wd,.5*ht);
rect(x+.2*wd,y-.2*ht,.8*wd,.5*ht);
arc(x,y,.4*wd,.2*ht,PI,TWO_PI);

//eyes
fill(0,0,0);
noStroke();
ellipse(x-.6*wd,y+.06*ht,.2*wd,.2*ht);
ellipse(x+.6*wd,y+.06*ht,.2*wd,.2*ht);

//"j" nose
noFill();
stroke(142,117,96);
strokeWeight(5);
line(x+.08*wd,y+.1*ht,x+.08*wd,y+.4*ht);
arc(x-.06*wd,y+.4*ht,.3*wd,.3*ht,0,HALF_PI+QUARTER_PI);

//mustache
fill(160,160,160);
noStroke();
quad(x-.4*wd,y+.6*ht,x+.4*wd,y+.6*ht,x+.6*wd,y+.8*ht,x-.6*wd,y+.8*ht);

//ears
fill(250,229,209);
noStroke();
ellipse(x+1.4*wd,y,.3*wd,.5*ht);
ellipse(x-1.4*wd,y,.3*wd,.5*ht);

//hair
fill(160,160,160);
noStroke();
beginShape();
  curveVertex(x-2*wd,y-ht);
  curveVertex(x,y-1.3*ht);
  curveVertex(x+wd,y-.85*ht);
  curveVertex(x,y-.8*ht);
  curveVertex(x-wd,y-.85*ht);
  curveVertex(x,y-1.3*ht);
  curveVertex(x+2*wd,y-ht);
endShape();
  
}




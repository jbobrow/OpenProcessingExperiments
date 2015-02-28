
//kristen chon copyright 2014


 float x, y, wd, ht;


void setup()
{
   size(400, 400);

   //noCursor();
  
}
void draw()
{
  wd=mouseX;
  ht=mouseY;
  x=100;
  y=100;

  
//head
fill(245, 230, 190);
noStroke();
ellipse(x+.5*wd, y+.5*ht, x+.3*wd, y+.3*ht);
 
//hair (left)
fill(121, 121, 120);
beginShape();
curveVertex(x+1.5*wd, y+.1*ht);
curveVertex(x+.25*wd, y+.35*ht);
curveVertex(x+.25*wd, y+.6*ht);
curveVertex(x+.22*wd, y+.35*ht);
curveVertex(x-.5*wd, y+.1*ht);
endShape();
//hair (right)
beginShape();
curveVertex(x+1.5*wd, y+.1*ht);
curveVertex(x+.75*wd, y+.35*ht);
curveVertex(x+.75*wd, y+.6*ht);
curveVertex(x+.72*wd, y+.35*ht);
curveVertex(x-.5*wd, y+.1*ht);
endShape();
//glasses
noFill();
stroke(67, 60, 40);
strokeWeight(7);
rect(.25*wd+x, .45*ht+y, .2*wd, .1*ht);
rect(.53*wd+x, .45*ht+y, .2*wd, .1*ht);
line(.4*wd+x, .45*ht+y, .6*wd+x, .45*ht+y);
//eyes
noStroke();
fill(255, 255, 255);
ellipse(.35*wd+x, .5*ht+y, .07*wd, .07*ht);
ellipse(.63*wd+x, .5*ht+y, .07*wd, .07*ht);
noStroke();
fill(39, 31, 11);
ellipse(.35*wd+x, .5*ht+y, .03*wd, .03*ht);
ellipse(.63*wd+x, .5*ht+y, .03*wd, .03*ht);
//nose
noStroke();
fill(201, 166, 69);
line(.47*wd+x, .53*wd+x, .9*ht+y, .50*ht+y);
 
//mouth
noStroke();
fill(126, 41, 28);
rect(.4*wd+x, .63*ht+y, .2*wd, .07*ht);
//circle
noFill();
ellipse(.5*wd+x, y+.52*ht, .17*wd, .17*ht);
//ellipse(200, 210, 70, 70);
 
//nose
fill(237, 147, 86);
noFill();
stroke(237, 147, 86);
curve(0.4*wd+x, 0.5*ht+y, 0.5*wd+x, 0.5*ht+y, 0.45*wd+x, 0.55*ht+y, .25*wd+x, .925+ht+y);
curve(.4*wd+x, .5*ht+y, .45*wd+x, .55*ht+y, .5*wd+x, .575*ht+y, .25*wd+x, .375*ht+y);
 
  //black rectangle
 fill(0, 10);
 rectMode( CORNER );
 rect(0, 0, width, height);
}



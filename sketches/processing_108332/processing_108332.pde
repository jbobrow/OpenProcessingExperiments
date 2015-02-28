
//copywrite Sam Friedlander
//September 3, 2013

//variables
float x = 200;
float y = 200;
//default x200 y200

float wh = 125;
float ht = 150;
//default wh 125 ht 150

void setup()
{
  size(400, 400);
  background (191, 184, 170);
  rectMode( CENTER );
}

void draw()

{
  //head
  noStroke();
  fill(217, 159, 140);
  rect(x, y, wh, ht, 0, 0, 50, 50);

  //mouth
  fill(217, 123, 100);
  arc(x, y+.25*ht, .65*wh, .25*ht, 0, PI, OPEN);

  //mustashe
  noFill();
  stroke(242, 235, 220);
  strokeWeight(6);
  beginShape();
  curveVertex(x-.75*x, y+.1*y);
  curveVertex(x-.2*x, y+.1*y);
  curveVertex(x+.21*x, y+.1*y);
  curveVertex(x+.27*x, y+.2*y);
  curveVertex(x+.27*x, y+.2*y);
  endShape();
  line(x-.285*x, y+.10*y, x-.285*x, y+.199*y);
  line(x-.24*x, y+.10*y, x-.24*x, y+.199*y);
  line(x-.199*x, y+.14*y, x-.199*x, y+.199*y);
  line(x-.16*x, y+.14*y, x-.16*x, y+.199*y);
  line(x-.118*x, y+.14*y, x-.118*x, y+.199*y);
  line(x-.078*x, y+.14*y, x-.078*x, y+.199*y);
  line(x-.037*x, y+.14*y, x-.037*x, y+.199*y);
  line(x, y+.14*y, x, y+.199*y);
  line(x+.04*x, y+.14*y, x+.04*x, y+.199*y);
  line(x+.081*x, y+.14*y, x+.081*x, y+.199*y);
  line(x+.120*x, y+.14*y, x+.120*x, y+.199*y);
  line(x+.16*x, y+.14*y, x+.16*x, y+.199*y);
  line(x+.2*x, y+.12*y, x+.2*x, y+.199*y);

//eyes  
  noStroke();
  fill(67, 96, 115);
  ellipse(x-.22*x, y, .1*wh, .08*ht);
  ellipse(x+.22*x, y, .1*wh, .08*ht);

//nose
  fill(217, 123, 100);
  ellipse(x-.021*x, y+.05*y, .04*wh, .035*ht);
  ellipse(x+.021*x, y+.05*y, .04*wh, .035*ht);

//hat
  fill (217,107,98);
  rect(x, y-.45*y, wh, ht-.5*ht,22, 22,0,0);
  stroke(217,107,98);
  line(x+.6*x,y-.26*y,x-.6*x,y-.26*y);
  
//glasses
strokeWeight(2);
stroke(242, 235, 220);
  line(x+.29*x,y-.06*y,x-.29*x,y-.06*y);
  line(x+.16*x,y-.03*y,x-.16*x,y-.03*y);
  noFill();
  arc(x-.22*x, y-.052*y, .2*wh, .3*ht, 0, PI, OPEN);
  arc(x+.22*x, y-.052*y, .2*wh, .3*ht, 0, PI, OPEN);


  
 
}  
//hat fill (217,107,98)
//blue eyes (67,96,115)
//lighter grey(242,235,22)
//rosy skin (217,123,100) 




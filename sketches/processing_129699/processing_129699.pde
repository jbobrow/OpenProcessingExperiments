
//copyright nickiecheung HW3
//variables
float x, y, xDist, yDist, easingCoef, dx, dy;

void setup()
{
  size(400,400);
  background(0);
}

void draw()
{
  //stuff for aesthetic choice
  noCursor();
  background(0);
  
 //variable statements
 x=dx;
 y=dy;
 xDist=mouseX - x;
 yDist=mouseY - y;
 easingCoef=.07;
 dx=x+xDist*easingCoef;
 dy=y+yDist*easingCoef;
 
 
//head
fill(250, 216, 151);
noStroke();
rectMode(CENTER);
rect(x*1.5, y*1.5, x*2.2, y*2.3, 100, 100, 70, 70);

//glasses
fill(60,60,60,50);
stroke(0);
strokeWeight(5);
rect(x,y*1.6,x*.7,y*.3,0,0,70,70);
rect(x*2,y*1.6,x*.7,y*.3,0,0,70,70);
noFill();
arc(x*1.5,y*1.45,x*.3,y*.1,PI,2*PI);

//n
rectMode(CORNER);
fill(144,141,134);
noStroke();
rect(x*.7,y*1.2,x*.05,y*.15);
stroke(144,141,134);
noFill();
arc(x,y*1.32,x*.6,y*.2,PI+PI/8,2*PI);

//eyebrow
arc(x*2,y*1.2,x*.5,y*.4,PI,PI*1.75);

//hair
fill(144,141,134);
beginShape();
  curveVertex(x,1.1*y);
  curveVertex(x*.45,y);
  curveVertex(x*.6,y*.5);
  curveVertex(x*1.1,y*.35);
  curveVertex(x*.9,y*.7);
  curveVertex(x,y);
endShape(CLOSE);

beginShape();
  curveVertex(2*x,1.1*y);
  curveVertex(2.55*x,y);
  curveVertex(2.4*x,y*.5);
  curveVertex(1.9*x,y*.35);
  curveVertex(2.1*x,y*.7);
  curveVertex(2*x,y);
endShape(CLOSE);
  
//moustache
arc(x*1.5,y*2.1,x*.8,y*.6,PI,2*PI);
}
  




//copyright nickiec nickiecheung HW2 11:30
size( 400, 400 );
background(211, 164, 207);

float x, y, wd, ht;
x = 100;
y = 100;
ht = 200;  
wd = 200;

fill(144,141,134);
noStroke();
beginShape();
  curveVertex(x,y);
  curveVertex(x,y+.6*ht);
  curveVertex(x-.1*wd, y+.4*ht);
  curveVertex(x+wd*.05,y);
  curveVertex(x+wd*.5,y);
  curveVertex(x+.15*wd,y+.11*ht);
  curveVertex(x,y);
endShape(CLOSE);

beginShape();
  curveVertex(2*x,y);
  curveVertex(x+wd,y+.6*ht);
  curveVertex(x+1.1*wd,y+.4*ht);
  curveVertex(x+wd*.95,y);
  curveVertex(x+wd*.5,y);
  curveVertex(x+.75*wd,y+.11*ht);
  curveVertex(2*x,y);
endShape(CLOSE);


//head
fill(250, 216, 151);
noStroke();
rectMode(CORNER);
rect(x, y, wd, ht, 100, 100, 70, 70);

//glasses
fill(60, 60, 60, 50);
stroke(0);
strokeWeight(5);
rect(x, y+.5*ht, wd*.45, ht*.25, 0, 0, 70, 70);
rect(x+wd*.55, y+.5*ht, wd*.45, ht*.25, 0, 0, 70, 70);
noFill();
arc(x+.5*wd, y+.5*ht, wd*.15, ht*.05, PI, 2*PI);


//n
fill(144,141,134);
noStroke();
rect(x+.1*wd,y+.25*ht,wd*.025,ht*.15,100,100,100,100);
stroke(144,141,134);
noFill();
arc(x+wd*.25,y+ht*.38,wd*.3,ht*.2,PI+PI/8,2*PI);

//eyebrow
arc(x+wd*.77,y+ht*.38,wd*.35,ht*.2,PI,PI*1.75);

//moustache
fill(144,141,134);
arc(x+wd*.5,y+ht*.9,wd*.4,ht*.3,PI,2*PI);







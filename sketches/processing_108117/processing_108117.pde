
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, September 2013

size(400, 400);
background( 85, 196, 189);

rectMode(CENTER);

//variables
float x=200;
float y=200;

float a=300; //width
float b=300; //length


//head
fill(250, 129, 161);
noStroke();
ellipse( x, y, a, b);

//mouth
stroke(255, 255, 255, 99);
strokeWeight(8);
line( x - a*.1, y + b*.35, x + a*.1, y + b*.35);

//moustache
fill(255, 255, 255);
stroke(255, 255, 255);
strokeWeight(2);
ellipseMode(CORNER);
ellipse(x - a*.25, y + b*.13, a*.25, b*.25);
ellipse(x , y + b*.13, a*.25, b*.25);

fill(250, 129, 161);
stroke(250, 129, 161);
strokeWeight(2);
ellipseMode(CORNER);
ellipse(x - a*.28, y - b*.05, a*.35, b*.35);
ellipse(x - a*.07, y - b*.05, a*.35, b*.35);

//nose
noFill();
strokeCap(ROUND);
stroke(255, 255, 255);
strokeWeight(2);

ellipseMode(CENTER);
arc( x - a*.1, y + b*.25, a*.05, b*.05, radians(90), radians(240));
arc( x + a*.1, y + b*.25, a*.05, b*.05, radians(-60), radians(90));
line( x - a*.1, y + b*.275, x + a*.1, y + b*.275);


//ears
fill(250, 129, 161);
noStroke();
beginShape();
  curveVertex( x - a*.2, y       ); //left ear reference point
  curveVertex( x - a*.4, y - b*.15); //left ear first point
  curveVertex( x - a*.55, y - b*.10); //left ear second point
  curveVertex( x - a*.4, y + b*.25); //left ear third point
  curveVertex( x - a*.6, y        ); //left ear reference point
endShape();

beginShape();
  curveVertex( x + a*.2, y       ); //right ear reference point
  curveVertex( x + a*.4, y - b*.15); //right ear first point
  curveVertex( x + a*.55, y - b*.10); //right ear second point
  curveVertex( x + a*.4, y + b*.25); //right ear third point
  curveVertex( x + a*.6, y        ); //right ear reference point
endShape();

//eyeballs
fill(70, 35, 0);
noStroke();
ellipse(x-a*.15, y + b*0.01, a*.08, b*.08);
ellipse(x+a*.15, y + b*0.01, a*.08, b*.08);

//glasses-eyes
fill(255, 255, 255);
arc(x-a*.15, y, a*.2, b*.2, radians(-180), radians(0));
arc(x+a*.15, y, a*.2, b*.2, radians(-180), radians(0));
line(x-a*.25,y , x-a*.05, y);

noFill();
strokeWeight(2);
stroke(255, 255, 255);
arc(x-a*.15, y, a*.2, b*.2, radians(45), radians(180));
arc(x+a*.15, y, a*.2, b*.2, radians(0), radians(135));


//hair
noStroke();

fill(230, 230, 230);
ellipseMode(CENTER);

//LEFT
arc(x - a*.45, y - b*.55, a*.75, b*.75, radians(0), radians(102), OPEN);
arc(x - a*.1355, y - b*.18, a*.75, b*.75, radians(175), radians(280), OPEN);

//RIGHT
arc(x + a*.35, y - b*.55, a*.85, b*.85, radians(70), radians(182), OPEN);
arc(x + a*.07, y - b*.18, a*.85, b*.85, radians(248), radians(367), OPEN);





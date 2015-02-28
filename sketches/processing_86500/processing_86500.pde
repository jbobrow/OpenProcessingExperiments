
//Alison Servis, aservis@andrew.cmu.edu
//Homework #2, Computing for the Arts with Processing, 11:30am
//copyright © Alison Servis
               //Tuesday 1.22.13
               //Pittsburgh 15232 
               //All Rights Reserved


size(400,400);
smooth();
background(135, 152, 104);

float x, y, wd, ht;

x = 100;
y= 100;
wd = 200;
ht = 200;


//mustache!
noFill();
strokeWeight(1);
stroke(135, 152, 104);

rect(x, y, wd, ht);

//fill(237, 199, 129);
//ellipse(x+(wd*.5),y+(ht*.45),wd*1.75,ht*1.95);

noFill();
point(x-(wd*.25), y + (ht*.45)); //control point
point(x, y + (ht*.75));
point(x+(wd*.35), y+(ht*.95));
point(x+(wd*.75), y+(ht*.75));
point(x+wd, y+(ht*.95));
point(x+(wd*1.1), y+(ht*.95)); //control point

strokeWeight(40);
stroke(201, 186 , 148);

beginShape();
curveVertex(x-(wd*.25), y + (ht*.45)); //control point
curveVertex(x, y + (ht*.75));
curveVertex(x+(wd*.35), y+(ht*.95));
curveVertex(x+(wd*.75), y+(ht*.75));
curveVertex(x+wd, y+(ht*.95));
curveVertex(x+(wd*1.1), y+ht); //control point
endShape();

//glasses!
strokeWeight(10);
stroke(84,85,76);
rect(x, y, x*.7, x*.5);
rect(x+(wd*.75), y, x*.7, x*.5);

stroke(84,85,76);
beginShape();
curveVertex(x+(wd*.15), y+(ht*.55)); //control point
curveVertex(x+(wd*.35), y+(ht*.1));
curveVertex(x+(wd*.75), y+(ht*.1));
curveVertex(x+(wd*.95), y+(ht*.55)); //control point
endShape();

//eyes & eyebrows!
stroke(37,47,57);
ellipse(x+(wd*.15), y+(ht*.15), x*.15, y*.15);
ellipse(x+(wd*.95), y+(ht*.15), x*.15, y*.15);

stroke(201, 186 , 148);
strokeWeight(15);
line(x-(wd*.1), y-(ht*.15), x+(wd*.35), y-(ht*.15));
line(x+(wd*.75), y-(ht*.15), x+(wd*1.2), y-(ht*.15));

//nose
strokeWeight(10);
noStroke();
point(x+(wd*.25), y+(ht*.25)); //control point
point(x+(wd*.45), y+(ht*.55));
point(x+(wd*.65), y+(ht*.55));
point(x+(wd*.9), y+(ht*.25)); //control point

stroke(131, 115, 46);
beginShape();
curveVertex(x+(wd*.25), y+(ht*.25)); //control point
curveVertex(x+(wd*.45), y+(ht*.55));
curveVertex(x+(wd*.65), y+(ht*.55));
curveVertex(x+(wd*.9), y+(ht*.25)); //control point
endShape();







//homework #2 Tue.Thurs. 11:30-1:30
//copyright Hyun Doug Kim 2014

size(400, 400);
background(5, 186, 250);

float x= 100; 
float y= 100; 
float wd= 50; 
float ht= 200;


//hair
noStroke();
fill (185, 185, 185);
ellipse (x+ (2*wd), y+ (ht*.4), wd*6, ht);

//face
fill (255, 234, 227);
stroke (255, 234, 227);
strokeWeight (5);
ellipse (x+ (2*wd), y+ (ht*.5), wd*6, ht);

//ears 
ellipse (x-wd, y+.5*ht, .5*wd, .15*ht);
ellipse (x+5*wd, y+.5*ht, .5*wd, .15*ht);

//eye D
stroke (0);
strokeWeight (3);
fill(0);
beginShape();
  curveVertex(x+.4*wd, y+.25*ht);
  curveVertex(x+.2*wd, y+.3*ht);
  curveVertex(x+.3*wd, y+.325*ht);
  curveVertex(x+.5*wd, y+.35*ht);
  curveVertex(x+.7*wd, y+.325*ht);
  curveVertex(x+.8*wd, y+.3*ht);
  curveVertex(x+wd, y+.25*ht);
endShape();
line(x-.8*wd, y+.30*ht, x+ (4*wd) +.8*wd, y+.30*ht);

//eye D number 2
beginShape();
  curveVertex(x+3.4*wd, y+.25*ht);
  curveVertex(x+3.2*wd, y+.3*ht);
  curveVertex(x+3.3*wd, y+.325*ht);
  curveVertex(x+3.5*wd, y+.35*ht);
  curveVertex(x+3.7*wd, y+.325*ht);
  curveVertex(x+3.8*wd, y+.3*ht);
  curveVertex(x+3*wd, y+.25*ht);
endShape();

//moustache D
fill(161, 162, 162);
noStroke();
beginShape();
  curveVertex(x, y+.9*ht);
  curveVertex(x+.4*wd, y+.75*ht);
  curveVertex(x+wd, y+.6*ht);
  curveVertex(x+2*wd, y+.5*ht);
  curveVertex(x+3*wd, y+.6*ht);
  curveVertex(x+3.6*wd, y+.75*ht);
  curveVertex(x+4*wd, y+.9*ht);
endShape();

//nose
noFill();
stroke(255, 115, 0);
strokeWeight(4);
beginShape(LINES);
  vertex(x+1.6*wd, y+.4*ht);
  vertex(x+1.6*wd, y+.5*ht);
  vertex(x+2.4*wd, y+.4*ht);
  vertex(x+2.4*wd, y+.5*ht);
  vertex(x+1.6*wd, y+.45*ht);
  vertex(x+2.4*wd, y+.45*ht);
endShape();

//works fine in Java, but the code malfunctioned in Javascript









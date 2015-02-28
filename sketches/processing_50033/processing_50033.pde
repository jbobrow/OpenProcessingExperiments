
//homework #2 - 48257 S'12
//melissa goh copyright 2012

size(400, 400);
background(240, 223, 218);
smooth();

float x, y, wd, ht;
x = 100;
y = 100;
wd = 200;
ht = 200;

stroke(240, 99, 60);
strokeWeight(4);
fill(250, 244, 242);
ellipse(x + wd*.5, y + ht*.5, wd, ht);

noStroke();
fill(190, 200, 211);
ellipse(x + wd*.5, y + ht*.25, wd*.66, ht*.33);
ellipse(x + wd*.5, y + ht*.75, wd*.66, ht*.33);

fill(250, 244, 242);
ellipse(x + wd*.5, y + ht*.30, wd*.33, ht*.33);
ellipse(x + wd*.5, y + ht*.70, wd*.33, ht*.33);

fill(190, 200, 211);
quad(x + wd*.5, y + ht*.49, x + wd*.5, y + ht*.51, x + wd*.20, y + ht*.32, x + wd*.32, y + ht*.35);
quad(x + wd*.5, y + ht*.51, x + wd*.5, y + ht*.49, x + wd*.80, y + ht*.68, x + wd*.68, y + ht*.65);

stroke(220, 231, 245);
strokeWeight(4);
beginShape();
  vertex(x + wd*.15, y + ht*.30);
  vertex(x + wd*.15, y + ht*.75);
endShape();

beginShape();
  vertex(x + wd*.30, y + ht*.30);
  vertex(x + wd*.30, y + ht*.75);
endShape();

beginShape();
  vertex(x + wd*.45, y + ht*.30);
  vertex(x + wd*.45, y + ht*.75);
endShape();

noFill();
beginShape();
  curveVertex(x + wd*.15, y + ht*.50);
  curveVertex(x + wd*.15, y + ht*.30);
  curveVertex(x + wd*.22, y + ht*.25);
  curveVertex(x + wd*.30, y + ht*.30);
  curveVertex(x + wd*.30, y + ht*.50);
endShape();

beginShape();
  curveVertex(x + wd*.30, y + ht*.50);
  curveVertex(x + wd*.30, y + ht*.30);
  curveVertex(x + wd*.37, y + ht*.25);
  curveVertex(x + wd*.45, y + ht*.30);
  curveVertex(x + wd*.45, y + ht*.50);
endShape();

stroke(57, 76, 98);
beginShape();
  vertex(x + wd*.55, y + ht*.35);
  vertex(x + wd*.55, y + ht*.65);
endShape();

beginShape();
  vertex(x + wd*.85, y + ht*.55);
  vertex(x + wd*.85, y + ht*.65);
endShape();

beginShape();
  curveVertex(x + wd*.55, y + ht*.75);
  curveVertex(x + wd*.55, y + ht*.35);
  curveVertex(x + wd*.70, y + ht*.25);
  curveVertex(x + wd*.85, y + ht*.35);
  curveVertex(x + wd*.85, y + ht*.75);
endShape();

beginShape();
  curveVertex(x + wd*.55, y + ht*.25);
  curveVertex(x + wd*.55, y + ht*.65);
  curveVertex(x + wd*.70, y + ht*.75);
  curveVertex(x + wd*.85, y + ht*.65);
  curveVertex(x + wd*.85, y + ht*.25);
endShape();

beginShape();
  vertex(x + wd*.75, y + ht*.55);
  vertex(x + wd*.85, y + ht*.55);
endShape();

// saveFrame("hw2.jpg");


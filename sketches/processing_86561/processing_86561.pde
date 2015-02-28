
// Homework 2, 01-19-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu January 2013 Pittsburgh PA 15232

size(400, 400);
background(255);
smooth();

float x, y, wd, ht;
x=50;
y=25;
wd=300;
ht=350;

//face
noStroke();
fill(255, 246, 232);
ellipse(x+wd/2, y+ht/2, wd, ht);
//hair
noStroke();
fill(255);
ellipse(x+wd/2, y-ht*2/7, wd, wd);
stroke(255, 246, 232);
strokeWeight(3);
noFill();
ellipse(x+wd/2, y+.45*ht, wd, ht);

//ears
fill(255, 246, 232);
beginShape();
  curveVertex(x+.08*wd, y+.11*ht);
  curveVertex(x+wd/16, y+.3*ht);
  curveVertex(x-.1*wd, y+.42*ht);
  curveVertex(x+wd/16, y+.7*ht);
  curveVertex(x+.08*wd, y+.7*ht);
endShape();

beginShape();
  curveVertex(x+wd-.08*wd, y+.11*ht);
  curveVertex(x+wd-wd/16, y+.3*ht);
  curveVertex(x+wd+.1*wd, y+.42*ht);
  curveVertex(x+wd-wd/16, y+.7*ht);
  curveVertex(x+wd-.08*wd, y+.7*ht);
endShape();

//nose
stroke(255, 193, 100);
strokeWeight(5);
beginShape();
  curveVertex(x, y);
  curveVertex(x+.5*wd, y+.4*ht);
  curveVertex(x+.3*wd, y+.6*ht);
  curveVertex(x+.6*wd, y+.6*ht);
  curveVertex(x, y);
endShape();

//mouth
fill(255, 246, 232);
stroke(220);
strokeWeight(5);
beginShape();
  curveVertex(x+.3*wd, y+.77*ht);
  curveVertex(x+.4*wd, y+.8*ht);
  curveVertex(x+.5*wd, y+.83*ht);
  curveVertex(x+.6*wd, y+.8*ht);
  curveVertex(x+.7*wd, y+.77*ht);
endShape();

//glasses and eyes
noStroke();
fill(108, 93, 76);
ellipse(x+.3*wd, y+.4*ht, wd/3.5, ht/4.1);
ellipse(x+.7*wd, y+.4*ht, wd/3.5, ht/4.1);
noFill();
stroke(108, 93, 76);
strokeWeight(8);
beginShape();
  curveVertex(x+.37*wd, y+.46*ht);
  curveVertex(x+.44*wd, y+.4*ht);
  curveVertex(x+.5*wd, y+.38*ht);
  curveVertex(x+.56*wd, y+.4*ht);
  curveVertex(x+.63*wd, y+.46*ht);
endShape();
line(x+.16*wd, y+.4*ht, x+.02*wd, y+.35*ht);
line(x+.84*wd, y+.4*ht, x+.98*wd, y+.35*ht);
noStroke();
fill(255, 246, 232);
ellipse(x+.3*wd, y+.4*ht, .24*wd, ht/4.9);
ellipse(x+.7*wd, y+.4*ht, .24*wd, ht/4.9);
fill(108, 93, 76);
ellipse(x+.37*wd, y+.4*ht, wd/8, ht/9.3);
ellipse(x+.77*wd, y+.4*ht, wd/8, ht/9.3);

//mustache
while(x<=wd/2){
stroke(100);
strokeWeight(3);
line(x+wd/3, y+.75*ht, x+.4*wd, y+.69*ht);
line(x+4*wd/15, y+.69*ht, x+wd/3, y+.75*ht);
x = x+wd/15;
}

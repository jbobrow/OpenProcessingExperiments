
//copyright Yoon-ji Kim 2014
//HW#2: 51-257 A

size(400, 400);
background(255, 232, 222);
smooth();

//variables
float x=100;
float y=100;
float wd=100;
float ht=100;

//temporary bounding circle
noFill();
noStroke();
ellipse(1.3*x, 1.5*y, 2.5*wd, 2.7*ht);

//rest of glasses fill
fill(255);
triangle(x, y-.2*ht, x+wd, y, x+wd, y-.2*ht);

//INITIAL: Y
  //nose bridge
  noFill();
  stroke(255, 178, 187);
  strokeWeight(3);
  beginShape();
  curveVertex(x+wd, y-2*ht);
  curveVertex(x+wd, y-.2*ht);
  curveVertex(x+wd, y+1.5*ht);
  curveVertex(x+.7*wd, y+1.5*ht);
  curveVertex(x+.5*wd, y+1.6*ht);
  endShape();
  
  //left glasses frame
  fill(255);
  stroke(19, 52, 167);
  strokeWeight(6);
  beginShape();
  curveVertex(x+wd, y-3*ht);
  curveVertex(x+wd, y-.1*ht);
  curveVertex(x-.4*wd, y+.4*ht);
  curveVertex(x-.7*wd, y-.2*ht);
  curveVertex(x-.7*wd, y+.2*ht);
  endShape();

//right glasses frame
stroke(0);
strokeWeight(6);
beginShape();
curveVertex(x+2.7*wd, y-.2*ht);
curveVertex(x+2.7*wd, y-.2*ht);
curveVertex(x+2.4*wd, y+.35*ht);
curveVertex(x+1.4*wd, y+.35*ht);
curveVertex(x+wd, y-.2*ht);
curveVertex(x+wd, y-.3*ht);
endShape();

//top of glasses
line(x-.75*wd, y-.2*ht, x+2.7*wd, y-.2*ht);

//eyes
fill(0);
ellipse(x+.2*wd, y-.1*ht, 15, 15);
ellipse(x+1.8*wd, y-.1*ht, 15, 15);

//moustache
noStroke();
fill(168, 180, 180);
arc(x+wd, y+2.5*ht, 2.8*wd, 1.6*ht, PI, TWO_PI, OPEN);

stroke(255);
strokeWeight(2);
line(x+.25*wd, y+2.5*ht, x+.25*wd, y+2.1*ht);
line(x+.5*wd, y+2.5*ht, x+.5*wd, y+2.1*ht);
line(x+.75*wd, y+2.5*ht, x+.75*wd, y+2.1*ht);
line(x+wd, y+2.5*ht, x+wd, y+2.1*ht);
line(x+1.25*wd, y+2.5*ht, x+1.25*wd, y+2.1*ht);
line(x+1.5*wd, y+2.5*ht, x+1.5*wd, y+2.1*ht);
line(x+1.75*wd, y+2.5*ht, x+1.75*wd, y+2.1*ht);

//saveFrame("hw2.jpg");



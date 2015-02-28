
size( 500, 500);
background( 230, 250, 255);
noStroke();
smooth();

//definitions
float x, y, dia;
x= 250;
y= 250;
dia= 300;

//Neck
fill(180);
rectMode(CENTER);
rect(x, y+y/2, dia-dia/1.4, dia);
ellipse(x, y+y*1.2, dia-dia/5, dia);
fill(210);
ellipse(x, y+y*1.3, dia-dia/3, dia);
fill(230, 0, 0);
rect(x, y+y/1.7, dia-dia/1.4, dia-dia/1.05);
rectMode(CORNER);
fill(240, 240, 0);
ellipse( x, y+y/1.5, dia-dia/1.1, dia-dia/1.1);

//Mouth
fill(210);
ellipse(x, y+y*.2, dia-dia/2, dia-dia/2);

fill(0);
ellipse(x, y+y*.2, dia-dia/1.3, dia-dia/1.3);

fill(255, 255, 245);
triangle( x+x/7, y+y/10, x+x/10, y+y/10, x+x/8, y+y/2.8);
triangle( x-x/7, y+y/10, x-x/10, y+y/10, x-x/8, y+y/2.8);

//Ears
fill(190);
triangle( x-x/1.5, y-y/1.3, x-x/6, y-y/1.7, x-x/2, y);
triangle( x+x/1.5, y-y/1.3, x+x/6, y-y/1.7, x+x/2, y);
fill(255, 230, 230, 120);
triangle( x-x/1.6, y-y/1.4, x-x/4, y-y/1.7, x-x/2.1, y);
triangle( x+x/1.6, y-y/1.4, x+x/4, y-y/1.7, x+x/2.1, y);

//Face
fill(180);
arc(x, y, dia, dia*1.1, PI, TWO_PI);
arc(x-x*.3, y, dia-dia/2, dia-dia/2, 0, PI);
arc(x+x*.3, y, dia-dia/2, dia-dia/2, 0, PI);

//Eyes
fill( 255);
stroke(0);
strokeWeight(2);
ellipse( x-x/4, y-y/5, dia-dia/1.3,dia-dia/1.3);
ellipse( x+x/4, y-y/5, dia-dia/1.3,dia-dia/1.3);
noStroke();

fill(180, 240, 0);
ellipse( x-x/4, y-y/5, dia-dia/1.25,dia-dia/1.25);
ellipse( x+x/4, y-y/5, dia-dia/1.25,dia-dia/1.25);
fill(220, 240, 0);
ellipse( x-x/4, y-y/5, dia-dia/1.1,dia-dia/1.25);
ellipse( x+x/4, y-y/5, dia-dia/1.1,dia-dia/1.25);

fill(0);
ellipse( x-x/4, y-y/5, dia-dia/1.05, dia-dia/1.2);
ellipse( x+x/4, y-y/5, dia-dia/1.05, dia-dia/1.2);

fill(210);
ellipse( x-x/4, y-y/3, dia-dia/1.5, dia-dia/1.05);
ellipse( x+x/4, y-y/3, dia-dia/1.5, dia-dia/1.05);

//Nose
fill(255, 230, 230);
triangle( x, y+y/16, x-x/18, y-y/40, x+x/18, y-y/40);

//Whisker R
noFill();
stroke(240);
strokeWeight(2);

beginShape();
curveVertex(x+x/4, y+y/6);
curveVertex(x+x/4, y+y/6);
curveVertex(x+x/2, y+y/6);
curveVertex(x+x/1.2, y+y/4);
curveVertex(x+x/1.2, y+y/4);
endShape();

beginShape();
curveVertex(x+x/6, y+y/8);
curveVertex(x+x/6, y+y/8);
curveVertex(x+x/2, y+y/9);
curveVertex(x+x/1.3, y+y/8);
curveVertex(x+x/1.3, y+y/8);
endShape();

beginShape();
curveVertex(x+x/3.5, y+y/12);
curveVertex(x+x/3.5, y+y/12);
curveVertex(x+x/1.5, y+y/20);
curveVertex(x+x/1.1, y+y/12);
curveVertex(x+x/1.1, y+y/12);
endShape();

//Whisker L
beginShape();
curveVertex(x-x/4, y+y/6);
curveVertex(x-x/4, y+y/6);
curveVertex(x-x/2, y+y/6);
curveVertex(x-x/1.2, y+y/4);
curveVertex(x-x/1.2, y+y/4);
endShape();

beginShape();
curveVertex(x-x/6, y+y/8);
curveVertex(x-x/6, y+y/8);
curveVertex(x-x/2, y+y/9);
curveVertex(x-x/1.3, y+y/8);
curveVertex(x-x/1.3, y+y/8);
endShape();

beginShape();
curveVertex(x-x/3.5, y+y/12);
curveVertex(x-x/3.5, y+y/12);
curveVertex(x-x/1.5, y+y/20);
curveVertex(x-x/1.1, y+y/12);
curveVertex(x-x/1.1, y+y/12);
endShape();

//Top Detail
stroke(210);
strokeWeight(5);
strokeCap(ROUND);
line(x, y-y/2.4, x, y-y/1.53);
line(x-x/6, y-y/2, x-x/6, y-y/1.6);
line(x+x/6, y-y/2, x+x/6, y-y/1.6);

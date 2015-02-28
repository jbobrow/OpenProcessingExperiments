
//Abby Frankola
//afrankol
//copyright Abby Frankola Sept 2013

size(400, 400); 
background(48, 91, 122);
smooth();
fill(201, 99, 26);
noStroke();
triangle(0, 0, 400, 0, 0, 400);

float x, y, w, h;
x= 50;
y= 50;
w= 300;
h= 300;



noFill();
noStroke();


rect(x, y, w, h);
noStroke();
fill(237, 217, 197);
ellipse ( x + ( w * .5 ), y + ( h * .5 ), w, h);

//mouth as "A"
stroke(209, 189, 167);
strokeWeight(4);
noFill();
strokeCap(ROUND);
beginShape();
  curveVertex( x + ( .05 * w ), y + ( 1.25 * h ) );
  curveVertex( x + ( .25 * w ), y + ( 0.85 * h ) );
  curveVertex( x + ( .50 * w ), y + ( 0.60 * h ) );
  curveVertex( x + ( .75 * w ), y + ( 0.85 * h ) );
  curveVertex( x + ( .95 * w ), y + ( 1.25 * h ) );
endShape();
line ( x + ( .3 * w), y + ( .78 * h ), x + ( .70 * w), y + ( .78 * h ) );
line ( x + ( .45 * w), y + ( .85 * h ), x + ( .55 * w), y + ( .85 * h ) );

//mustache
fill(163, 163, 163);
noStroke();
smooth();
beginShape();
  curveVertex( x + ( .25 * w ), y + ( 0.90 * h ) );
  curveVertex( x + ( .33 * w ), y + ( 0.76 * h ) );
  curveVertex( x + ( .50 * w ), y + ( 0.62 * h ) );
  curveVertex( x + ( .67 * w ), y + ( 0.76 * h ) );
  curveVertex( x + ( .75 * w ), y + ( 0.90 * h ) );
endShape();

//nose
fill(227, 180, 157);
noStroke(); 
beginShape(); 
  vertex( x + ( .45 * w ), y + ( 0.38 * h ) );
  vertex( x + ( .40 * w ), y + ( 0.60 * h ) );
  vertex( x + ( .50 * w ), y + ( 0.65 * h ) );
  vertex( x + ( .60 * w ), y + ( 0.60 * h ) );
  vertex( x + ( .55 * w ), y + ( 0.38 * h ) );
endShape(CLOSE);


//ears
fill(237, 217, 197);
noStroke();
ellipse( x - ( .02 * w ), y + ( .45 * h), ( w * .15), ( h * .15), radians(70), radians (300), OPEN);
ellipse( x + ( 1.02 * w ), y + ( .45 * h), ( w * .15), ( h * .15), radians(-130), radians (110), OPEN);

//eyes
stroke(66, 74, 74);
strokeWeight(10);
point( x + ( .3 * w ), y + ( 0.45 * h ) );
point( x + ( .7 * w ), y + ( 0.45 * h ) );


//eyebrows
fill(163, 163, 163);
stroke(163, 163, 163);
strokeWeight(5);
strokeJoin(ROUND);
beginShape(QUADS);
  vertex( x + ( .2 * w ), y + ( 0.35 * h ) );
  vertex( x + ( .4 * w ), y + ( 0.35 * h ) );
  vertex( x + ( .4 * w ), y + ( 0.42 * h ) );
  vertex( x + ( .2 * w ), y + ( 0.42 * h ) );
  vertex( x + ( .6 * w ), y + ( 0.35 * h ) );
  vertex( x + ( .8 * w ), y + ( 0.35 * h ) );
  vertex( x + ( .8 * w ), y + ( 0.42 * h ) );
  vertex( x + ( .6 * w ), y + ( 0.42 * h ) );
endShape();

//glasses
stroke(42, 51, 51);
strokeWeight(5);
strokeJoin(ROUND);
noFill();
beginShape();
  vertex( x - ( .01 * w ), y + ( 0.38 * h ) );
  vertex( x + ( 1.01 * w ), y + ( 0.38 * h ) );
endShape();
beginShape();
  vertex( x + ( .15 * w ), y + ( 0.38 * h ) );
  vertex( x + ( .2 * w ), y + ( 0.55 * h ) );
  vertex( x + ( .4 * w ), y + ( 0.55 * h ) );
  vertex( x + ( .45 * w ), y + ( 0.38 * h ) );
endShape();  
beginShape();
  vertex( x + ( .55 * w ), y + ( 0.38 * h ) );
  vertex( x + ( .6 * w ), y + ( 0.55 * h ) );
  vertex( x + ( .8 * w ), y + ( 0.55 * h ) );
  vertex( x + ( .85 * w ), y + ( 0.38 * h ) );
endShape();



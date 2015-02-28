
//Ashley Wong amwong 
//Copyright Pittsburgh 2012

size(400, 400);
background(30);
smooth();

float h,k,x,y;
h=200;
k=200;
x=100;
y=100;

//aBackground
noStroke();
fill(120, 145, 95);
ellipse( h, k, x*3.5, y*3.5 );
//aBottomBlackedOut
noStroke();
fill(30);
rect(0, k, x*4, y*2);
//aFilledIn
noStroke();
fill(70);
ellipse( h, k, x*3, y*3);
fill(120, 145, 95);
rect(h-x*3/2, k-3*y/4, x*3, y/4);

//LetterM
stroke(90, 150, 90);
strokeWeight(12.5);
noFill();
beginShape();
curveVertex(h-x*2, k+y*3);
curveVertex(h-x, k);
curveVertex(h, k);
curveVertex(h+x, k);
curveVertex(h+x*2, k+y*3);
endShape();

//LetterW
stroke(100, 150, 90);
strokeWeight(25);
noFill();
beginShape();
curveVertex(h+x*4,k-y*6);
curveVertex(h+x*1.5,k+y/2);
curveVertex(h,k+y/2);
curveVertex(h-x*1.5,k+y/2);
curveVertex(h-x*4,k-y*6);
endShape();

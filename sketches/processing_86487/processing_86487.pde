
// Samantha Ticknor, Hw2
// sticknor@andrew.cmu.edu
// Copyright January 2013 Sam Ticknor

// Preparing canvas
size(400, 400);
background(0, 200, 200);


// The 3 edit-able parameters
float initialSize = 400;
float xAnchor = 200;   //width/2;
float yAnchor = 200;   //height/2;


// Establishing line quality
smooth();
strokeWeight(initialSize/200);


//Bounding Circle
fill(0, 0, 0, 100);
stroke(0, 200, 200);
ellipse(xAnchor, yAnchor, initialSize, initialSize);


// Draw and Color the Face
stroke(239, 204, 137);
fill(239,204,137);
beginShape();
curveVertex(xAnchor-.25*initialSize, yAnchor-.25*initialSize);
curveVertex(xAnchor-.25*initialSize, yAnchor-.25*initialSize);
curveVertex(xAnchor-.3*initialSize, yAnchor+.1*initialSize);
curveVertex(xAnchor-.2*initialSize, yAnchor+.3*initialSize);
curveVertex(xAnchor-.10*initialSize, yAnchor+.38*initialSize);
curveVertex(xAnchor+.1*initialSize, yAnchor+.33*initialSize);
curveVertex(xAnchor+.25*initialSize, yAnchor+.2*initialSize);
curveVertex(xAnchor+.24*initialSize, yAnchor-.25*initialSize);
curveVertex(xAnchor+.24*initialSize, yAnchor-.25*initialSize);
endShape();


// Glasses and Eyes
stroke(206, 213, 222);
fill(206, 213, 222);
ellipse(xAnchor+.03*initialSize, yAnchor+.03*initialSize, initialSize*.2, initialSize*.2);
ellipse(xAnchor-.25*initialSize, yAnchor+.03*initialSize, initialSize*.17, initialSize*.17);
noFill();
arc(xAnchor-.121*initialSize, yAnchor+.08*initialSize, .15*initialSize, .05*initialSize, PI, TWO_PI);
line(xAnchor+.1*initialSize, yAnchor+.08*initialSize, xAnchor+.25*initialSize, yAnchor-.06*initialSize);

stroke(240, 235, 235);
fill(240, 235, 235);
ellipse(xAnchor+.03*initialSize, yAnchor+.03*initialSize, initialSize*.18, initialSize*.18);
ellipse(xAnchor-.25*initialSize, yAnchor+.03*initialSize, initialSize*.15, initialSize*.15);

stroke(224, 220, 220);
fill(224, 220, 220);
arc(xAnchor-.25*initialSize, yAnchor+.09*initialSize, .1*initialSize, .05*initialSize, PI, TWO_PI);
arc(xAnchor+.03*initialSize, yAnchor+.095*initialSize, .13*initialSize, .07*initialSize, PI, TWO_PI);

stroke(147, 160, 175);
fill(147, 160, 175);
ellipse(xAnchor-.25*initialSize, yAnchor+.04*initialSize,.015*initialSize, .015*initialSize);
ellipse(xAnchor+.02*initialSize, yAnchor+.033*initialSize,.02*initialSize, .02*initialSize);



// Draw and color hair
noStroke();
fill(255, 255, 255);
beginShape();
curveVertex(xAnchor-.20*initialSize, yAnchor-.22*initialSize);
curveVertex(xAnchor-.26*initialSize, yAnchor-.20*initialSize);
curveVertex(xAnchor-.23*initialSize, yAnchor-.28*initialSize);
curveVertex(xAnchor+.19*initialSize, yAnchor-.32*initialSize);
curveVertex(xAnchor+.27*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor+.15*initialSize, yAnchor+.1*initialSize);
endShape();


fill(255);
beginShape();
curveVertex(xAnchor+.30*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor+.27*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor+.24*initialSize, yAnchor-.10*initialSize);
curveVertex(xAnchor+.21*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor+.18*initialSize, yAnchor-.10*initialSize);
curveVertex(xAnchor+.15*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor+.12*initialSize, yAnchor-.10*initialSize);
curveVertex(xAnchor+.09*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor+.06*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor+.03*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor-.00*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor-.03*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor-.06*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor-.09*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor-.12*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor-.15*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor-.18*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor-.21*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor-.24*initialSize, yAnchor-.1*initialSize);
curveVertex(xAnchor-.27*initialSize, yAnchor-.12*initialSize);
curveVertex(xAnchor-.3*initialSize, yAnchor-.12*initialSize);
endShape();

rect(xAnchor-.2745*initialSize, yAnchor-.25*initialSize, .5*initialSize, .13*initialSize);
rect(xAnchor+.17*initialSize, yAnchor-.18*initialSize, .1*initialSize, .13*initialSize);


// Draw and Color the Ear
stroke(239, 204, 137);
fill(239,204,137);
beginShape();
curveVertex(xAnchor+.2*initialSize, yAnchor);
curveVertex(xAnchor+.25*initialSize, yAnchor-.05*initialSize);
curveVertex(xAnchor+.29*initialSize, yAnchor-.06*initialSize);
curveVertex(xAnchor+.31*initialSize, yAnchor-.02*initialSize);
curveVertex(xAnchor+.315*initialSize, yAnchor);
curveVertex(xAnchor+.31*initialSize, yAnchor+.05*initialSize);
curveVertex(xAnchor+.3*initialSize, yAnchor+.12*initialSize);
curveVertex(xAnchor+.25*initialSize, yAnchor+.14*initialSize);
curveVertex(xAnchor+.2*initialSize, yAnchor+.14*initialSize);
endShape();


//Draw chin line
stroke(203,164,89);
noFill();
beginShape();
curveVertex(xAnchor-.2*initialSize, yAnchor+.53*initialSize);
curveVertex(xAnchor-.17*initialSize, yAnchor+.32*initialSize);
curveVertex(xAnchor-.05*initialSize, yAnchor+.33*initialSize);
curveVertex(xAnchor, yAnchor+.53*initialSize);
endShape();


// Draw Nose Line
beginShape();
curveVertex(xAnchor-.11*initialSize, yAnchor+.3*initialSize);
curveVertex(xAnchor-.11*initialSize, yAnchor+.2*initialSize);
curveVertex(xAnchor-.15*initialSize, yAnchor+.1*initialSize);
curveVertex(xAnchor-.0*initialSize, yAnchor+.1*initialSize);
endShape();


// Draw Initial 'S' in Ear
beginShape();
curveVertex(xAnchor+.28*initialSize, yAnchor+.01*initialSize);
curveVertex(xAnchor+.28*initialSize, yAnchor-.01*initialSize);
curveVertex(xAnchor+.27*initialSize, yAnchor+.01*initialSize);
curveVertex(xAnchor+.27*initialSize, yAnchor+.02*initialSize);
curveVertex(xAnchor+.29*initialSize, yAnchor+.04*initialSize);
curveVertex(xAnchor+.27*initialSize, yAnchor+.06*initialSize);
curveVertex(xAnchor+.2*initialSize, yAnchor-.01*initialSize);
endShape();


// Draw and Color Mustache
noStroke();
fill(255, 255, 255);
arc(xAnchor-.11*initialSize, yAnchor+.25*initialSize, initialSize*.3, initialSize*.2, PI, TWO_PI);
beginShape();
curveVertex(xAnchor+.07*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor+.04*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor+.03*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor+.01*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.01*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.03*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.05*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.07*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.09*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.11*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.13*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.15*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.17*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.19*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.21*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.23*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.25*initialSize, yAnchor+.26*initialSize);
curveVertex(xAnchor-.263*initialSize, yAnchor+.25*initialSize);
curveVertex(xAnchor-.27*initialSize, yAnchor+.26*initialSize);
endShape();

//saveFrame("hw2.jpg");
// TA - DA!!


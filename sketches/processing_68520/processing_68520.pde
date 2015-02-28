
//Lillie Ferris
//liferris@andrew.cmu.edu
//August 31st 2012

size(400, 400);
background(210);
smooth();
 
float x, y, diam;
x = 200;
y = 200;
diam = 300;

//Circle 3
noStroke();
fill(255, 255, 220);
ellipseMode(CENTER);
ellipse(x, y, diam + 40, diam + 40);

//Circle 2
noStroke();
fill(210);
ellipseMode(CENTER);
ellipse(x, y, diam + 20, diam + 20);

//Circle 1
noStroke();
fill(255);
ellipseMode(CENTER);
ellipse(x, y, diam, diam);

//L
stroke (210);
strokeWeight(10);
beginShape();
curveVertex(x - .40 * diam, y - .35 * diam);
curveVertex(x - .40 * diam, y - .31 * diam);
curveVertex(x - .40 * diam, y + .27 * diam);
curveVertex(x - .15 * diam, y + .47 * diam);
curveVertex(x - .00 * diam, y + .45 * diam);
endShape();

//I
stroke (210);
strokeWeight(10);
beginShape();
curveVertex(x, y - .50 * diam);
curveVertex(x, y - .50 * diam);
curveVertex(x, y + .50 * diam);
curveVertex(x, y + .50 * diam);
endShape();

//F
stroke (210);
strokeWeight(10);
beginShape();
curveVertex(x + .38 * diam, y + .05 * diam); 
curveVertex(x + .33 * diam, y + .05 * diam); //start of cross
curveVertex(x + .18 * diam, y + .05 * diam); //right before dip down
curveVertex(x + .18 * diam, y + .09 * diam);
curveVertex(x + .177 * diam, y + .47 * diam); //base of F
curveVertex(x + .20 * diam, y - .38 * diam); //top of F
curveVertex(x + .42 * diam, y - .25 * diam); 
curveVertex(x + .33 * diam, y - .20 * diam);
endShape();



size(100, 200);
background(156, 217, 255);

//bottom black stripe
fill(0);
noStroke();
arc(40, 75, 24, 24, PI+QUARTER_PI, TWO_PI+QUARTER_PI);

//bottom yellow stripe
fill(255, 288, 0);
noStroke();
arc(40, 75, 24, 24, QUARTER_PI, PI+QUARTER_PI);

//top black stripe
fill(0);
noStroke();
arc(52, 62, 24, 24, QUARTER_PI, PI+QUARTER_PI);

//top yellow stripe
fill(255, 288, 0);
noStroke();
arc(52, 62, 24, 24, PI+QUARTER_PI, TWO_PI+QUARTER_PI);

//head
fill(0);
noStroke();
ellipse(60, 54, 16, 16);

//antenna
strokeWeight(1);
stroke(0);
line(60, 54, 60, 38);
line(60, 54, 76, 54);

//antenna dots
fill(0);
noStroke();
ellipse(60, 38, 3, 3);
ellipse(76, 54, 3, 3);

//wings
fill(255);
noStroke();
bezier(40, 65, 0, 45, 40, 20, 40, 65);
bezier(52, 75, 100, 90, 60, 115, 52, 75);

//fly path
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(25, 90);
bezierVertex(15, 105, 35, 108, 45, 100);
bezierVertex(60, 92, 70, 105, 72, 110);
bezierVertex(75, 125, 65, 127, 60, 130);
bezierVertex(40, 133, 40, 148, 41, 150);
bezierVertex(41, 160, 60, 175, 75, 163);
endShape();




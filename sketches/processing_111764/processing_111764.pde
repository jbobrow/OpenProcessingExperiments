
// shapes lines etc,
size(288,112);
background(255,0,0);
fill(30,30,200);
quad(72,0,165,0,232,122,75,122);
fill(155,255,155);
rect(0,0,72,30);
line(0,10,72,10);
triangle(0,50,0,122,36,122);
fill(30,30,200);
triangle(232,122,225,0,165,0);
fill(155,255,155);
quad(225,0,226,20,288,20,288,0);
noStroke();
fill(255,255,0);
triangle(225,112,220,10,182,30);
noStroke();
triangle(180,27,165,0,190,0);
noStroke();
rect(40,34,5,70);
rect(10,60,60,5);
rect(280,34,5,80);
rect(235,60,80,5);

// hand shape
fill(140,90,10);
stroke(0);
strokeWeight(2);
beginShape();
curveVertex(120,0);
curveVertex(120,0);
//first curve
curveVertex(120,30);
//second curve
curveVertex(95,75);
//third curve
curveVertex(100,108);
//fourth curve
curveVertex(135,115);
//fifth curve
curveVertex(170,100);
//sixth curve
curveVertex(160,85);
//seventh curve
curveVertex(140,100);
//eight curve
curveVertex(144,56);
curveVertex(140,0);
curveVertex(140,0);
vertex(120,0);

endShape();


//sketch_140904d

size(600,400);

//fill(120,120);//second (b/w) or fourth (RGB) number is the transparent one
fill(120,0,240,180);
noStroke();
ellipse(100,200,200,200);
fill(60,180,240,180);
ellipse(200,200,200,200);

//curves, two functions with points in between
noFill();
stroke(0);
strokeWeight(5);
beginShape();
//curveVertex(x,y);
curveVertex(25,45);
curveVertex(37,160);
curveVertex(137,260);
curveVertex(370,120);
curveVertex(360,120);
curveVertex(160,40);
endShape();
strokeWeight(20);
stroke(120);
point(25,45);
point(37,160);
point(137,260);
point(370,120);
point(360,120);

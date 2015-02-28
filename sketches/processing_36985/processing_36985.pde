
size(300, 300);
background(70, 130, 180); // steel grey

smooth();
fill(0);
stroke(0);
beginShape();

curveVertex(190, 240); // the first control point
curveVertex(190, 240); // is also the start point of the curve

// draw body
curveVertex(130, 170);
curveVertex(120, 130);

// draw left fin
curveVertex(80, 150);
curveVertex(90, 125);
curveVertex(120, 95);

// draw head
curveVertex(122, 55);
curveVertex(140, 20);
curveVertex(160, 20);
curveVertex(172, 55);

// draw right fin
curveVertex(176, 98);
curveVertex(220, 129);
curveVertex(174, 125);

// draw body
curveVertex(175, 170);
curveVertex(200, 227);

// draw tail
curveVertex(230, 226);
curveVertex(250, 215);
curveVertex(230, 238);
curveVertex(210, 250);
curveVertex(215, 280);
curveVertex(195, 265);
curveVertex(190, 240);

curveVertex(190, 240); // last control point
endShape();
                


//drawing a smiley face with curveVertexes
size(450, 200);

background(120, 0, 255); //purple background
strokeWeight(4); //make the line 4 pixels wide
stroke(35, 240, 53); //bright green

// Eyes
fill(35, 240, 53);
ellipse(120, 50, 30, 30);
ellipse(330, 50, 30, 30);

//The Smile
noFill();
beginShape();
curveVertex(80, 120); // control point
curveVertex(80, 120); // start of smile
curveVertex(225, 160); //middle of the smile
curveVertex(370, 120); //end of smile
curveVertex(370, 120); //end conrol point
endShape();


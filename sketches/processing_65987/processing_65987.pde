
//Geometry 8.2.12

size(500,500);
background(255);

smooth();
fill(255,0,127);
strokeWeight(4); // 1  is the default
stroke(204, 102, 0);

beginShape();
curveVertex(0,0); 
curveVertex(200,200); 
curveVertex(300,20); 
curveVertex(500,400); 
curveVertex(500,500); 
vertex(500,500);
vertex(500,20);
curveVertex(0,0); 

endShape();


// http://processing.org/reference/beginShape_.html


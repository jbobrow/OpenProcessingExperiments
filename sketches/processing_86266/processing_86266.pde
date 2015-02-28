
// Homework 2 - 51-257 A
// © Joseph Oak 2013

// Setup
size(400, 400);
background(255, 230, 230);
smooth();
  
// X Y Variables
float x = 200;
float y = 210;
  
// Diameter Variable
float z = 220;

/*
// Bounding Circle
noFill();
ellipse(x, y, z, z);
*/
  
// "J"
noFill();
strokeWeight(3);
beginShape();
curveVertex(x + (z * .125), y - (z * .75));

curveVertex(x + (z * .125), y - (z * .75));
curveVertex(x + (z * .125), y - (z * .25));
curveVertex(x, y - (z * .125));
curveVertex(x - (z * .125), y - (z * .25));

curveVertex(x - (z * .125), y - (z * .75));
endShape();
  
// Glasses
  
  stroke(0);
  
  // Left Lens
  fill(255, 245, 245);
  beginShape();
  curveVertex(x - (z * .125), y - (z * .75));
  
  curveVertex(x - (z * .125), y - (z * .5));
  curveVertex(x - (z * .375), y - (z * .375));
  curveVertex(x - (z * .625), y - (z * .5));
  
  curveVertex(x - (z * .625), y - z);
  endShape();
   
  // Right Lens
  fill(255, 245, 245);
  beginShape();
  curveVertex(x + (z * .125), y - (z * .75));
  
  curveVertex(x + (z * .125), y - (z * .5));
  curveVertex(x + (z * .375), y - (z * .375));
  curveVertex(x + (z * .625), y - (z * .5));
  
  curveVertex(x + (z * .625), y - z);
  endShape();
    
  // Glasses Top
  noFill();
  beginShape();
  curveVertex(x - (z * .625), y - (z * .5));
  
  curveVertex(x - (z * .625), y - (z * .5));
  curveVertex(x + (z * .625), y - (z * .5));
  
  curveVertex(x + (z * .625), y - (z * .5));
  endShape();
    
// Glasses End
  
// Moustache
 
  // Top Curve
  noFill();
  beginShape();
  curveVertex(x - (z * .625), y);
  
  curveVertex(x - (z * .625), y + (z * .5));
  curveVertex(x, y - (z * .125));
  curveVertex(x + (z * .625), y + (z * .5));
  
  curveVertex(x + (z * .625), y);
  endShape(); 

  // Bottom Curve
  noFill();
  beginShape();
  curveVertex(x - (z * .625), y + (z * .5));
  
  curveVertex(x - (z * .625), y + (z * .5));
  curveVertex(x - (z * .125), y + (z * .25));
  curveVertex(x, y - (z * .125));
  curveVertex(x + (z * .125), y + (z * .25));
  curveVertex(x + (z * .625), y + (z * .5));
  
  curveVertex(x + (z * .625), y + (z * .5));
  endShape(); 
  
// Cheeks
noStroke();
fill(256, 150, 150);
ellipse(x - (z * .375), y - (z * .125), z * .125, z * .125);
ellipse(x + (z * .375), y - (z * .125), z * .125, z * .125);

// Eyes
fill(0);
noStroke();
ellipse(x - (z * .375), (y - (z * .5)) + (z * .025), z * .05, z * .05);
ellipse(x + (z * .375), (y - (z * .5)) + (z * .025), z * .05, z * .05);

//saveFrame("hw2.jpg");



// Copyright Shannon Impellicceiri 2014
// ICE #2
// 1/16/14

// Background
size(400,400);
background(255,0,150);

// Define variables
float screenWidth = 400;
float screenHeight = 400;
float shapeWidth = 200;
float shapeHeight = 200;
float centerX = screenWidth/2;
float centerY = screenHeight/2;

// Figure 8 curve
fill(0,255,220);
strokeWeight(5);
beginShape();
  curveVertex(centerX+shapeWidth/2,centerY-shapeHeight/4);
  curveVertex(centerX,centerY-shapeHeight/2);
  curveVertex(centerX-shapeWidth/4,centerY-shapeHeight/4);
  curveVertex(centerX+shapeWidth/2,centerY+shapeHeight/4);
  curveVertex(centerX,centerY+shapeHeight/2);
  curveVertex(centerX-shapeWidth/2,centerY+shapeHeight/4);
  curveVertex(centerX+shapeWidth/2,centerY-shapeHeight/4);
  curveVertex(centerX,centerY-shapeHeight/2);
  curveVertex(centerX-shapeWidth/2,centerY-shapeHeight/4);
 endShape();



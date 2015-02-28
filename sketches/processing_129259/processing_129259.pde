
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// HW #2
// 1/16/14

// background
size(400,400);
background(255);

// ADJUST INITIALS SIZE / POSITION HERE!!!!!!!
//***************************
float anchorInX = 200;
float anchorInY = 200;
float initialsDiameter = 200;

// ADJUST HEAD SIZE / POSITION HERE!!!!!!!
//***************************
float anchorX = 200;
float anchorY = 200;
float sizingFactor = 1;

// DEFINE OTHER VARIABLES
//***************************

// General
float theScreenWidth = 400;
float theScreenHeight = 400;

// Head
float headWidth = theScreenWidth*sizingFactor*.7;
float headHeight = theScreenHeight*sizingFactor*.7;

// Hair
float hairOffsetX = headWidth/12;
float hairOffsetY = headHeight/20;
float lowerHairline = anchorY+(hairOffsetY*3);

// Nose
float halfNoseWidth = headWidth/16;
float halfBridgeUpper = halfNoseWidth;
float halfBridgeLower = halfNoseWidth*4/3;
float topBridgeY = anchorY-(headHeight/2)+(hairOffsetY*8);
float nostrilHeight = halfBridgeLower;
float topNostrilY = lowerHairline-nostrilHeight;
float bottomNostrilY = lowerHairline;

// Moustache
float topMoustache = bottomNostrilY;
float bottomMoustache = bottomNostrilY+(nostrilHeight*1.5);

// Glasses
float initialsSizingFactor = initialsDiameter/200;
float frameWidth = theScreenWidth * initialsSizingFactor * .5;
float frameHeight = frameWidth /4;
float frameBridgeX = theScreenWidth/10*sizingFactor;
float frameLensX = (frameWidth - frameBridgeX)/2;
float innerDistXTop = frameBridgeX/2;
float innerDistXBottom = frameBridgeX;
float outerDistX = frameWidth/2;
float topFrameY = anchorInY - (theScreenHeight/10*initialsSizingFactor);
float bottomFrameY = topFrameY + frameHeight;

// Initials
float marginSpace = frameHeight/7;
float topY = topFrameY + marginSpace;
float bottomY = bottomFrameY - marginSpace;
float middleY = (topY+bottomY)/2;
float midTopY = (topY+middleY)/2;
float midBotY = (bottomY+middleY)/2;
float innerX = innerDistXBottom + marginSpace;
float middleX = (outerDistX + innerDistXBottom)/2;
float outerX = outerDistX - marginSpace;
float cornerMargin = marginSpace*2;

// DRAW CARICATURE
//***************************

// Head
fill(255,200,200);
stroke(0);
strokeWeight(3);
ellipse(anchorX,anchorY,headWidth,headHeight);

// Hair
fill(230);

beginShape();
  //left side
  vertex((anchorX-(headWidth/2)+hairOffsetX),(anchorY-(headHeight/2)));
  vertex((anchorX-(headWidth/2)-(hairOffsetX/2)),(anchorY-(headHeight/2)+(hairOffsetY*3)));
  vertex((anchorX-(headWidth/2)-(hairOffsetX/2)),(anchorY-(headHeight/2)+(hairOffsetY*8)));
  vertex((anchorX-(headWidth/2)+(hairOffsetX/4)),lowerHairline);
  vertex((anchorX-(headWidth/2)+(hairOffsetX*1.5)),(anchorY-(headHeight/2)+(hairOffsetY*4)));
  //right side
  vertex((anchorX+(headWidth/2)-(hairOffsetX*1.5)),(anchorY-(headHeight/2)+(hairOffsetY*4)));
  vertex((anchorX+(headWidth/2)-(hairOffsetX/4)),lowerHairline);
  vertex((anchorX+(headWidth/2)+(hairOffsetX/2)),(anchorY-(headHeight/2)+(hairOffsetY*8)));
  vertex((anchorX+(headWidth/2)+(hairOffsetX/2)),(anchorY-(headHeight/2)+(hairOffsetY*3)));
  vertex((anchorX+(headWidth/2)-hairOffsetX),(anchorY-(headHeight/2)));
endShape();

beginShape();
  // top curve
  curveVertex((anchorX-(headWidth/2)+(hairOffsetX/4)),(anchorY+(hairOffsetY*3)));
  curveVertex((anchorX-(headWidth/2)+hairOffsetX),(anchorY-(headHeight/2)));
  curveVertex((anchorX+(headWidth/2)-hairOffsetX),(anchorY-(headHeight/2)));
  curveVertex((anchorX+(headWidth/2)-(hairOffsetX/4)),(anchorY+(hairOffsetY*3)));
endShape();

// Moustache
fill(230);
noStroke();
beginShape();
  vertex(anchorX-(halfBridgeLower*2),bottomMoustache);
  vertex(anchorX-halfBridgeLower,topMoustache);
  vertex(anchorX+halfBridgeLower,topMoustache);
  vertex(anchorX+(halfBridgeLower*2),bottomMoustache);
endShape();

stroke(0);
line(anchorX-(halfBridgeLower*2),bottomMoustache,anchorX-halfBridgeLower,topMoustache);
line(anchorX+halfBridgeLower,topMoustache,anchorX+(halfBridgeLower*2),bottomMoustache);

beginShape();
  curveVertex(anchorX-(halfBridgeLower*2),topNostrilY);
  curveVertex(anchorX-(halfBridgeLower*2),bottomMoustache);
  curveVertex(anchorX+(halfBridgeLower*2),bottomMoustache);
  curveVertex(anchorX+(halfBridgeLower*2),topNostrilY);
endShape();

// Nose
fill(255,200,200);

beginShape();
  // left bridge
  vertex(anchorX-halfBridgeUpper,topBridgeY);
  vertex(anchorX-halfBridgeLower,topNostrilY);
endShape();

beginShape();
  // left nostril
  curveVertex(anchorX+halfBridgeLower,topNostrilY);
  curveVertex(anchorX-halfBridgeLower,topNostrilY);
  curveVertex(anchorX-halfBridgeLower,bottomNostrilY);
  curveVertex(anchorX+halfBridgeLower,bottomNostrilY);
endShape();

fill(255,200,200);
beginShape();
  // lower nose
  curveVertex(anchorX-halfBridgeLower,topNostrilY);
  curveVertex(anchorX-halfBridgeLower,bottomNostrilY);
  curveVertex(anchorX+halfBridgeLower,bottomNostrilY);
  curveVertex(anchorX+halfBridgeLower,topNostrilY);
endShape();

noFill();
beginShape();
  // right nostril
  curveVertex(anchorX-halfBridgeLower,bottomNostrilY);
  curveVertex(anchorX+halfBridgeLower,bottomNostrilY);
  curveVertex(anchorX+halfBridgeLower,topNostrilY);
  curveVertex(anchorX-halfBridgeLower,topNostrilY);
endShape();

beginShape();
  // right bridge
  vertex(anchorX+halfBridgeLower,topNostrilY);
  vertex(anchorX+halfBridgeUpper,topBridgeY);
endShape();

// Glasses frames
line(anchorInX - innerDistXTop,topFrameY,anchorInX + innerDistXTop,topFrameY);
fill(200,225,255);

// Left Lens
beginShape();
  vertex(anchorInX-innerDistXTop,topFrameY);
  vertex(anchorInX-outerDistX,topFrameY);
  vertex(anchorInX-outerDistX,bottomFrameY);
  vertex(anchorInX-innerDistXBottom,bottomFrameY);
endShape(CLOSE);

// Right Lens
beginShape();
  vertex(anchorInX+innerDistXTop,topFrameY);
  vertex(anchorInX+outerDistX,topFrameY);
  vertex(anchorInX+outerDistX,bottomFrameY);
  vertex(anchorInX+innerDistXBottom,bottomFrameY);
endShape(CLOSE);

// Initials
stroke(255);
strokeWeight(10*initialsSizingFactor);

// Letter S
beginShape();
  curveVertex(anchorInX-innerX,middleY);
  curveVertex(anchorInX-innerX,midTopY);
  curveVertex(anchorInX-middleX,topY);
  curveVertex(anchorInX-outerX,midTopY);
  //curveVertex(anchorInX-middleX,middleY);
  curveVertex(anchorInX-innerX,midBotY);
  curveVertex(anchorInX-middleX,bottomY);
  curveVertex(anchorInX-outerX,midBotY);
  curveVertex(anchorInX-outerX,middleY);
endShape();

// Letter I
beginShape();
  vertex(anchorInX+innerX,topY);
  vertex(anchorInX+outerX,topY);
endShape();

beginShape();
  vertex(anchorInX+middleX,topY);
  vertex(anchorInX+middleX,bottomY);
endShape();

beginShape();
  vertex(anchorInX+innerX,bottomY);
  vertex(anchorInX+outerX,bottomY);
endShape();




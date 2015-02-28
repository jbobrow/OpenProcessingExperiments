
// Standard Variables go here //////////////////////////////////////
int width = 200;
int height = 200;


// App-Specific Variables go here //////////////////////////////////

String roboMessage = "Does..Not..Compute.";

// Fill Colors                     Used on:
int white = 255;
int black = 0;
int fillA = 150;                // Head, Body
int fillB = 80;					// Neck
int fillC = 255;				// Eyes, Teeth
int fillD = 130;				// Chest Plate
int fill_BG = 40;               // Background, Neck Lines
int[] red = {255,0,0};
int[] blue = {0,255,255};
int[] green = {0,255,0};

// Head Stuff
int headW = 81;
int headH = 110;
int headX = (width/2) - (headW/2);
int headY = 40;
int eyeW = 35;
int eyeH = 35;
int eyeLX = headX + headW - eyeW;
int eyeRX = headX;
int eyeY = headY + 25;
int pupilStrokeW = 3;
int pupilStrokeColor = 40;
int pupilW = 8;
int pupilH = 8;
int pupilLX;
int pupilLY;
int pupilRX;
int pupilRY;

// Mouth Stuff
int toothQuantity = 8;
int toothW = 13;
int mouthH = toothW*2;
int toothH = mouthH;
int mouthW = toothQuantity*toothW + 1;
int mouthX = (width/2) - (mouthW/2);
int mouthY = headY+headH-mouthH-10;
int mouthOpenX = mouthX;
int mouthOpenY = mouthY + 5;
int mouthOpenW = mouthW;
int mouthOpenH = mouthH - 10;

// Antenna Stuff
int antennaW = 4;
int antennaH = 15;
int antennaX = (width/2)-(antennaW/2);
int antennaY = headY - antennaH;
int antBallX = width/2;
int antBallY = antennaY;
int antBallW = 10;
int antBallH = 10;

// Neck Stuff
int neckW = 30;
int neckH = 15;
int neckLines = 2;
int neckLineColor = fill_BG;
int neckX = (width/2)-(neckW/2);
int neckY = headY + headH;

// Body Stuff
int bodyW = 160;
int bodyH = 50;
int bodyX = (width/2)-(bodyW/2);
int bodyY = neckY + neckH;
int bodyChestW = 60;
int bodyChestH = 40;
int bodyChestX = (width/2) - (bodyChestW/2);
int bodyChestY = bodyY + 10;
int chestSpacing = 5;
int bodyScreenX = bodyChestX + chestSpacing;
int bodyScreenY = bodyChestY + chestSpacing;
int bodyScreenW = bodyChestW - 30;
int bodyScreenH = bodyChestH - 20;
int bodyButtonW = bodyChestW - bodyScreenW - 3*chestSpacing;
int bodyButtonH = bodyButtonW;
int bodyButtonX = bodyScreenX + bodyScreenW + chestSpacing;
int bodyButtonY = bodyScreenY;


// Flashing Stuff
int bars = 8;
int counter = 1;

////////////////////////////////////////////////////////////////////



// Setup App ///////////////////////////////////////////////////////

void setup() {
  // Basic Stuff
  size(width,height);
  colorMode(RGB);
  background(fill_BG);
  smooth();
  noStroke();
  // End Basic Stuff
}


// Draw App /////////////////////////////////////////////////////////


/*
Ideally the draw area wouldn't have so much in it, but unfortunately
I'm not sure if there's another way to make the background go crazy
without re-drawing everything each time. Is there a way?
*/

void draw() {
  // Crazy Background
  if (mousePressed && mouseX > bodyButtonX && mouseX < (bodyButtonX+bodyButtonW) && mouseY > bodyButtonY && mouseY < (bodyButtonY+bodyButtonH) ) {
	background(255,0,0);
	  if (counter<=30) {
	    for (int i=0; i<width; i+=((width/bars)*2)) {
	      noStroke();
	      fill(255,255,0);
	      rect(i,0,(width/bars),height);
	      counter += 1;
	    }
	  } else {
	    for (int i=(width/bars); i<width; i+=((width/bars)*2)) {
	      noStroke();
	      fill(255,255,0);
	      rect(i,0,(width/bars),height);
	      counter = 1;
	    }
	  }
  } else {
	background(fill_BG);
  } 
  // Crazy Background End
 
  
  // Neck
  rectMode(CORNER);
  noStroke();
  fill(fillB);
  rect( neckX, neckY, neckW, neckH);
  // Make lines on the neck that will auto-space themselves depending on how many lines you want
  // I can't figure out how to remove the last line at the bottom though... Thoughts?
  for ( int i = (neckH/(neckLines+1)); i < neckH; i += (neckH/(neckLines+1))) {
    stroke(fill_BG);
    strokeWeight(1);
    line((width/2)-(neckW/2),(neckY+i),(width/2)+(neckW/2)-1,(neckY+i));
  }
  // Neck End

  // Head
  fill(fillA);
  noStroke();
  rectMode(CORNER);      
  rect(headX, headY, headW, headH);
  // Head End

  // Body
  rectMode(CORNER);
  fill(fillA);
  rect(bodyX,bodyY,bodyW,bodyH);
  fill(fillD);
  rect(bodyChestX,bodyChestY,bodyChestW,bodyChestH);
  fill(blue[0],blue[1],blue[2]);
  rect(bodyScreenX,bodyScreenY,bodyScreenW,bodyScreenH);
  ellipseMode(CORNER);
  fill(green[0],green[1],green[2]);
  ellipse(bodyButtonX, bodyButtonY, bodyButtonW, bodyButtonH);
  // Body End

  // Antenna
  rectMode(CORNER);
  noStroke();
  fill(fillB);
  rect(antennaX, antennaY, antennaW, antennaH);
  ellipseMode(CENTER);
  fill(red[0],red[1],red[2]);
  ellipse(antBallX,antBallY,antBallW,antBallH);
  // Antenna End

  // Eyes
  noStroke();
  fill(white);
  rect(eyeLX,eyeY,eyeW,eyeH);
  rect(eyeRX,eyeY,eyeW,eyeH);

  // Mouth
  noStroke();
  fill(white);
  rect(mouthX, mouthY, mouthW, mouthH);
  strokeWeight(1);
  stroke(200);
  line(mouthX, (mouthY+(mouthH/2)), (mouthX+mouthW)-1, (mouthY+(mouthH/2))-1);
  for ( int i = toothW; i < 1+(mouthW-toothW); i += (toothW)) {
    line(i+mouthX, mouthY, i+mouthX, mouthY+toothH-1);
  }
  // Mouth End

  // Eyes
  noStroke();
  fill(white);
  rect(eyeLX,eyeY,eyeW,eyeH);
  rect(eyeRX,eyeY,eyeW,eyeH);
  strokeWeight(pupilStrokeW);
  stroke(pupilStrokeColor);
  fill(white);
  rectMode(CORNER);
  pupilLX = ((mouseX+pmouseX)/20)+117;
  pupilLY = ((mouseY+pmouseY)/16)+68;
  pupilRX = ((mouseX+pmouseX)/20)+63;
  pupilRY = ((mouseY+pmouseY)/16)+68;
  pupilLX = constrain(pupilLX, eyeLX+pupilStrokeW, (eyeLX+eyeW-2*pupilStrokeW-pupilW));
  pupilLY = constrain(pupilLY, eyeY+pupilStrokeW, (eyeY+eyeH-2*pupilStrokeW-pupilW));
  pupilRX = constrain(pupilRX, eyeRX+pupilStrokeW, (eyeRX+eyeW-2*pupilStrokeW-pupilW));
  pupilRY = constrain(pupilRY, eyeY+pupilStrokeW, (eyeY+eyeH-2*pupilStrokeW-pupilW));
  rect(pupilLX,pupilLY,pupilW,pupilH);
  rect(pupilRX,pupilRY,pupilW,pupilH);
  // Eyes End
  
  // Opening Mouth + Crazy Eyes
  if (mousePressed && mouseX > bodyButtonX && mouseX < (bodyButtonX+bodyButtonW) && mouseY > bodyButtonY && mouseY < (bodyButtonY+bodyButtonH) ) {
	// Mouth Open
	  fill(fillB);
	  noStroke();
	  rect(mouthOpenX, mouthOpenY, mouthOpenW, mouthOpenH);
	// Pupils Freeze
	  noStroke();
	  fill(white);
	  rect(eyeLX,eyeY,eyeW,eyeH);
	  rect(eyeRX,eyeY,eyeW,eyeH);
	  strokeWeight(pupilStrokeW);
	  stroke(pupilStrokeColor);
	  fill(white);
	  //rect(eyeRX+eyeW-pupilW-4,eyeY+eyeH-pupilH-3,pupilW,pupilH);
	  //rect(eyeLX+4,eyeY+4,pupilW,pupilH);
	  pupilLX = int(random(eyeLX+pupilStrokeW, (eyeLX+eyeW-2*pupilStrokeW-pupilW)));
	  pupilLY = int(random(eyeY+pupilStrokeW, (eyeY+eyeH-2*pupilStrokeW-pupilW)));
	  pupilRX = int(random(eyeRX+pupilStrokeW, (eyeRX+eyeW-2*pupilStrokeW-pupilW)));
	  pupilRY = int(random(eyeY+pupilStrokeW, (eyeY+eyeH-2*pupilStrokeW-pupilW)));
	  rect(pupilLX,pupilLY,pupilW,pupilH);
	  rect(pupilRX,pupilRY,pupilW,pupilH);
  }
  // Opening Mouth End
}


// Print Message
void mousePressed() {
  if (mouseX > bodyButtonX && mouseX < (bodyButtonX+bodyButtonW) && mouseY > bodyButtonY && mouseY < (bodyButtonY+bodyButtonH)) {
	println(roboMessage);
  }
}


// Reset Everything
void mouseReleased() {
  // Close the mouth again
  noStroke();
  fill(white);
  rect(mouthX, mouthY, mouthW, mouthH);
  strokeWeight(1);
  stroke(200);
  line(mouthX, (mouthY+(mouthH/2)), (mouthX+mouthW)-1, (mouthY+(mouthH/2))-1);
  for ( int i = toothW; i < 1+(mouthW-toothW); i += (toothW)) {
    line(i+mouthX, mouthY, i+mouthX, mouthY+toothH-1);
  }
}




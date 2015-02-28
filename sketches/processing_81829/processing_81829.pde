
// ©2012 Gaston Yagmourian
// yagmourian.com/gaston
// gastony@gmail.com

// Draws multiple circles (with specific random colours) using nested for loop
// and outputs to PDF when space bar is pressed.
// Simplified code using custom functions and arrays

// All values now relative to each other:
// width/height will be filled with as many gridCells as possible.

// Another nice update in this version:
// window size and PDF output are no longer linked,
// so window can be smaller but the PDF will have proper dimensions.



// // imports PDF library
// import processing.pdf.*;

// sets grid cell unit size
float gridCell = 30;				// for business card, use 100 here

// turns gridCell into 100
float relGridCell = map(gridCell, 0, gridCell, 0, 100);

// sets colour values
color customColour[]={
	#E87D1E,	// custom Orange
	#A1CD45,	// custom Green
	#8D64AA,	// custom Purple
	#4B63AE,	// custom Blue
	#F05133,	// custom Red
	#45BFB4,	// custom Turquoise
	#E4E5E6		// custom LightGray
};

// defines toggle and count variables
int toggle, count;

// general setup
void setup(){
	size(390, 390);			// for business card, use (1600, 900) here
	noLoop();				// stops the sketch from updating until redraw() is called
	smooth();
}

// 
void draw(){
	background(255);
	drawHoldingShape();
	// nested for loops arranges shapes in a grid
	for (float x = relGridCell*0.5; x < (width/gridCell)*relGridCell; x = x+relGridCell){
		for (float y = relGridCell*0.5; y < (height/gridCell)*relGridCell; y = y+relGridCell){
	
			// toggles between colours and draws shape
			setStrokeCustomColour();
			drawShape(x, y);

			// toggles between colours and draws shape
			setStrokeCustomColour();
			drawShape(x, y);
		}
	}	
}

// ------------------------------------------------------------

// function toggles between colour variables
void setStrokeCustomColour(){
	toggle = int(random(7));
	stroke(customColour[toggle]);
	fill(customColour[toggle]);
}

// function toggles between shapes to draw
void drawShape(float xpos, float ypos){
	toggle = int(random(13));
	if (toggle == 12){
		drawCircleSmall(xpos, ypos);
	} else if (toggle == 11) {
		drawCircleMid(xpos, ypos);
	} else if (toggle == 10) {
		drawCircleBig(xpos, ypos);
	} else if (toggle == 9) {
		diagonalSmallDown(xpos, ypos);
	} else if (toggle == 8) {
		diagonalMidDown(xpos, ypos);
	} else if (toggle == 7) {
		diagonalBigDown(xpos, ypos);
	} else if (toggle == 6) {
		diagonalSmallUp(xpos, ypos);
	} else if (toggle == 5) {
		diagonalMidUp(xpos, ypos);
	} else if (toggle == 4) {
		diagonalBigUp(xpos, ypos);
	} else if (toggle == 3) {
		drawLineOneHorz(xpos, ypos);
	} else if (toggle == 2) {
		drawLineTwoHorz(xpos, ypos);
	} else if (toggle == 1) {
		drawLineOneVert(xpos, ypos);
	} else {
		drawLineTwoVert(xpos, ypos);
	}
}

// ------------------------------------------------------------

// function draws a white rectangle in the background
// used to align to business card grid in Illustrator
void drawHoldingShape(){
	noStroke();
	fill(255);
	rect(0, 0, width, height);
}

// function draws circleSmall
void drawCircleSmall(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noStroke();   
	ellipse(xpos, ypos, relGridCell*0.17, relGridCell*0.17);
	popMatrix();
}

// function draws circleMid
void drawCircleMid(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	ellipse(xpos, ypos, relGridCell*0.30, relGridCell*0.30);
	popMatrix();
}

// function draws circleBig
void drawCircleBig(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	ellipse(xpos, ypos, relGridCell*0.78, relGridCell*0.78);
	popMatrix();
}

// function draws diagonalSmallDown
void diagonalSmallDown(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos+34, ypos-37, xpos+37, ypos-34);
	line(xpos-37, ypos+34, xpos-34, ypos+37);
	popMatrix();
}

// function draws diagonalMidDown
void diagonalMidDown(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos, xpos, ypos+37);
	line(xpos, ypos-37, xpos+37, ypos);
	popMatrix();
}

// function draws diagonalBigDown
void diagonalBigDown(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos-37, xpos+37, ypos+37);
	popMatrix();
}

// function draws diagonalSmallUp
void diagonalSmallUp(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos-34, xpos-34, ypos-37);
	line(xpos+34, ypos+37, xpos+37, ypos+34);
	popMatrix();
}

// function draws diagonalMidUp
void diagonalMidUp(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos, xpos, ypos-37);
	line(xpos, ypos+37, xpos+37, ypos);
	popMatrix();
}

// function draws diagonalBigUp
void diagonalBigUp(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos+37, xpos+37, ypos-37);
	popMatrix();
}

// function draws lineOneHorz
void drawLineOneHorz(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos, xpos+37, ypos);
	popMatrix();
}

// function draws linesTwoHorz
void drawLineTwoHorz(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos-37, xpos+37, ypos-37);
	line(xpos-37, ypos+37, xpos+37, ypos+37);
	popMatrix();
}

// function draws lineOneVert
void drawLineOneVert(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos, ypos-37, xpos, ypos+37);
	popMatrix();
}

// function draws linesTwoVert
void drawLineTwoVert(float xpos, float ypos){
	pushMatrix();
	// translate(xpos*0.5, ypos*0.5);
	scale(gridCell/100);
	noFill();
	strokeCap(ROUND);
	strokeJoin(ROUND);
	strokeWeight(relGridCell*0.13);
	line(xpos-37, ypos-37, xpos-37, ypos+37);
	line(xpos+37, ypos-37, xpos+37, ypos+37);
	popMatrix();
}

// ------------------------------------------------------------

// upon mouse click, reassigns custom colours to circles
void mousePressed(){
	// PDF recording
	// beginRecord(PDF,"pattern"+count+".pdf");
	redraw();
}

// ------------------------------------------------------------

// if spacebar is pressed, value of count is increased, and PDF is saved
void keyPressed(){
	if (key == ' '){
		count++;		
		// endRecord();
	}	
	if (key == 27){
		exit();
	}
}



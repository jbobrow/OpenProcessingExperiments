
//The sketch is a random, continuous composition of fictitious skylines. The background sky changes to reference different times of day, dusk, and night.

void setup() {
  size(600, 300);
  background(2, 11, 33);
  smooth();
  rectMode(CORNERS);  // sets the rect syntax to specify the coordinates of the top left corner and the bottom right corner
}

float count = 40;
float buildings;
float spread;
float wdthVary;
float htVary;
float bkgrdColorPulse;
Boolean ground;

void draw() {

  if (count > 0) {  // count is less than num is true; this sets the following tests into motion
    buildings = random(1, 18);  // introduces probability; randomly a number between 1 and 12 will be used and affect the fill color of the building
    if ((buildings >= 1) && (buildings <= 6)) { //so now if the random test result falls between 10 and 100, the building will be dark grey
      fill(69, 75, 129);  // periwinkle buildings
      strokeWeight(.5);
      stroke(200);
    }
    
    if ((buildings >= 7) && (buildings <= 12)) { //so now if the random test result falls between 10 and 100, the building will be dark grey
      fill(48, 55, 72);  // grey buildings
      strokeWeight(.5);
      stroke(150);
      
    }
    if ((buildings >= 13) && (buildings <= 18)) { //so now if the random test result falls between 10 and 100, the building will be dark grey
      fill(28, 37, 59);  // navy buildings
      strokeWeight(.5);
      stroke(150);
      
    }
    if (count % 40 == 0) {  // this makes the background reset when building count equals 40; each cycle is actually looping on top of the previous one (it is not resetting or loopin in the literal sense)
      bkgrdColorPulse = random(0, 50);  // this makes the background color change within a random, but constrained range of blues to bluish greys
      background(2+bkgrdColorPulse, 11+bkgrdColorPulse, 33+bkgrdColorPulse);
      
    }
    else {

      if (count % 160 == 4) {  // this makes the background reset when building count equals 160; each cycle is actually looping on top of the previous one (it is not resetting or loopin in the literal sense)
        background(177, 214, 250);
      }

      spread = random(1, 599);  // makes the buldings spread randomly across the width of the sketch screen
      wdthVary = random(20, 60);  // makes the buidling widths vary randomly with a constrained range
      htVary = random(50, 200);  // makes the building heights vary randomly with a constrained range
      rect(spread, htVary, spread + wdthVary, 260);
      // I want the x axis of the top left corner to vary across the sketch window from edge to edgle
      // I want the y axis of the top left corner to vary randomly in height
      // I want the x axis of the bottom right corner to vary in width, but in relationship to the top left corner's x coordinate
      // I want the y axis fo the bottom left corner to be constrained to the 260 y coordinate near, but not all the way to the bottom of the sketch border
    }
    count++;
  }
}

//How do I slow down the speed?

//How do I put a ground plan into the sketch? I the code below, but the black and grey50 would randomly appear in the buildings as well.

//if (count % 40 == 0) {
  //bkgrdColorPulse = random(0, 50);
  //background(2+bkgrdColorPulse, 11+bkgrdColorPulse, 33+bkgrdColorPulse);
  //strokeWeight(40);
  //stroke(0);
  //line(0, 280, width, 280);
  
//}
//else {

  //if (count % 160 == 4) {
    //background(177, 214, 250);
    //strokeWeight(40);
    //stroke(50);
    //line(0, 280, width, 280);



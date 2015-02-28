
// MAPPING ----------------------------

//float circOneX;
//float circTwoX;
//float circThreeX;
//
//void setup() {
//  size(500, 500);
//}
//
//void draw() {
//  background(255);
//  
//  rect(0, 200, 100, 50);
//  rect(0, 300, 200, 50);
//  rect(0, 400, 500, 50);
//  
//  circOneX = map(mouseX, 0, width, 0, 100);
//  circTwoX = map(mouseX, 0, width, 0, 200);
//  circThreeX = map(mouseX, 0, width, 0, 500);
//  
//  ellipse(circOneX, 255, 5, 5);
//  ellipse(circTwoX, 325, 5, 5);
//  ellipse(circThreeX, 425, 5, 5);
//  
//  println("mouseX: " + mouseX);
//  println("c1: " + circOneX);
//  println("c2: " + circTwoX);
//  println("c3: " + circThreeX);
//}



// MAPPING with COLOR -----------------------
//float myRed;
//float myGreen;
//
//void setup() {
//  size(500, 500);
//  background(255);
//  noStroke();
//}
//
//void draw() {
//  myRed = map(mouseX, 0, width, 0, 255);
//  myGreen = map(mouseY, 0, height, 0, 255);
//  
//  fill(myRed, myGreen, 100);
//  ellipse(width/2, height/2, width, height);
//}




// MAPPING with ALPHA ---------------------------
//float myAlpha;
//
//void setup() {
//  size(500, 500);
//  background(#ededed);
//  noStroke();
//}
//
//void draw() {
//  background(#ededed);
//  myAlpha = map(mouseY, height, 0, 0, 255);
//  
//  fill(255, 0, 0, myAlpha);
//  ellipse(width/2, height/2, width, height);
//  
//  println("mY: " + mouseY + " myAlpha: " + myAlpha);
//}



// TIME -----------------------------------------
// **********************************************************
// *    second();                                        // *
// *    minute();                                        // *
// *    hour();                                          // *
// *    day();                                           // *
// *    month();                                         // *
// *    year();                                          // *
// **********************************************************
// *    millis(); // starts counting when applet starts  // *
// **********************************************************



// VISUAL CLOCK ----------------------------------
PFont font;

float hourX;
float minuteX;
float secondX;

void setup() {
  size(300, 300);
  font = createFont("Helvetica", 24);
  noStroke();
}

void draw() {
  background(120);
  fill(240);
  textFont(font);
  text((hour() + ":" + minute() + ":" + second()), 10, 40);
  
  hourX = map(hour(), 0, 23, 0, width);
  minuteX = map(minute(), 0, 59, 0, width);
  secondX = map(second(), 0, 59, 0, width);
  
  fill(255, 200, 0);
  rect(0, 100, hourX, 50);
  fill(200, 135, 200);
  rect(0, 150, minuteX, 50);
  fill(164, 220, 240);
  rect(0, 200, secondX, 50);
}



// FLICKERING LIGHTBULB with millis() -------------------------------

//int timeOffMax = 2000;
//int timeOnMax = 4000;
//int timeOffCurrent;
//int timeOnCurrent;
//int lastSavedTime;
//
//boolean lightIsOn = false;
//
//void setup() {
//  size(400, 400);
//  lastSavedTime = millis();
//}
//
//void draw() {
//  background(200);
//  
//  if (lightIsOn == true) {
//    fill(255, 255, 0);
//    timeOnCurrent = millis() - lastSavedTime;
//    if (timeOnCurrent > timeOnMax) {
//      lightIsOn = false;
//      lastSavedTime = millis();
//      println("Switched Off");
//    }
//  }
//  else {
//    noFill();
//    timeOffCurrent = millis() - lastSavedTime;
//    if (timeOffCurrent > timeOffMax) {
//      lightIsOn = true;
//      lastSavedTime = millis();
//      println("Switched On");
//    }    
//  }
//  
//  ellipse(200, 200, 100, 100);
//}



// ASSIGNMENT: Create an interesting clock


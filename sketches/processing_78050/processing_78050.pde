
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77766*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage brain;
float[] youngShort;
float[] youngLong;
float[] youngAge;
float[] oldShort;
float[] oldLong;
float[] oldAge;

String[] page;

boolean key1 = false;
boolean key2 = false;
boolean key3 = false;
boolean key4 = false;
boolean key5 = false;




void setup() {
  size(600, 600);
  brain = loadImage("brain.png");
  bg();
  page = loadStrings("data1.csv");  // save in data folder
  youngShort = new float[1];
  youngLong = new float[1];
  youngAge = new float[1];
  oldShort = new float[1];
  oldLong = new float[1];
  oldAge = new float[1];
}
int x=0;
void draw() {
  youngShort[0] = float(page[0]);
  youngLong[0] = float(page[1]);
  youngAge[0] = float(page[2]);
  oldShort[0] = float(page[3]);
  oldLong[0] = float(page[4]);
  oldAge[0] = float(page[5]);
//----- example----/
/*
pushMatrix();
translate(300,300);
rotate(radians(90));
text("test",0,0,10);
popMatrix();
*/
//------example----/




  if (keyPressed) { 
    if (key == '1') {   

      Key1();
    }
  }

  // Second rectangle for the first key press.
  if ( key1 == true && ((mouseX > 300 && mouseX < 335)  && (mouseY >215 && mouseY < 380 ))) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(300, height-220, 32, -163);
    text("Long Term Memory in Younger Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(323,380);
      rotate(radians(270));
      text(+youngLong[0], 0, 0);
    popMatrix();
    
  }

  if (key1 == true && ((mouseX > 0 && mouseX < 300) || (mouseX > 330 && mouseX < 600) || (mouseY > 0 && mouseY < 215 ) || (mouseY > 380 && mouseY < 600))) {
    Key1();
  } 

  // First rectangle for the first key press.
  if ( key1 == true && (mouseX > 265 && mouseX < 295)  && (mouseY > 290 && mouseY < 380 )) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(260, height-220, 32, -93);
    text("Short Term Memory in Younger Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(282,380);
      rotate(radians(270));
      text(youngShort[0], 0, 0);
    popMatrix();
    
  }










  // Key 2 Buttons.

  if (keyPressed) { 
    if (key == '2') {   

      Key2();
    }
  }

  // Second rectangle for the second key press.
  if ( key2 == true && (mouseX > 300 && mouseX < 335)  && (mouseY >164 && mouseY < 380)) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(300, height-220, 32, -216);
    text("Long Term Memory in Older Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(323,380);
      rotate(radians(270));
      text(oldLong[0], 0, 0);
    popMatrix();
      
  }


  if (key2 == true && ((mouseX > 0 && mouseX < 300) || (mouseX > 330 && mouseX < 600) || (mouseY > 0 && mouseY < 164 ) || (mouseY > 380 && mouseY < 600))) {
    Key2();
  }    

  // First rectangle for the second key press.
  if ( key2 == true && (mouseX > 265 && mouseX < 295)  && (mouseY > 290 && mouseY < 380 )) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(260, height-220, 32, -68);
    text("Short Term Memory in Older Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(282,380);
      rotate(radians(270));
      textSize(18);
      text(oldShort[0], 0, 0);
      textSize(20);
    popMatrix();
    
  }    




  // Key 3 Buttons.

  if (keyPressed) { 
    if (key == '3') {   

      Key3();
    }
  }

  // Second rectangle for the third key press.
  if ( key3 == true && (mouseX > 300 && mouseX < 335)  && (mouseY > 217 && mouseY < 380)) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(300, height-220, 32, -163);
    text("Short Term Memory in Young Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(323,380);
      rotate(radians(270));
      text(youngShort[0], 0,0);
    popMatrix();
      
  }


  if (key3 == true && ((mouseX > 0 && mouseX < 300) || (mouseX > 330 && mouseX < 600) || (mouseY > 0 && mouseY < 217 ) || (mouseY > 380 && mouseY < 600))) {
    Key3();
  }    

  // First rectangle for the third key press.
  if ( key3 == true && (mouseX > 265 && mouseX < 295)  && (mouseY > 163 && mouseY < 380 )) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(260, height-220, 32, -215);
    text("Short Term Memory in Older Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(282,380);
      rotate(radians(270));
      text(oldShort[0], 0, 0);
    popMatrix();
    
  }    




  // Key 4 Buttons.

  if (keyPressed) { 
    if (key == '4') {   

      Key4();
    }
  }

  // Second rectangle for the fourth key press.
  if ( key4 == true && (mouseX > 300 && mouseX < 335)  && (mouseY > 287 && mouseY < 380)) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(300, height-220, 32, -93);
    text("Long Term Memory in Young Adults", 100, 400);
     pushMatrix();
      fill(0);
      translate(323,380);
      rotate(radians(270));
      text(youngLong[0], 0, 0);
    popMatrix();
     
  }

  if (key4 == true && ((mouseX > 0 && mouseX < 300) || (mouseX > 330 && mouseX < 600) || (mouseY > 0 && mouseY < 287 ) || (mouseY > 380 && mouseY < 600))) {
    Key4();
  }    

  // First rectangle for the fourth key press.
  if ( key4 == true && (mouseX > 265 && mouseX < 295)  && (mouseY > 312 && mouseY < 380 )) {

    stroke(0);
    strokeWeight(5);
    fill(255, 200, 0);
    rect(260, height-220, 32, -68);
    text("Long Term Memory in The Older Adults", 100, 400);
    pushMatrix();
      fill(0);
      translate(282,380);
      rotate(radians(270));
      textSize(18);
      text(oldLong[0], 0, 0);
      textSize(20);
    popMatrix();
      
  }    



  if (key == '5') {
    findings();
  }
}

void findings() {
  PFont font;
  font = loadFont("CopperplateGothic-Bold-48.vlw");
  image (brain, 0, 0);
  fill (255);
  textFont(font, 40);
  text ("What we aim to prove.....", 25, 70);
  textFont(font, 18);
  text ("(In conjunction with Michael Crabb and SiDE)", 40, 95);
  text ("* Younger adults have a low short term memory", 40, 170);
  text ("  but good long term memory", 40, 195);
  text ("* Older adults have quite a low short term memory", 40, 250);
  text ("  but very high long term memory", 40, 275);
  text ("* Although close, younger adults have a better ", 40, 330);
  text ("  short term memory than older adults", 40, 355);
  text ("* Older adults have a better long term ", 40, 405);
  text ("  memory compared to younger adults", 40, 430);
}
void bg() {
  image(brain, 0, 0);
  PFont font;
  fill (255);
  font = loadFont("CopperplateGothic-Bold-48.vlw");
  textFont(font, 70);
  text("Memory Span", 40, 60);
  text("Comparisons", 45, 130);
  textFont(font, 20);
  text("Press Key", 245, 465);
  text("1. Short Term vs Long Term in Younger Adults", 40, 505);
  text("2. Short Term vs Long Term in Older Adults", 40, 525);
  text("3. Younger Adults vs Older Adults - Short Term", 40, 545);
  text("4. Younger Adults vs Older Adults - Long Term", 40, 565);
  text("5. What we aim to prove.....", 40, 585);
}

void Key1() {
  bg();
  if (keyPressed) {
    if (key == '1') {
      key1 = true;
    }
  }
  key2 = false;
  key3 = false;
  key4 = false;
  key5 = false;  

  stroke(255);
  strokeWeight(5);  
  float y = map(youngShort[0], 0.5, 0.75, 0, 140);
  fill(255, 0, 0);
  rect(300, height-220, 32, y-200);

  float o = map(youngLong[0], 0.5, 0.75, 0, 140);
  fill(0, 255, 0);
  rect(260, height-220, 32, o-200);
}

void Key2() {
  bg();
  key1 = false;
  if (keyPressed) {
    if (key == '2') {
      key2 = true;
    }
  }
  key3 = false;
  key4 = false;
  key5 = false; 

  stroke(255);
  strokeWeight(5);
  float y = map(oldShort[0], 0.5, 0.75, 0, 140);
  fill(255, 0, 0);
  rect(300, height-220, 32, y-200);

  float o = map(oldLong[0], 0.5, 0.75, 0, 140);
  fill(0, 255, 0);
  rect(260, height-220, 32, o-200);
}

void Key3() {
  bg();
  key1 = false;
  key2 = false;
  if (keyPressed) {
    if (key == '3') {
      key3 = true;
    }
  }
  key4 = false;
  key5 = false; 

  stroke(255);
  strokeWeight(5);
  float y = map(youngShort[0], 0.5, 0.75, 0, 140);
  fill(255, 0, 0);
  rect(300, height-220, 32, y-200);
  float o = map(oldShort[0], 0.5, 0.75, 0, 140);
  fill(0, 255, 0);
  rect(260, height-220, 32, o-200);
}

void Key4() {
  bg();
  key1 = false;
  key2 = false;
  key3 = false;
  if (keyPressed) {
    if (key == '4') {
      key4 = true;
    }
  }
  key5 = false; 


  stroke(255);
  strokeWeight(5);
  float y = map(youngLong[0], 0.5, 0.75, 0, 140);
  fill(255, 0, 0);
  rect(300, height-220, 32, y-200);
  float o = map(oldLong[0], 0.5, 0.75, 0, 140);
  fill(0, 255, 0);
  rect(260, height-220, 32, o-200);
}



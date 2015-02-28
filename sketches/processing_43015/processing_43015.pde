
int oldMouseX, oldMouseY;
color myPenStroke;
int myPenWeight;
PFont programFont;
String tool;
boolean clear = false; 

void setup() {
  size(800, 800);
  smooth();
  oldMouseX = 0;
  oldMouseY = 0;
  myPenStroke = color(0, 0, 0);
  myPenWeight = 1;
  programFont= loadFont ("textFont.vlw"); 
  textFont (programFont, 25);
  tool = "Tools";
  background (#E8DCDC);
  line (175, 0, 175, 800);
  fill (0);
  text (tool, 40, 30); 
  fill (#2723B7);
  text ("Colors", 10, 50);
  text ("Line Effects", 10, 120);
  text ("Erase", 10, 200);
  text ("Clear Screen", 10, 310);
}

void draw( ) {
  strokeWeight(myPenWeight);
  stroke(myPenStroke);
  if (mousePressed) {
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line(mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;

  //color buttons
  //red button
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  ellipse(20, 80, 20, 20);
  if (mousePressed && dist(20, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(255, 0, 0);
  }
  //green button
  fill(0, 255, 0);
  stroke(0);
  strokeWeight(1);
  ellipse(40, 80, 20, 20);
  if (mousePressed && dist(40, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(0, 255, 0);
  }
  //blue button
  fill(0, 0, 255);
  stroke(0);
  strokeWeight(1);
  ellipse(60, 80, 20, 20);
  if (mousePressed && dist(60, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(0, 0, 255);
  }
  //black button
  fill(0);
  stroke(0);
  strokeWeight(1);
  ellipse(80, 80, 20, 20);
  if (mousePressed && dist(80, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(0);
  } 
  //white button
  fill(255, 255, 255);
  stroke(0);
  strokeWeight(1);
  ellipse(100, 80, 20, 20);
  if (mousePressed && dist(100, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(255, 255, 255);
  } 
  //orange button
  fill(#FF7E05);
  stroke(0);
  strokeWeight(1);
  ellipse(120, 80, 20, 20);
  if (mousePressed && dist(120, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(#FF7E05);
  } 
  //yellow button
  fill(#FEFF03);
  stroke(0);
  strokeWeight(1);
  ellipse(140, 80, 20, 20);
  if (mousePressed && dist(140, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(#FEFF03);
  }
  //purple button
  fill(#BC0DA8);
  stroke(0);
  strokeWeight(1);
  ellipse(160, 80, 20, 20);
  if (mousePressed && dist(160, 80, mouseX, mouseY) < 10) {
    myPenStroke = color(#BC0DA8);
  }

  //line thickness and tips
  //thin line button
  stroke(0);
  strokeWeight(1);
  line(20, 130, 20, 150);
  if (mousePressed && mouseX > 10 && mouseX <30 && mouseY > 120 && mouseY < 160) {
    if (myPenWeight > 0) {
      myPenWeight --;
    }
  }
  //thick line button 5
  stroke(0);
  strokeWeight(5);
  line(40, 130, 40, 150);
  if (mousePressed && mouseX > 30 && mouseX <50 && mouseY > 120 && mouseY < 160) {
    myPenWeight = 5;
  }

  //thick line button 8
  stroke(0);
  strokeWeight(8);
  line(60, 130, 60, 150);
  if (mousePressed && mouseX > 50 && mouseX <70 && mouseY > 120 && mouseY < 160) {
    myPenWeight = 8;
  }
  //thick line button 12
  stroke(0);
  strokeWeight(12);
  line(80, 130, 80, 150);
  if (mousePressed && mouseX > 70 && mouseX <90 && mouseY > 120 && mouseY < 160) {
    myPenWeight = 12;
  }
  //thick line button 16
  stroke(0);
  strokeWeight(16);
  line(100, 130, 100, 150);
  if (mousePressed && mouseX > 90 && mouseX <110 && mouseY > 120 && mouseY < 160) {
    myPenWeight = 16;
  }

  //erase
  fill (225);
  ellipse (30, 245, 40, 40);
  stroke(0);
  strokeWeight(1);
  if (mousePressed && dist(30, 245, mouseX, mouseY) < 10) {
    myPenStroke = color(#E8DCDC);
    myPenWeight = 18;
  }
  //clear screen
  fill(255);
  strokeWeight(1);
  stroke(0);
  ellipse (20, 340, 40, 40); {
    if (mousePressed && dist(20, 340, mouseX, mouseY) < 10) {
      background (#E8DCDC);
      myPenWeight = 1;
      tool = "Tools";
  background (#E8DCDC);
   }
  }
  line (175, 0, 175, 800);
  fill (0);
  text (tool, 40, 30); 
  fill (#2723B7);
  text ("Colors", 10, 50);
  text ("Line Effects", 10, 120);
  text ("Erase", 10, 200);
  text ("Clear Screen", 10, 310);
          
//backgrounds

//shapes
}

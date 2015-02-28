
int oldMouseX, oldMouseY;
color myPenStroke;
int myPenWeight;
int colR, colB, colG, colBW1, colBW2, colY, colP, colO, colRan1, colRan2, colRan3; 
int eraserWeight;
int backColor;
boolean buttState, buttState1, lineState, buttState2, buttState3, catState;
PFont someFont;

void setup () {
  size (600, 600);
  smooth();
  backColor = 255;
  background (backColor);
  someFont = loadFont ("someFont.vlw");
  oldMouseX = 0;
  oldMouseY = 0;
  myPenStroke = color(0, 0, 0);
  myPenWeight = 1;
  colR = 255;
  colB = 255;
  colG = 255;
  colBW1 = 0;
  colBW2 = 255;
  colY = 255;
  colP = 100;
  colO = 250;
  eraserWeight = 20;
  colRan1 = int(random(255));
  colRan2 = int(random(255));
  colRan3 = int(random(255));
  buttState = false;
  buttState1 = false;
  lineState = true;
  buttState2 = false;
  buttState3 = false;
  catState = false;
}

void draw () { 
   //clear screen background
   noStroke ();
   fill (180);
   rect (0, 0, 600, 101);
  
  //pen stroke
  stroke (myPenStroke);
  strokeWeight (myPenWeight);
  if (mousePressed && mouseY > 100 && lineState == true){
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line (mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
   //line drawing button
   stroke (0);
   strokeWeight (1);
   line (90, 80, 120, 50);
   if (mousePressed && mouseX > 90 && mouseX < 120 && mouseY > 50 && mouseY < 80){
      lineState = true; 
      buttState1 = false; 
      buttState = false;
      buttState2 = false;
      buttState3 = false;
      catState = false;
   }
   oldMouseX = mouseX;
   oldMouseY = mouseY;
  
   //black button
   fill (colBW1, colBW1, colBW1);
   strokeWeight(1);
   stroke (255);
   ellipse (20, 20, 30, 30);
   if (dist (20, 20, mouseX, mouseY) < 15 && mousePressed){
       myPenStroke = color(colBW1, colBW1, colBW1); 
  }
  fill (255);
  stroke (0);
  ellipse (10, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 7, 24);
  if (dist(10, 20, mouseX, mouseY) < 5 && mousePressed){
   colBW1 ++; 
  }
  fill (0);
  stroke (255);
  ellipse (30, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 27, 24);
  if (dist(30, 20, mouseX, mouseY) < 5 && mousePressed){
   colBW1 --; 
  }
  
   //white button
  fill (colBW2, colBW2, colBW2);
  strokeWeight(1);
  stroke (0);
  ellipse (60, 20, 30, 30); 
  if (dist (60, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(colBW2, colBW2, colBW2); 
  }
  fill (255);
  stroke (0);
  ellipse (50, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 47, 24);
  if (dist(50, 20, mouseX, mouseY) < 5 && mousePressed){
   colBW2 ++; 
  }
  fill (0);
  stroke (255);
  ellipse (70, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 67, 24);
  if (dist(70, 20, mouseX, mouseY) < 5 && mousePressed){
   colBW2 --; 
  }
  
  //red button
  fill (colR, 0, 0);
  strokeWeight(1);
  stroke (0);
  ellipse (180, 20, 30, 30);
  if (dist (180, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(colR, 0, 0); 
  }
  fill (255);
  stroke (0);
  ellipse (170, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 167, 24);
  if (dist(170, 20, mouseX, mouseY) < 5 && mousePressed){
   colR ++; 
  }
  fill (0);
  stroke (0);
  ellipse (190, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 187, 24);
  if (dist(190, 20, mouseX, mouseY) < 5 && mousePressed){
   colR --; 
  }
  
  //blue button
  fill (0, 0, colB);
  strokeWeight(1);
  stroke (0);
  ellipse (100, 20, 30, 30);
  if (dist (100, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(0, 0, colB); 
  }
  fill (255);
  stroke (0);
  ellipse (90, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 87, 24);
  if (dist(90, 20, mouseX, mouseY) < 5 && mousePressed){
   colB ++; 
  }
  fill (0);
  stroke (0);
  ellipse (110, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 107, 24);
  if (dist(110, 20, mouseX, mouseY) < 5 && mousePressed){
   colB --; 
  }
  
  //green button
  fill (0, colG, 0);
  strokeWeight(1);
  stroke (0);
  ellipse (140, 20, 30, 30);
  if (dist (140, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(0, colG, 0); 
  }
  fill (255);
  stroke (0);
  ellipse (130, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 127, 24);
  if (dist(130, 20, mouseX, mouseY) < 5 && mousePressed){
   colG ++; 
  }
  fill (0);
  stroke (0);
  ellipse (150, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 147, 24);
  if (dist(150, 20, mouseX, mouseY) < 5 && mousePressed){
   colG --; 
  }
  
  //yellow button
  fill (colY, colY, 0);
  strokeWeight(1);
  stroke (0);
  ellipse (220, 20, 30, 30);
  if (dist (220, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(colY, colY, 0); 
  }
  fill (255);
  stroke (0);
  ellipse (210, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 207, 24);
  if (dist(210, 20, mouseX, mouseY) < 5 && mousePressed){
   colY ++; 
  }
  fill (0);
  stroke (0);
  ellipse (230, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 227, 24);
  if (dist(230, 20, mouseX, mouseY) < 5 && mousePressed){
   colY --; 
  }
  
  //purple button
  fill (colP, 0, colP);
  strokeWeight(1);
  stroke (0);
  ellipse (260, 20, 30, 30);
  if (dist (260, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(colP, 0, colP); 
  }
  fill (255);
  stroke (0);
  ellipse (250, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 247, 24);
  if (dist(250, 20, mouseX, mouseY) < 5 && mousePressed){
   colP ++; 
  }
  fill (0);
  stroke (0);
  ellipse (270, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 267, 24);
  if (dist(270, 20, mouseX, mouseY) < 5 && mousePressed){
   colP --; 
  }
  
  //orange button
  fill (colO, colO/2, 0);
  strokeWeight(1);
  stroke (0);
  ellipse (300, 20, 30, 30);
  if (dist (300, 20, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(colO, colO/2, 0); 
  }
  fill (255);
  stroke (0);
  ellipse (290, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 287, 24);
  if (dist(290, 20, mouseX, mouseY) < 5 && mousePressed){
   colO ++; 
  }
  fill (0);
  stroke (0);
  ellipse (310, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 307, 24);
  if (dist(310, 20, mouseX, mouseY) < 5 && mousePressed){
   colO --; 
  }
  
  //random button
  fill (colRan1, colRan2, colRan3);
  strokeWeight(1);
  stroke (0);
  ellipse (340, 20, 30, 30);
  if (dist (340, 20, mouseX, mouseY) < 15 && mousePressed){
    myPenStroke = color (colRan1, colRan2, colRan3); 
    delay (300);
    colRan1 = int(random(255));
    colRan2 = int(random(255));
    colRan3 = int(random(255));
  }
  /*fill (255);
  stroke (0);
  ellipse (330, 36, 10, 10);
  if (dist(330, 36, mouseX, mouseY) < 5 && mousePressed){
   colRan1 ++; 
   colRan2 ++; 
   colRan3 ++; 
  }
  fill (0);
  stroke (0);
  ellipse (350, 36, 10, 10);
  if (dist(350, 36, mouseX, mouseY) < 5 && mousePressed){
   colRan1 --; 
   colRan2 --;
   colRan3 --;
  }*/
  
  //eraser
  fill (backColor);
  strokeWeight(1);
  stroke (0);
  rect (360, 5, 30, 30);
  if (mouseX > 360 && mouseX < 390 && mouseY > 5 && mouseY < 35 && mousePressed){
     myPenStroke = backColor;
     myPenWeight = eraserWeight;
     lineState = true;
     buttState = false;
     buttState1 = false;
     buttState2 = false;
     buttState3 = false;
     catState = false;
  }
  fill(0);
  textFont (someFont, 10);
  text ("eraser", 358, 45);
  
  //background for clear screen
  /*fill (255);
  noStroke();
  rect (500, 500, 100, 100);*/
  
  //fill screen/current status button
  fill(myPenStroke);
  strokeWeight(myPenWeight);
  stroke(0);
  rect(550, 10, 40, 40);
  noStroke();
  rect(566, 26, 10, 10);
  if(mousePressed && mouseX > 550 && mouseX < 590 && mouseY > 10 && mouseY < 50){
    backColor = myPenStroke;
    background (backColor);
  }
  //description
  fill(80);
  textFont (someFont, 10);
  text ("Current:", 503, 50);
  text ("Pen Color", 503, 60);
  text ("Pen Weight", 503, 70); 
  text ("And:", 503, 80); 
  text ("Background Fill", 503, 90);
  
  //thin line
  stroke (0);
  strokeWeight(1);
  line(10, 50, 80, 50);
  if(mousePressed && mouseX >  10 && mouseX < 80 &&mouseY > 40 && mouseY < 60){
    if (myPenWeight > 0){
       myPenWeight --; 
      }
   }
 
  //thick line
  stroke (0);
  strokeWeight(5);
  line(10, 70, 80, 70);
    if(mousePressed && mouseX >  10 && mouseX < 80 &&mouseY > 60 && mouseY < 80){
     if (myPenWeight < 100){
        myPenWeight ++; 
     }
   }
  noFill();
  stroke (0);
  strokeWeight(1);
  rect (5, 40, 80, 40);
  fill(0);
  textFont (someFont, 10);
  text ("Pen Weight", 15, 90);
 
  // square drawing tool
  stroke (0);
  strokeWeight (1);
  noFill();
  rect (130, 50, 30, 30);
  if (mousePressed && mouseX > 130 && mouseX < 160 && mouseY > 50 && mouseY < 80){
     buttState = true;
     buttState1 = false;
     lineState = false;
     buttState2 = false;
     buttState3 = false;
     catState = false;
   }
  if (mousePressed && mouseY > 100 && buttState == true){
     stroke (myPenStroke);
     strokeWeight (myPenWeight);
     beginShape();
     vertex (mouseX, mouseY);
     vertex (mouseX + 50, mouseY);
     vertex (mouseX +50, mouseY + 50);
     vertex (mouseX, mouseY + 50);
     endShape (CLOSE);
   }
 
   //circle stamp
   stroke (0);
   strokeWeight (1);
   noFill();
   ellipse (180, 65, 30, 30);
   if (mousePressed && dist (180, 65, mouseX, mouseY) < 15){
      buttState1 = true; 
      buttState = false;
      lineState = false;
      buttState2 = false;
      buttState3 = false;
      catState = false;
   }
    if (mousePressed && mouseY > 100 && buttState1 == true){
       stroke (myPenStroke);
       strokeWeight (myPenWeight);
       ellipse (mouseX, mouseY, 50, 50);
    }
    
   //triangle stamp
   stroke (0);
   strokeWeight (1);
   noFill();
   triangle (200, 80, 215, 50, 230, 80); 
   if (mousePressed && mouseX > 200 && mouseX < 230 && mouseY > 50 && mouseY < 80){
      buttState2 = true;
      buttState1 = false; 
      buttState = false;
      lineState = false;
      buttState3 = false;
      catState = false;
   }
   if (mousePressed && mouseY > 100 && buttState2 == true){
      stroke (myPenStroke);
      strokeWeight (myPenWeight);
      triangle (mouseX, mouseY, mouseX - 25, mouseY + 50, mouseX + 25, mouseY + 50);
   }
   
   //star stamp
   stroke (0);
   strokeWeight (1);
   noFill();
   beginShape();
     vertex (250, 50);
     vertex (260, 80);
     vertex (235, 62);
     vertex (265, 62);
     vertex (240, 80);
     endShape (CLOSE);
   if (mousePressed && mouseX > 235 && mouseX < 265 && mouseY > 50 && mouseY < 80){
      buttState3 = true;
      buttState2 = false;
      buttState1 = false; 
      buttState = false;
      lineState = false;
      catState = false;
   }
   if (mousePressed && mouseY > 100 && buttState3 == true){
      stroke (myPenStroke);
      strokeWeight (myPenWeight);
      beginShape();
       vertex (mouseX, mouseY);
       vertex (mouseX + 20, mouseY + 50);
       vertex (mouseX - 27, mouseY + 16);
       vertex (mouseX + 27, mouseY + 16);
       vertex (mouseX - 20, mouseY + 50);
     endShape (CLOSE);
   }
   
   //cat button
   stroke (0);
   strokeWeight (1);
   noFill();
   ellipse (285, 65, 30, 30);
   fill(0);
   textFont (someFont, 30);
   text ("?", 277, 75);
   if (mousePressed && dist (285, 65, mouseX, mouseY) < 15){
      catState = true; 
      buttState1 = false; 
      buttState = false;
      lineState = false;
      buttState2 = false;
      buttState3 = false;
   }
   if (mousePressed && mouseY > 100 && catState == true){
       noFill (); 
       stroke (myPenStroke); 
       strokeWeight (1);
       line (mouseX, mouseY + 20, mouseX + 5, mouseY - 15); line (mouseX + 5, mouseY - 15, mouseX + 20, mouseY); 
       line (mouseX + 20, mouseY, mouseX + 35, mouseY - 15); line (mouseX + 35, mouseY - 15, mouseX + 40, mouseY + 20); 
       ellipse (mouseX + 20, mouseY + 20, 40, 40);
       ellipse (mouseX + 10, mouseY + 15, 5, 5); 
       ellipse (mouseX + 30, mouseY + 10, 5, 5);
       arc (mouseX + 20, mouseY + 25, 30, 20, 0, PI);
   }
   
   //tools description
   stroke (0);
   fill (0);
   line (90, 85, 300, 85);
   strokeWeight(1);
   textFont (someFont, 10);
   text ("Pen Tools", 170, 95);
 
    
   
}



int oldMouseX, oldMouseY;
color myPenStroke;
int myPenWeight; 
//red, blue, green, black, white, yellow, purple, organge, random 1, 2, 3
int [] col = {255, 255, 255, 0, 255, 255, 100, 250, int(random(255)), int(random(255)), int(random(255))};
int eraserWeight;
int backColor;
//lineState, buttState, buttState1, buttState2, buttState3, catState. robotState
boolean [] butts = {true, false, false, false, false, false, false};
PFont someFont; 
int a, b, veloA, veloB;


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
  eraserWeight = 20;
  a = int(random(600));
  b = int(random(100, 600));
  veloA = 2;
  veloB = 3;

}

void draw () { 
   //clear screen background
   noStroke ();
   fill (180);
   rect (0, 0, 600, 101);
  
  //pen stroke
  stroke (myPenStroke);
  strokeWeight (myPenWeight);
  if (mousePressed && mouseY > 100 && butts[0] == true){
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line (mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
   //line drawing button
   stroke (0);
   strokeWeight (1);
   line (90, 80, 120, 50);
   if (mousePressed && mouseX > 90 && mouseX < 120 && mouseY > 50 && mouseY < 80){
      butts[0] = true; 
      butts[2] = false; 
      butts[1] = false;
      butts[3] = false;
      butts[4] = false;
      butts[5] = false;
   }
   oldMouseX = mouseX;
   oldMouseY = mouseY;
  
   //black button
  button (20, 20, col[3], col[3], col[3]);
  fill (255);
  stroke (0);
  ellipse (9, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 6, 24);
  if (dist(9, 20, mouseX, mouseY) < 5 && mousePressed){
   col[3] ++; 
  }
  fill (0);
  stroke (255);
  ellipse (30, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 27, 24);
  if (dist(30, 20, mouseX, mouseY) < 5 && mousePressed){
   col[3] --; 
  }
  
   //white button
  button (60, 20, col[4], col[4], col[4]);
  fill (255);
  stroke (0);
  ellipse (50, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 47, 24);
  if (dist(50, 20, mouseX, mouseY) < 5 && mousePressed){
   col[4] ++; 
  }
  fill (0);
  stroke (255);
  ellipse (70, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 67, 24);
  if (dist(70, 20, mouseX, mouseY) < 5 && mousePressed){
   col[4] --; 
  }
  
  //red button
  button (180, 20, col[0], 0, 0);
  fill (255);
  stroke (0);
  ellipse (170, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 167, 24);
  if (dist(170, 20, mouseX, mouseY) < 5 && mousePressed){
   col[0] ++; 
  }
  fill (0);
  stroke (0);
  ellipse (190, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 187, 24);
  if (dist(190, 20, mouseX, mouseY) < 5 && mousePressed){
   col[0] --; 
  }
  
  //blue button
  button (100, 20, 0, 0, col[1]);
  fill (255);
  stroke (0);
  ellipse (90, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 87, 24);
  if (dist(90, 20, mouseX, mouseY) < 5 && mousePressed){
   col[1] ++; 
  }
  fill (0);
  stroke (0);
  ellipse (110, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 107, 24);
  if (dist(110, 20, mouseX, mouseY) < 5 && mousePressed){
   col[1] --; 
  }
  
  //green button
  button (140, 20, 0, col[2], 0);
  fill (255);
  stroke (0);
  ellipse (130, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 127, 24);
  if (dist(130, 20, mouseX, mouseY) < 5 && mousePressed){
   col[2] ++; 
  }
  fill (0);
  stroke (0);
  ellipse (150, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 147, 24);
  if (dist(150, 20, mouseX, mouseY) < 5 && mousePressed){
   col[2] --; 
  }
  
  //yellow button
  button (220, 20, col[5], col[5], 0);
  fill (255);
  stroke (0);
  ellipse (210, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 207, 24);
  if (dist(210, 20, mouseX, mouseY) < 5 && mousePressed){
   col[5] ++; 
  }
  fill (0);
  stroke (0);
  ellipse (230, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 227, 24);
  if (dist(230, 20, mouseX, mouseY) < 5 && mousePressed){
   col[5] --; 
  }
  
  //purple button
  button (260, 20, col[6], 0, col[6]);
  fill (255);
  stroke (0);
  ellipse (250, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 247, 24);
  if (dist(250, 20, mouseX, mouseY) < 5 && mousePressed){
   col[6] ++; 
  }
  fill (0);
  stroke (0);
  ellipse (270, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 267, 24);
  if (dist(270, 20, mouseX, mouseY) < 5 && mousePressed){
   col[6] --; 
  }
  
  //orange button
  button (300, 20, col[7], col[7]/2, 0);
  fill (255);
  stroke (0);
  ellipse (290, 20, 10, 10);
  fill(0);
  textFont (someFont, 10);
  text ("-", 287, 24);
  if (dist(290, 20, mouseX, mouseY) < 5 && mousePressed){
   col[7] ++; 
  }
  fill (0);
  stroke (0);
  ellipse (310, 20, 10, 10);
  fill(255);
  textFont (someFont, 10);
  text ("+", 307, 24);
  if (dist(310, 20, mouseX, mouseY) < 5 && mousePressed){
   col[7] --; 
  }
  
  //random button
  button (340, 20, col[8], col[9], col[10]);
  fill (col[8], col[9], col[10]);
  if (dist (340, 20, mouseX, mouseY) < 15 && mousePressed){ 
    delay (300);
    col[8] = int(random(255));
    col[9] = int(random(255));
    col[10] = int(random(255));
  }
  
  //eraser
  fill (backColor);
  strokeWeight(1);
  stroke (0);
  rect (360, 5, 30, 30);
  if (mouseX > 360 && mouseX < 390 && mouseY > 5 && mouseY < 35 && mousePressed){
     myPenStroke = backColor;
     myPenWeight = eraserWeight;
     butts[0] = true;
     butts[1] = false;
     butts[2] = false;
     butts[3] = false;
     butts[4] = false;
     butts[5] = false;
  }
  fill(0);
  textFont (someFont, 10);
  text ("eraser", 358, 45);
  
  //current status
  fill (myPenStroke);
  strokeWeight(1);
  noStroke ();
  ellipse (550, 45, myPenWeight + 5, myPenWeight +5);
  //description
  fill(80);
  textFont (someFont, 10);
  text ("Current:", 500, 50);
  text ("Pen Color", 500, 60);
  text ("Pen Weight", 500, 70);
  
  //fill screen
  fill(myPenStroke);
  strokeWeight(1);
  stroke(0);
  rect(400, 5, 30, 30);
  if(mousePressed && mouseX > 550 && mouseX < 590 && mouseY > 10 && mouseY < 50){
    backColor = myPenStroke;
    background (backColor);
  } 
  fill(0);
  textFont (someFont, 10);
  text ("fill", 405, 45);
  
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
     butts[1] = true;
     butts[2] = false;
     butts[0] = false;
     butts[3] = false;
     butts[4] = false;
     butts[5] = false;
   }
  if (mousePressed && mouseY > 100 && butts[1] == true){
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
      butts[2] = true; 
      butts[1] = false;
      butts[0] = false;
      butts[3] = false;
      butts[4] = false;
      butts[5] = false;
   }
    if (mousePressed && mouseY > 100 && butts[2] == true){
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
      butts[3] = true;
      butts[2] = false; 
      butts[1] = false;
      butts[0] = false;
      butts[4] = false;
      butts[5] = false;
   }
   if (mousePressed && mouseY > 100 && butts[3] == true){
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
      butts[4] = true;
      butts[3] = false;
      butts[2] = false; 
      butts[1] = false;
      butts[0] = false;
      butts[5] = false;
   }
   if (mousePressed && mouseY > 100 && butts[4] == true){
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
      butts[5] = true; 
      butts[2] = false; 
      butts[1] = false;
      butts[0] = false;
      butts[3] = false;
      butts[4] = false;
   }
   if (mousePressed && mouseY > 100 && butts[5] == true){
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
   
   //auto draw
   a+=veloA;
   b+=veloB;
   stroke (0);
   strokeWeight (1);
   rect (375, 60, 35, 35);
   fill(255);
   textFont (someFont, 10);
   text ("Need", 379, 80);
   text ("Help?", 379, 90);
   if (mousePressed && mouseX > 375 && mouseX < 410 && mouseY > 60 && mouseY < 95){
    butts[6] = true;
   }
   if (butts[6]==true){
    fill(180);
    textFont (someFont, 30);
    text ("I'm Helping!", 200, 150); 
    stroke(0);
    fill(255, 0, 0);
    ellipse (435, 77, 26, 26);
    fill(255);
    textFont (someFont, 10);
    text ("Stop", 422, 80); 
    noStroke();
    fill (myPenStroke);
    ellipse (a, b, myPenWeight+5, myPenWeight+5);
   }
   if ( a > width - (myPenWeight+5)/2 || a < (myPenWeight+5)/2) {
   veloA *= -1; 
  }
  if ( b > height - (myPenWeight+5)/2 || b < 100+(myPenWeight+5)/2) {
   veloB *= -1; 
  }
  if (mousePressed && dist(435, 77, mouseX, mouseY) < 13){
    butts[6] = false;
  }
  
  
   
}

void button (int x, int y, int buttR, int buttG, int buttB){
 fill (buttR, buttG, buttB);
 stroke (0);
 strokeWeight (1);
 ellipse (x, y, 30, 30);
 if (dist (x, y, mouseX, mouseY) < 15 && mousePressed){
   myPenStroke = color(buttR, buttG, buttB); 
 }
}



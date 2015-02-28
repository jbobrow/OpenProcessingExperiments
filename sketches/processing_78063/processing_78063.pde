
// Midterm — Drawing Program
// Kari Kawachi

int brushColor;
int brushSize;
int brushSat;
int brushBright;
int brushOpacity;
int brushType;
int graphicType;
float trigCircle;
float angle;
boolean flipSwitch;
PImage graphic1;
PImage graphic2;

void setup(){
  size(1020, 786);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(360);
  brushColor = 0;
  brushSize = 1;
  brushSat = 100;
  brushBright = 100;
  brushOpacity = 100;
  brushType = 1;
  graphicType = 0;
  trigCircle = 3;
  angle = 1;
  flipSwitch = true;
  graphic1 = loadImage("graphic1.png");
  graphic2 = loadImage("graphic2.png");
}

//Solid Drawing Mode
void drawModea(){
//  println("Testing");
    stroke(brushColor, brushSat, brushBright, 100);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY); 
}

//Watercolor Drawing Mode
void drawModeb(){
//  println("Testing");
    stroke(brushColor, brushSat, brushBright, brushOpacity--);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY); 
}

//Resetting Watercolor Tool
void mouseReleased(){
  if (brushOpacity < 100) {
    brushOpacity = 100;
  }
  if (trigCircle > 3) {
    trigCircle = 3;
  }
}

void graphicCat (){
//println("I've got a lovely bunch of cats");
  image(graphic1, mouseX, mouseY);
}

void graphicLeaf (float c, float d){
//println("I've got a lovely bunch of cats");
  float a = (trigCircle)*cos(radians(angle));
  float b = (trigCircle)*sin(radians(angle));
  image(graphic2, a+c, b+d);
  angle+=-137.5;
  trigCircle+=.3;
//println(trigCircle);
}
    
  
//Buttons  
void mouseClicked() {
  
// Changing the Brush Size
  if ((mouseX > 15) && (mouseX < 90) && (mouseY > 695) && ( mouseY < 770)) {
//    println("Hey Mister Fancy Pants");
      brushSize++;
        if (brushSize > 10) {
//        println("Not some fancy pants");
          brushSize = 1;
        }       
    }
    
// Changing the Brush Opacity Between Two Settings
  if ((mouseX > 100) && (mouseX < 175) && (mouseY > 695) && ( mouseY < 770)) {
    if (brushType == 1) {
//    println("La la la");
      flipSwitch = false;
      brushType = 2;
    } else if (brushType == 2) {
//    println("Not lah lah");
      flipSwitch = true;
      brushType = 1;
    }
 }
 
// Changing between a statue cat and leaf graphic
  if ((mouseX > 185) && (mouseX < 260) && (mouseY > 695) && ( mouseY < 770)) {
    if (graphicType == 0) {
      graphicType = 1;
      brushType = 3;
    } else if (graphicType == 1) {
      graphicType = 2;
      brushType = 4;
    } else if (graphicType == 2) {
      if (flipSwitch == true) {
      graphicType = 0;
      brushType = 1;
      } else if (flipSwitch == false) {
        graphicType = 0;
        brushType = 2;
      }
    }
  }
                
// Changing the Brush Colors
  if ((mouseX > 270) && (mouseX < 300) && (mouseY > 696) && ( mouseY < 726)) {
// println("Hello hello hello");
   brushColor = 0;
   brushSat = 100;
   brushBright = 100;
 }
  if ((mouseX > 305) && (mouseX < 330) && (mouseY > 696) && ( mouseY < 726)) {
// println("Hello hello hello");
   brushColor = 32;
   brushSat = 100;
   brushBright = 100;
 }
   if ((mouseX > 340) && (mouseX < 370) && (mouseY > 696) && ( mouseY < 726)) {
// println("Hello hello hello");
   brushColor = 58;
   brushSat = 100;
   brushBright = 100;
 }
  if ((mouseX > 375) && (mouseX < 405) && (mouseY > 696) && ( mouseY < 726)) {
// println("Hello hello hello");
   brushColor = 119;
   brushSat = 100;
   brushBright = 68;
 }
  if ((mouseX > 410) && (mouseX < 440) && (mouseY > 696) && ( mouseY < 726)) {
//  println("Hello hello hello");
    brushColor = 179;
    brushSat = 100;
    brushBright = 100;
  }   
    if ((mouseX > 445) && (mouseX < 475) && (mouseY > 696) && ( mouseY < 726)) {
//      println("Hello hello hello");
      brushColor = 229;
      brushSat = 100;
      brushBright = 90;
    }   
    if ((mouseX > 480) && (mouseX < 510) && (mouseY > 696) && ( mouseY < 726)) {
//      println("Hello hello hello");
      brushColor = 263;
      brushSat = 87;
      brushBright = 90;
    }   
    if ((mouseX > 270) && (mouseX < 300) && (mouseY > 731) && ( mouseY < 761)) {
//      println("Hello hello hello");
      brushColor = 0;
      brushSat = 0;
      brushBright = 0;
    }
     if ((mouseX > 305) && (mouseX < 330) && (mouseY > 731) && ( mouseY < 761)) {
//      println("Hello hello hello");
      brushColor = 0;
      brushSat = 0;
      brushBright = 100;
     }
  }
  

void draw(){
  
  // UI Setup
  // Drawing Space
  fill(0);
  noStroke();
  rect(0, 686, 1020, 100);
  noFill();
  
  // Painting UI
  fill(360);
  rect(15, 696, 75, 75);
  rect(100, 696, 75, 75);
  rect(185, 696, 75, 75);
  
  //Color Boxes
  fill(0, 100, 100, 100);
  rect(270, 696, 30, 30);
  fill(32, 100, 100, 100);
  rect(305, 696, 30, 30);
  fill(58, 100, 100, 100);
  rect(340, 696, 30, 30);
  fill(119, 100, 68, 100);
  rect(375, 696, 30, 30);
  fill(179, 100, 100, 100);
  rect(410, 696, 30, 30);
  fill(229, 100, 90, 100);
  rect(445, 696, 30, 30);
  fill(263, 87, 90, 100);
  rect(480, 696, 30, 30);
  fill(360);
  rect(270, 731, 30, 30);
  fill(0);
  rect(271, 732, 28, 28);
  fill(360);
  rect(305, 731, 30, 30);
  
  fill(360);
  rect(870, 721, 50, 50);
  rect(930, 696, 75, 75);
  
  //Text for Brush Size Button
  textSize(18);
  fill(0);
  text("Size:", 20, 720);
  textSize(24);
   if (brushSize == 1) {
          textSize(36);
          fill(0);
          text("1", 40, 755);
        } else if (brushSize == 2) {
          textSize(36);
          text("2", 40, 755);
        } else if (brushSize == 3) {
          textSize(36);
          text("3", 40, 755);
        } else if (brushSize == 4) {
          textSize(36);
          text("4", 40, 755);
        } else if (brushSize == 5) {
          textSize(36);
          text("5", 40, 755);
        } else if (brushSize == 6) {
          textSize(36);
          text("6", 40, 755);
        } else if (brushSize == 7) {
          textSize(36);
          text("7", 40, 755);
        } else if (brushSize == 8) {
          textSize(36);
          text("8", 40, 755);
        } else if (brushSize == 9) {
          textSize(36);
          text("9", 40, 755);
        } else if (brushSize == 10) {
          textSize(36);
          text("10", 30, 755);
        } 
  
  // Text for Drawing Modes      
  textSize(18);
  text("Mode:", 110, 720);
    if (flipSwitch == true) {
      textSize(24);
      text("Solid", 108, 750);
    } else {
      textSize(18);
      text("Water", 112, 740);
      text("color", 115, 760);
    }
    
  // Text for Images
  if (graphicType == 0) {
    textSize(18);
    text("None", 210, 760);
  } else if (graphicType == 1) {
    textSize(18);
    text("Cat", 210, 760);
  } else if (graphicType == 2) {
    textSize(18);
    text("Leaf", 210, 760);
  }
      
    
  textSize(24);
  text("G", 885, 755);
  text("Clear", 938, 740);
  strokeWeight(1);
  
  if (mousePressed && (mouseButton == LEFT)) {
    if (brushType == 1) {
      drawModea();
    } else if (brushType == 2) {
      drawModeb();
    } else if (brushType == 3) {
      graphicCat();
    } else if (brushType == 4) {
      graphicLeaf(mouseX, mouseY);
    }
  }
    
  // Clear Button
  if((mouseX > 930 ) && (mouseX < 1005) && (mouseY > 695) && ( mouseY < 770)) {
    if (mousePressed) {
      noStroke();
      fill(360);
      rect(0, 0, 1020, 686);
    }
  }
  
  // Grid
  if ((mouseX > 870 ) && (mouseX < 920) && (mouseY > 721) && (mouseY < 771)) {
    if (mousePressed) {
      for (int fancy = 0; fancy < 1020; fancy++) {
        for (int pants = 0; pants < 786; pants++) {
          strokeWeight(1);
          fill(360);
          stroke(brushColor, brushSat, brushBright, 100);
          rect(fancy*10, pants*10, 10, 10);
        }
      }
    }
  }
}




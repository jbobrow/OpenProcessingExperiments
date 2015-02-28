

/************************************************************
 *                                                          *
 *                Bleeding Drawing Program 6.0              *
 *                Created by Colin WIllson                  *
 *                                                          *
 *                                                          *
 ************************************************************/

int sizeIndex = 1;
boolean eraser = false;
float erPosX = 0;
float erPosY = 0;
PImage scrGrb;
int[] selColor = {
  0, 255, 255
};

boolean toolClick = false;
int brushX;
int brushY;
int pbrushX;
int pbrushY;
int brushSize = 5;
int deBounce = 0;

Button[] buttons = new Button[25];
Button jitterBtn;
Button bleedBtn;
Button dripBtn;
//Button trigBtn;
Button friezeBtn;
PaintCursor paintCur;
LineBleed lineBleed;
JitterBrush jitterB;
DripBrush lineDrip;
FriezeBrush friezeBrush;
int[] buttonDef = {
  0, 0, 255
};



void setup() {

  size(800, 800);
  background(255);
  colorMode(HSB, 100, 255, 255);
  smooth();
  scrGrb = get();
  paintCur = new PaintCursor();
  lineBleed = new LineBleed();
  lineDrip = new DripBrush();
  jitterB = new JitterBrush();
  friezeBrush = new FriezeBrush("p111");
  jitterBtn = new Button(400, 20, 50, 50, buttonDef, 0, 1, false);
  bleedBtn = new Button(480, 20, 50, 50, buttonDef, 0, 1, false);
  dripBtn = new Button(560, 20, 50, 50, buttonDef, 0, 1, false);
 // trigBtn = new Button(640, 20, 50, 50, buttonDef, 0, 1, false);
  friezeBtn = new Button(720, 20, 50, 50, buttonDef, 0, 1, false, false);

  makeButtons();
  buttons[1].active = true;
}



void draw() {

  brushX = mouseX;
  brushY = mouseY;
  pbrushX = pmouseX;
  pbrushY = pmouseY;

  //background(255);

  image(scrGrb, 0, 0, width, height);
  //Size Changer
  strokeWeight(1);
  stroke(0, 255, 0);

  lineBleed.display();
  lineDrip.display();

  drawToolBar();

  if (mousePressed) { 
    if (toolClick == false) {
      if (jitterBtn.active == true) { 

        jitterB.display();

        println("jitter");
      }
      if (bleedBtn.active == true) {

        lineBleed.drawLine();

        println("bleed");
      }
      if (dripBtn.active == true) {

        lineDrip.drawLine();

        println("bleed");
      }

      if (friezeBtn.active == false) {
        stroke(selColor[0], selColor[1], selColor[2]);
        strokeWeight(brushSize);
        line(pbrushX, pbrushY, brushX, brushY);
      }
      else if (friezeBtn.selected == true && friezeBrush.newPatt == false) {
        
        image(friezeBrush.pixCapture, mouseX - ((brushSize * 10) / 2), mouseY - ((brushSize * 10) / 2)); 
        
      }
    }
  }
  else {

    jitterB.newSet();
  }



  if (friezeBrush.menuOpen == true) {

    friezeBrush.dropDown();

  }  
  



  scrGrb = get();
  noCursor();
  paintCur.display();
}

//FUNCTIONS-----------------------------------------------------------------


void mousePressed() {

  if (mouseY <= 70) {

    toolClick = true;
    //friezeBtn.selected = false;
    
    for (int i = 1; i < buttons.length; i++) {

      //buttons[i].checkStatus();
      if (buttons[i].checkStatus() == true) {

        for (int j = 1; j < i; j++) {
          buttons[j].active = false;
        }
        for (int j = i + 1; j < 25; j++) {
          buttons[j].active = false;
        }
        // Sets the brush color depending on what button is pressed
        selColor[0] = buttons[i].fillHue;
      }
    }

    jitterBtn.checkStatus();
    bleedBtn.checkStatus();
    dripBtn.checkStatus();
    friezeBtn.checkStatus();
    if (friezeBtn.active == true) {
      friezeBrush.menuOpen = true;
      friezeBrush.dropDown();
      println("BLLLLAAARRHHGG");
    }
  }
  else {
println("Im here");
    toolClick = false;
    if(friezeBtn.selected == true) {
  friezeBrush.flip();
}
  }
  println(jitterBtn.active);
}



// Draws the colorbuttons
void makeButtons() {

  int[] tempColor = {
    0, 0, 0
  };

  for (int i = 1; i < buttons.length; i++) {
    if (i < buttons.length - 4) {
      tempColor[0] = (i * ((100 / (buttons.length - 5))) - (100 / (buttons.length - 5)));
      tempColor[1] = 255;
      tempColor[2] = 255;

      //println((i * ((100 / (buttons.length - 1))) - (100 / (buttons.length - 1))));
      buttons[i] = new Button((((i-1) * 30) - (360 * ((i)/ 13))) + 20, ((i / 13) * 30) + 20, 20, 20, tempColor, 0, 1, true);
      println(tempColor[0]);
    }
    else {
      tempColor[0] = 0;
      tempColor[1] = 0;
      tempColor[2] = (((i - 20) * ((255 / (3)))) - (255 / (3)));
      println(tempColor[2]);
      buttons[i] = new Button((((i-1) * 30) - (360 * ((i)/ 13))) + 20, ((i / 13) * 30) + 20, 20, 20, tempColor, 0, 1, true);
    }
  }
}


void drawToolBar() {
  // Toolbar Bar
  fill(100);
  rect(0, 0, 800, 90);
  fill(0, 255, 255);



  for (int i = 1; i< buttons.length; i++) {

    buttons[i].display();
  }
  jitterBtn.display();
  noFill();
  stroke(selColor[0], selColor[1], selColor[2]);
  strokeWeight(2);
  beginShape();
  vertex(405, 45);
  vertex(420, 60);
  vertex(425, 35);
  vertex(440, 55);
  vertex(445, 35);
  endShape();


  bleedBtn.display();
  fill(selColor[0], selColor[1], selColor[2]);
  stroke(selColor[0], selColor[1], selColor[2]);
  strokeWeight(1);
  beginShape();
  vertex(529, 28);
  vertex(529, 31);
  vertex(481, 60);
  vertex(481, 45);
  vertex(529, 28);
  endShape();
  noFill();
  stroke(0, 0, 0);
  strokeWeight(jitterBtn.borderWidth);
  rect(jitterBtn.locX, jitterBtn.locY, jitterBtn.bWidth, jitterBtn.bHeight);

  dripBtn.display();
  stroke(selColor[0], selColor[1], selColor[2]);
  strokeWeight(2);
  line(565, 35, 605, 35);
  strokeWeight(1);
  line(570, 35, 570, 55);
  line(585, 35, 585, 68);
  line(590, 35, 590, 61);
  line(598, 35, 598, 48);
  line(603, 35, 603, 52);

 // trigBtn.display();
  friezeBtn.display();
  fill(0, 0, 0);
  textAlign(CENTER);
  text("Frieze", friezeBtn.locX + (friezeBtn.bWidth / 2), friezeBtn.locY + (friezeBtn.bHeight / 2) + 5);

  strokeWeight(2);
  stroke(0);
}


/*    
 //Changes color
 if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 70) {
 if (eraser == false) {
 println("A");
 
 if (colorIndex >= 255) {
 
 colorIndex = 0;
 }
 else {
 
 colorIndex +=20;
 }
 }
 
 eraser = false;
 }//Change size of brush
 else if (mouseX > 90 && mouseX < 140 && mouseY > 20 && mouseY < 70) {
 
 println("B");
 if (sizeIndex >= 30) {
 
 sizeIndex = 1;
 }
 else {
 
 sizeIndex += 2;
 }
 }
 else if (mouseX > 160 && mouseX < 210 && mouseY > 20 && mouseY < 70) {
 
 eraser = true;
 }
 
 */

class Button {

  int bWidth;
  int bHeight;

  int locX;
  int locY;
  int fillHue;
  int fillSat; 
  int fillBrightness;
  int borderColor;
  int borderWidth;
  boolean colorBtn;
  boolean toggle;

  boolean active;
    boolean selected = false;

  Button(int tempLocX, int tempLocY, int tempBWidth, int tempBHeight, int[] tempFillColor, int tempBorderColor, int tempBorderWidth, boolean tempColorBtn, boolean tempToggle) {
    bWidth = tempBWidth;
    bHeight = tempBHeight;
    locX = tempLocX;
    locY = tempLocY;
    fillHue = tempFillColor[0];
    fillSat = tempFillColor[1];
    fillBrightness = tempFillColor[2];
    borderColor = tempBorderColor;
    borderWidth = tempBorderWidth;
    colorBtn = tempColorBtn;
    toggle = tempToggle;

    active = false;
  }

  Button(int tempLocX, int tempLocY, int tempBWidth, int tempBHeight, int[] tempFillColor, int tempBorderColor, int tempBorderWidth, boolean tempColorBtn) {
    bWidth = tempBWidth;
    bHeight = tempBHeight;
    locX = tempLocX;
    locY = tempLocY;
    fillHue = tempFillColor[0];
    fillSat = tempFillColor[1];
    fillBrightness = tempFillColor[2];
    borderColor = tempBorderColor;
    borderWidth = tempBorderWidth;
    colorBtn = tempColorBtn;
    toggle = true;

    active = false;
  }

  void display() {
    // println(fillColor[0]);
    fill(fillHue, fillSat, fillBrightness);
    //print(fillHue);
    //print(fillSat);
    //println(fillBrightness);
    stroke(255, 255, 0);

    if (active == true) {

      strokeWeight(borderWidth + 3);
    }
    else {

      strokeWeight(borderWidth);
    }

    rect(locX, locY, bWidth, bHeight);
  }

  // Checks if button is being pressed
  boolean checkStatus() {

    if (mouseX > locX && mouseX < locX + bWidth && mouseY > locY && mouseY < locY + bHeight) {

      if (toggle == true) {
        friezeBtn.active = false;

        if (active == false) {

          active = true;

          println("->");
          println(colorBtn);

          if (colorBtn == true) {
            selColor[0] = fillHue;
            selColor[1] = fillSat;
            selColor[2] = fillBrightness;
            print(selColor[0]);
            print(selColor[1]);
            println(selColor[2]);


            println("YES!");
          }
        }
        else if (active == true) {
          active = false;
        }
      }
      else {
        jitterBtn.active = false;
        bleedBtn.active = false;
        dripBtn.active = false;
        friezeBtn.active = false;
        active = true;
      }
    }
    return active;
  }
}


class PaintCursor {

  boolean clicked = false;


  PaintCursor() {
  }

  void display() {
    if (friezeBtn.selected == false) {
    if (mousePressed) {

      strokeCap(SQUARE);
      line(mouseX - 10, mouseY, mouseX, mouseY);
      line(mouseX, mouseY, mouseX + 10, mouseY);
      line(mouseX, mouseY - 10, mouseX, mouseY);
      line(mouseX, mouseY, mouseX, mouseY + 10);
      strokeCap(ROUND);
    }
    else {

      strokeCap(SQUARE);
      line(mouseX - 15, mouseY, mouseX - 5, mouseY);
      line(mouseX +5, mouseY, mouseX + 15, mouseY);
      line(mouseX, mouseY - 15, mouseX, mouseY - 5);
      line(mouseX, mouseY + 5, mouseX, mouseY + 15);
      strokeCap(ROUND);
    }
    }
    else {
      strokeWeight(2);
      stroke(0, 0, 0);
      noFill();
      rect(mouseX - ((brushSize * 10) / 2), mouseY - ((brushSize * 10) / 2),(brushSize * 10) + 2, (brushSize * 10) + 2);
      
      //image(friezeBrush.pixCapture, mouseX - ((brushSize * 10) / 2), mouseY - ((brushSize * 10) / 2));
    }
  }
}


class DripBrush {



  //Array for holding line history
  //Technique referenced from http://processing.org/learning/2darray/
  float[][] lineHistory = new float[51][10];
  float dripDistance = .5;
  int dripTime = 70;
  int historyIndex = 1;
  boolean active = false;
  int dripWeight = 2;
  int colorIndex = 0;
  int satIndex = 0;
  int sizeIndex = 0;
  int rotationIndex = 2;
  float gatherSize = 1;
  float newY;


  DripBrush() {
  }


  //Controls the ink drip effect
  void display() {

    if (rotationIndex > 50) {

      rotationIndex = 1;
    }  

    for (int x = 1; x <= 50; x++) {

      if (lineHistory[rotationIndex][9] > 0) {
        //draws the expanding lines
        
        print("newY: ");
        println(newY);
        lineHistory[rotationIndex][8] += dripDistance * (lineHistory[rotationIndex][9] / 20);  
        strokeWeight(dripWeight);
        stroke(lineHistory[rotationIndex][5], lineHistory[rotationIndex][6], lineHistory[rotationIndex][7]);
        //line(lineHistory[rotationIndex][1], lineHistory[rotationIndex][2], lineHistory[rotationIndex][3], lineHistory[rotationIndex][4]);
        line(lineHistory[rotationIndex][1], lineHistory[rotationIndex][2], lineHistory[rotationIndex][1], lineHistory[rotationIndex][2] + lineHistory[rotationIndex][8]);
        //Keeps track of ammount of drip (or the ammount of times the line segment strokeWeight is increased)
        /*
        if(lineHistory[rotationIndex][9] < 10 && lineHistory[rotationIndex][9] > 3){
        
        noStroke();
        fill(lineHistory[rotationIndex][5], lineHistory[rotationIndex][6], lineHistory[rotationIndex][7]);
        ellipse(lineHistory[rotationIndex][1], lineHistory[rotationIndex][2] + lineHistory[rotationIndex][8], dripWeight + (dripWeight + 2 / (lineHistory[rotationIndex][9] / 10)),  dripWeight + (dripWeight + 2 / (lineHistory[rotationIndex][9] / 10)));  
        
        print("test: ");
//        println(gatherSize = (lineHistory[rotationIndex][9] * dripDistance) - lineHistory[rotationIndex][8]);
        println(lineHistory[rotationIndex][9]);
        lineHistory[rotationIndex][9]--;
        
      }
      */
        lineHistory[rotationIndex][9]--;
        
      } 

      if (rotationIndex == 50) {

        rotationIndex = 1;
      }
      else {

        rotationIndex++;
      }
      strokeWeight(1);
      stroke(0);
    }
  }


  void drawLine() {

    println("C");



    lineHistory[historyIndex][1] = brushX;
    lineHistory[historyIndex][2] = brushY;
    lineHistory[historyIndex][3] = pbrushX;
    lineHistory[historyIndex][4] = pbrushY;
    lineHistory[historyIndex][5] = selColor[0]; // Color when the line was created
    lineHistory[historyIndex][6] = selColor[1];
    lineHistory[historyIndex][7] = selColor[2];
    lineHistory[historyIndex][8] = sizeIndex; // Size when the line was created
    lineHistory[historyIndex][9] = dripTime + (int)random(-30, 30);    

    if (historyIndex == 50) {

      historyIndex = 1;
    }
    else {

      historyIndex ++;
    }
  }
}




/*
angle1X = pmouseX;
 angle1Y = pmouseY;
 
 angle2X = mouseX;
 angle2Y = mouseY;
 
 slope = (pAngle1Y - angle1Y) / (pAngle1X - angle1X);
 
 angle1 = atan(slope);
 angle
 
 
 
 degrees(angle1) += (((((x / abs(x)) - 1) * (-180)) / 2);
 degrees(angle2) += (((((x / abs(x)) - 1) * (-180)) / 2);
 
 handle = ((((angle1 - 180) + angle2) / 2) - aangle2) + 90;
 handle = abs(handle);
 
 angle1H = sq(aangle1X ^2) + sq(aangle1Y);
 
 angle1H = sqrt(angle1H);
 
 
 
 
 
 
 
 angle1X ^2 + a1y ^2 = h1 ^2
 
 
 */
class FriezeBrush {
  PImage pixCapture;
  PImage tempPix = createImage(50, 50, RGB);
  int brushX;
  int brushY;
  boolean active;
  String fMode;
  String overMode;
  boolean menuOpen = false;
  boolean newPatt = true;

  FriezeBrush(String tempFMode) {
    fMode = tempFMode;
    active = false;

  }
void display() {
  
        image(pixCapture, mouseX - ((brushSize * 10) / 2), mouseY - ((brushSize * 10) / 2));
}

  void flip() {
    
    if(newPatt == true) {
    //pixCapture = createImage(50, 50, RGB);
    pixCapture = get(mouseX - ((brushSize * 10) / 2), mouseY - ((brushSize * 10) / 2), brushSize * 10, brushSize * 10);
    println("get!!");
    newPatt = false;
    
    }
    else {
          println("set!!");
    
    if (fMode == "p111") {
      //image(pixCapture, mouseX - ((brushSize * 10) / 2), mouseY - ((brushSize * 10) / 2));
    }
    else if (fMode == "p112") {
      pushMatrix();
      image(pixCapture, mouseX + 25, mouseY + 25);
      rotate(radians(180));
      popMatrix();
    }
    else if (fMode == "p1g1") {
      // Flips the image vertically
      for (int i = 0; i < pixCapture.height; i++) {
        for (int j = 0; j < pixCapture.width; j ++) {
          tempPix.pixels[j] = pixCapture.pixels[(pixCapture.width - 1) - j];
        }
      }
      // Rotates the image 180 degrees
      pushMatrix();
      rotate(180);
      image(tempPix, mouseX, mouseY);
      popMatrix();
    } 
    else if (fMode ==" p1m1") {
      for (int i = 0; i < pixCapture.height / 2; i++) {
        for (int j = 0; j < pixCapture.width; j ++) {
          tempPix.pixels[j + ((pixCapture.height / 2 * pixCapture.width) + 1)] = pixCapture.pixels[((((pixCapture.height / 2) - j) * pixCapture.width) - pixCapture.width + 1) + j];
        }
      }
      image(tempPix, mouseX, mouseY);
    } 
    else if (fMode == "pmm2") {
    } 
    else if (fMode == "pm11") {
    } 
    else if (fMode == "pmg2") {
    }
  }
  }

  // Makes the drop down menu to select the different patterns
  void dropDown() {

    textAlign(CENTER);

    if (overMode == "p111") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight, friezeBtn.bWidth, 25); 
    fill(0, 0, 0);
    text("P111", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + (friezeBtn.bHeight / 3));

    if (overMode == "p112") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight + (25 * 1), friezeBtn.bWidth, 25); 
    fill(0, 0, 0);
    text("P112", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * 1) + (friezeBtn.bHeight / 3));

    if (overMode == "p1g1") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight + (25 * 2), friezeBtn.bWidth, 25);
    fill(0, 0, 0);
    text("P1G1", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * 2) + (friezeBtn.bHeight / 3));

    if (overMode == "p1m1") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight + (25 * 3), friezeBtn.bWidth, 25);
    fill(0, 0, 0);
    text("P1M1", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * 3) + (friezeBtn.bHeight / 3));

    if (overMode == "pmm2") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight + (25 * 4), friezeBtn.bWidth, 25);
    fill(0, 0, 0);
    text("PMM2", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * 4) + (friezeBtn.bHeight / 3));

    if (overMode == "pm11") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight + (25 * 5), friezeBtn.bWidth, 25);
    fill(0, 0, 0);
    text("PM11", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * 5) + (friezeBtn.bHeight / 3));

    if (overMode == "pmg2") {
      fill(0, 255, 255);
    }
    else {
      fill(255, 0, 255);
    }
    rect(friezeBtn.locX, friezeBtn.locY + friezeBtn.bHeight + (25 * 6), friezeBtn.bWidth, 25);
    fill(0, 0, 0);
    text("PMG2", friezeBtn.locX + (friezeBtn.bHeight / 2), friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * 6) + (friezeBtn.bHeight / 3));

    for (int i = 0; i < 7; i++) {
      if (mouseX >= friezeBtn.locX && mouseX <= friezeBtn.locX + friezeBtn.bWidth && mouseY >= friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * i) && mouseY <= friezeBtn.locY + friezeBtn.bHeight + ((friezeBtn.bHeight / 2) * i) + 25) {
        if (i == 0) {
          overMode = "p111";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }         
        }
        else if (i == 1) {
          overMode = "p112";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }    
        }
        else if (i == 2) {
          overMode = "p1g1";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }    
        }
        else if (i == 3) {
          overMode = "p1m1";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }    
        }
        else if (i == 4) {
          overMode = "pmm2";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }    
        }
        else if (i == 5) {
          overMode = "pm11";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }    
        }
        else if (i == 6) {
          overMode = "pmg2";
          if(mousePressed) {
             fMode = overMode;
             menuOpen = false;
             newPatt = true;
friezeBtn.selected = true;
          }    
        }
      }
    }
  }
}


class LineBleed {



  //Array for holding line history
  //Technique referenced from http://processing.org/learning/2darray/
  int[][] lineHistory = new int[51][10];
  int bleedDistance = 1;
  int bleedTime = 30;
  int historyIndex = 1;
  boolean active = false;
  int[] colorIndex = {
    0, 255, 255
  };

  int rotationIndex = 2;  


  LineBleed() {
  }


  //Controls the ink bleed effect
  void display() {

    if (rotationIndex > 50) {

      rotationIndex = 1;
    }  

    for (int x = 1; x <= 50; x++) {

      if (lineHistory[rotationIndex][9] > 0) { 

        //draws the expanding lines
        lineHistory[rotationIndex][8] += bleedDistance;  
        strokeWeight(lineHistory[rotationIndex][8]);
        stroke(lineHistory[rotationIndex][5], lineHistory[rotationIndex][6], lineHistory[rotationIndex][7]);
        line(lineHistory[rotationIndex][1], lineHistory[rotationIndex][2], lineHistory[rotationIndex][3], lineHistory[rotationIndex][4]);
        //Keeps track of ammount of bleed (or the ammount of times the line segment strokeWeight is increased)
        lineHistory[rotationIndex][9]--;
      }

      if (rotationIndex == 50) {

        rotationIndex = 1;
      }
      else {

        rotationIndex++;
      }
      strokeWeight(1);
      stroke(0);
    }
  }


  void drawLine() {


    println("C");



    lineHistory[historyIndex][1] = brushX;
    lineHistory[historyIndex][2] = brushY;
    lineHistory[historyIndex][3] = pbrushX;
    lineHistory[historyIndex][4] = pbrushY;
    lineHistory[historyIndex][5] = selColor[0]; // Color when the line was created
    lineHistory[historyIndex][6] = selColor[1];
    lineHistory[historyIndex][7] = selColor[2];
    lineHistory[historyIndex][8] = sizeIndex; // Size when the line was created
    lineHistory[historyIndex][9] = bleedTime;    


    if (historyIndex == 50) {

      historyIndex = 1;
    }
    else {

      historyIndex ++;
    }
  }
}




/*
angle1X = pmouseX;
 angle1Y = pmouseY;
 
 angle2X = mouseX;
 angle2Y = mouseY;
 
 slope = (pAngle1Y - angle1Y) / (pAngle1X - angle1X);
 
 angle1 = atan(slope);
 angle
 
 
 
 degrees(angle1) += (((((x / abs(x)) - 1) * (-180)) / 2);
 degrees(angle2) += (((((x / abs(x)) - 1) * (-180)) / 2);
 
 handle = ((((angle1 - 180) + angle2) / 2) - aangle2) + 90;
 handle = abs(handle);
 
 angle1H = sq(aangle1X ^2) + sq(aangle1Y);
 
 angle1H = sqrt(angle1H);
 
 
 
 
 
 
 
 angle1X ^2 + a1y ^2 = h1 ^2
 
 
 */

class JitterBrush {
  int prevPosX = 0;
  int prevPosY = 0;
  boolean active;

  JitterBrush() {
    active = false;
  }


  void display() {



    brushX = mouseX + (int)random(-15, 15);
    brushY = mouseY + (int)random(-15, 15);



    pbrushX = prevPosX;
    pbrushY = prevPosY;

    prevPosX = brushX;
    prevPosY = brushY;
  }  

  void newSet() {
    prevPosX = mouseX;
    prevPosY = mouseY;
  }
}




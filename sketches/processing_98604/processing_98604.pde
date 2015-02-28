
/*
 *  Title: StatCalc_v01
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  08 May 2013
 *  Goal:  Create a web app that allows people to enter CSV data
 *         either manually or by pasting in a text box, then click
 *         through each step to calculate the mean, variance, and
 *         standard deviation.
 *  Note:  Icons are free downloads from 
 *         http://www.iconhot.com/icon/default-icon/cancel-14.html
 */

// variables /////////////////////////////////////////////////////////

// Colors
color cbg = color(220, 220, 255);    // Color for background
color ctf = color(20);               // Color for text fill
color cbb = color(20);               // Color for box borders
color cbf = color(240, 240, 255);    // Color for box fill


String titleText = "Calculating the Variance and Standard Deviation";

// Data Box variables
float   rb = 30;           // X coordinate for data box
float   dby = 140;         // Y coordinate for data box
float   dbw = 400;         // Width of data box
float   dbh = 110;         // Height of data box
boolean dbSel = true;      // Data box is selected
float   dbtx = rb;         // Box title X
float   dbty = dby - 120;  // Box title Y
String  dbTitle = "Enter your data in the box below. " +
                  "Use commas to separate each data value " +
                  "(but don't put commas inside the numbers). " +
                  "Click the check when you are done. The data " +
                  "will be sorted below and formatted with two " +
                  "decimal places. Note that backspacing and " +
                  "deleting may not work right now, " +
                  "so enter carefully!";  // Box title

// Text variables
String dataText = "";

// Button variables
// > Check (enter data)
PImage checkImage;
int edSize = 48;
int edMargin = 10;
float edX = rb + dbw + edMargin + edSize/2;
float edY = dby + edSize/2;

// > X (cancel data)
PImage cancelImage;
int cdSize = edSize;
int cdMargin = edMargin;
float cdX = rb + dbw + cdMargin + cdSize/2;
float cdY = dby + cdMargin + cdSize*3/2;

// Data variables
int n;                // Number of scores
float[] data1 = {};   // Empty array for data in data1 (raw data)
float[] data2 = {};   // Empty array for data in col2 (deviations)
float[] data3 = {};   // Empty array for data in col3 (squared dev)

float sumData1 = 0;   // Holds sum of X
float meanData1 = 0;  // Holds mean of X
float ss = 0;         // Holds sum of squared deviations

float popvar;
float popsd;
float sampvar;
float sampsd;


float coly = dby + dbh + 30;
float colw = 100;    // Width of data columns
float colh = 300;    // Height of data columns
float colb = 60;     // Border between columns

float col1x = 80;
float fh = 32;       // Formula heights

// Control symbols
PImage play64;
PImage ff64;

float play1x = rb + colw + colb/2;
float play2x = play1x + colw + colb;
float play3x = play2x + colw + colb;
float playy = coly + colh/2;
boolean play1 = false;
boolean play2 = false;
boolean play3 = false;

// Statistical symbols
PImage xdata;
PImage sumx;
PImage nlow;
PImage sampmean;
PImage nup;
PImage xbar;
PImage popmean;
PImage deviation;
PImage squaredev;
PImage ssi;
PImage popvari;
PImage popsdi;
PImage sampvari;
PImage sampsdi;

float varsdx   = rb + 3*colw + 3*colb;
float popvary  = coly;
float popsdy   = coly + 100;
float sampvary = coly + 200;
float sampsdy  = coly + 300;

// setup /////////////////////////////////////////////////////////////
void setup() {
  size(800, 800);
  smooth();
  
  // Load images
  checkImage = loadImage("check-64.png");
  cancelImage = loadImage("cancel-64.png");
  play64 = loadImage("play-64.png");
  ff64 = loadImage("ff-64.png");
  xdata = loadImage("x.png");
  sumx = loadImage("sum-x.png");
  nlow = loadImage("n-low.png");
  sampmean = loadImage("sample-mean.png");
  nup = loadImage("N-up.png");
  xbar = loadImage("x-bar.png");
  popmean = loadImage("pop-mean.png");
  deviation = loadImage("deviation.png");
  squaredev = loadImage("squared-deviations.png");
  ssi = loadImage("ss.png");
  popvari = loadImage("pop-var.png");
  popsdi = loadImage("pop-sd.png");
  sampvari = loadImage("samp-var.png");
  sampsdi = loadImage("samp-sd.png");
}

// draw //////////////////////////////////////////////////////////////
void draw() {
  background(cbg);

  // appTitle(); //
  textSize(24);
  fill(ctf);
  textAlign(LEFT);
  text(titleText, rb, 50);

  // dataBox(); //
  // Title
  textSize(14);
  textAlign(LEFT);
  fill(ctf);
  textAlign(LEFT);
  text(dbTitle, rb, dby - 75, width - 75, 100);
    
  // Box
  stroke(cbb);
  fill(cbf);
  rect(rb, dby, dbw, dbh);
  
  // Set cursor
  if ((dist(mouseX, mouseY, edX, edY) < edSize/2) ||
      (dist(mouseX, mouseY, cdX, cdY) < cdSize/2)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  
  // dataText(); //
  textSize(18);
  fill(ctf);
  textLeading(24);
  if (dbSel) {
    textAlign(LEFT);
    text(dataText + (frameCount/10 % 5 == 0 ? "_" : ""), rb + 10, dby + 15, dbw - 50, dbh - 40);
  } else {
    textAlign(LEFT);
    text(dataText, rb + 10, dby + 15, dbw - 50, dbh - 40);
  }
  
//  //  enterData(); //
  imageMode(CENTER);

  if ((dist(mouseX, mouseY, edX, edY) < edSize/2) && mousePressed) {
    image(checkImage, edX, edY, edSize * 1.25, edSize * 1.25);

  } else {
    image(checkImage, edX, edY, edSize, edSize);
  }
 
  //  clearData(); //
  imageMode(CENTER);
  if ((dist(mouseX, mouseY, cdX, cdY) < cdSize/2) && mousePressed) {
    image(cancelImage, cdX, cdY, cdSize * 1.25, cdSize * 1.25);
    dataText = "";
  } else {
    image(cancelImage, cdX, cdY, cdSize, cdSize);
  }
  
  // Column 1 for X data
  
  if (data1.length != 0) {
    
    // Place symbol at top
    image(xdata, rb + colw/2, coly); 
    
    // Draw box beneath
    stroke(cbb);
    fill(cbf);
    rect(rb, coly + fh, colw, colh);
    
    // Fill in data
    for (int i = 0; i < n; i++) {
      fill(ctf);
      textAlign(RIGHT);
      text(nf(data1[i], 0, 2), rb + colw - 10, coly + 35 + (i + 1) * 20);
    }

    // Place symbols and calculations at bottom of col1
    imageMode(CORNER);
    textAlign(LEFT);
    image(sumx, rb, coly + colh + fh + 10);
    text(" = " + nf(sumData1, 0, 2), rb + 50, coly + colh + fh + 32);
    image(nlow, rb, coly + colh + 2*fh + 30);
    text(" = " + n, rb + 50, coly + colh + 2*fh + 51);
    image(xbar, rb, coly + colh + 3*fh + 50);
    text(" = " + nf(meanData1, 0, 2), rb + 50, coly + colh + 3*fh + 72);
    
    // Play button for next column
    imageMode(CENTER);
    image(play64, play1x, playy);
    
  }
  
  // Draw col2 (deviations) when button is pushed
  if ((n > 0) && play1) {
    
    // Place symbol at top
    image(deviation, rb + colw*3/2 + colb, coly); 
    
    // Draw box beneath
    stroke(cbb);
    fill(cbf);
    rect(rb + colw + colb, coly + fh, colw, colh);
    
    // Fill in data
    for (int i = 0; i < n; i++) {
      fill(ctf);
      textAlign(RIGHT);
      text(nf(data2[i], 0, 2), rb + 2* colw + colb - 10, coly + 35 + (i + 1) * 20);
    }
    // Play button for next column
    imageMode(CENTER);
    image(play64, play2x, playy);
  }
  
  // Draw col3 (squared deviations) when button is pushed
  if ((n > 0) && play2) {
    
    // Place symbol at top
    image(squaredev, rb + colw*5/2 + 2*colb, coly); 
    
    // Draw box beneath
    stroke(cbb);
    fill(cbf);
    rect(rb + 2*colw + 2*colb, coly + fh, colw, colh);
    
    // Fill in data
    for (int i = 0; i < n; i++) {
      fill(ctf);
      textAlign(RIGHT);
      text(nf(data3[i], 0, 2), rb + 3*colw + 2*colb - 10, coly + 35 + (i + 1) * 20);
    }
    // Play button for next column
    imageMode(CENTER);
    image(play64, play3x, playy);
    
    // Place symbol and calculation at bottom of col3
    imageMode(CORNER);
    textAlign(LEFT);
    image(ssi, rb + 2*colw + 2*colb, coly + colh + fh + 20);
    text(" = " + nf(ss, 0, 2), rb + 2*colw + 2*colb + 10, coly + colh + fh + 70);    
  }
  
  // Draws final formulas when button is pushed
  if ((n > 0) && play3) {
    textAlign(LEFT);

    image(popvari, varsdx, popvary); 
    text("= " + nf(popvar, 0, 2), varsdx + 160, popvary + 40);
    
    image(popsdi, varsdx, popsdy); 
    text("= " + nf(popsd, 0, 2), varsdx + 160, popsdy + 40);
    
    image(sampvari, varsdx, sampvary); 
    text("= " + nf(sampvar, 0, 2), varsdx + 160, sampvary + 40);
    
    image(sampsdi, varsdx, sampsdy); 
    text("= " + nf(sampsd, 0, 2), varsdx + 160, sampsdy + 40);
    
    }
}


// keyPressed //////////////////////////////////////////////////////
// Enters and deletes data text when box is selected
void keyPressed() {
  if (dbSel) {
    if (keyCode == BACKSPACE) {
      if (dataText.length() > 0) {
        dataText = dataText.substring(0, dataText.length()-1);
      }
    } else if (keyCode == DELETE) {
      dataText = "";
    } else if (keyCode != SHIFT) {
//      dataText = dataText + key;
      dataText = dataText + str(key);
    }
  }
}

// mousePressed /////////////////////////////////////////////////////
void mousePressed() {
    if ((mouseX > rb) && (mouseX < rb + dbw) && (mouseY > dby) && (mouseY < dby + dbh)) {
      dbSel = true;
    }
    
    // If mouse is clicked elsewhere, deselect box
    if ((mouseX < rb) || (mouseX > rb + dbw) || (mouseY < dby) || (mouseY > dby + dbh)) {
      dbSel = false;
    }
    
  //  enterData(); //
  // mousePressed actually causes the data to be written into the new
  // array several times if the click isn't quick. I would rather use
  // mouseReleased but that doesn't seem to be an option here.
  if (dist(mouseX, mouseY, edX, edY) < edSize/2) {
    data1 = reverse(sort(float(splitTokens(dataText, ", "))));
    n = data1.length;
  }

  // Column 1: Sum data and 
  
  if (data1.length != 0) {
    
    // Get sum and mean for data1
    if (sumData1 == 0) {
      for (int i = 0; i < n; i++) {
        sumData1 += data1[i];
        meanData1 = sumData1 / n;
      }
    }
    
    // Get deviations from mean
    if (data2.length < n) {
      for (int i = 0; i < n; i++) {
        data2 = append(data2, data1[i] - meanData1);
        data3 = append(data3, sq(data2[i]));
      }
    }
    
    // Get SS
    if (ss == 0) {
      for (int i = 0; i < n; i++) {
        ss += data3[i];
      }
    }
    popvar = ss / n;
    popsd = sqrt(ss / n);
    sampvar = ss / (n - 1);
    sampsd = sqrt(ss / (n - 1));
  }
  
  // If button between col1 and col2 is pressed
  if (dist(mouseX, mouseY, play1x, playy) < 40) {
    play1 = true;
  }
  if (dist(mouseX, mouseY, play2x, playy) < 40) {
    play2 = true;
  }
  if (dist(mouseX, mouseY, play3x, playy) < 40) {
    play3 = true;
  }
}





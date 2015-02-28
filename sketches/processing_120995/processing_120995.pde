
/*@pjs preload="1.png,2.png,3.png,4.png";*/
int framenumber = 33;
int loadingCounter = 0;
int loadingCounter2 = 18;
PImage[] images;
int screenID;
String filename;
int start;
boolean startScreen;
PFont f;
color textColor;
int sliderX;
int sliderY;
float sliderA;
int sliderCenterX;
int sliderCenterY;
int sliderSize;
int hours = 0;
int minutes = 0;

void setup() {
  // Set timer for startup
  start = millis();
  // load Images
  images = new PImage[framenumber]; 
  for (int i=0; i<4; i++) {
    loadNewImage(i);
    loadingCounter++;
  }
  loadNewImage(17);
  size(360, 700);
  screenID = 0;
  startScreen = true;
  //frameRate(15);
  noCursor();
  textColor = color(255);
  f = createFont("Palatino", 16, true);
  //sliderSettings
  sliderSize = 144/2;
  sliderCenterX = 177;
  sliderCenterY = 269;
  sliderX = sliderCenterX;
  sliderY = sliderCenterY-sliderSize;
  sliderA = 0;
}

void draw() {
  if (millis()-start>2000 && startScreen) {
    screenID++;
    startScreen = false;
  }
  background(images[screenID]);
  if ((screenID>=3 && screenID <=4) || 
    (screenID>=6 && screenID <= 9) || (screenID>=17 && screenID <=19)) {
    timeSlider();
  }
  if (screenID==30) {
    details();
  }
  //textFont(f);
  //fill(0);
  //text("(" + mouseX + "," + mouseY + ")", mouseX, mouseY);
  if (screenID !=0) screenNot0();
}

void mouseReleased() {
  switchScreens();
}

void switchScreens() {
  if (screenID < 16 && loadingCounter <16) {
    loadNewImage(loadingCounter);
    loadingCounter++;
  } 
  else if (loadingCounter<framenumber-1) {
    loadNewImage(loadingCounter2);
    loadingCounter2++;
  }
  if (hasHome() && withInButton(295, 129, 15)) screenID=1;
  switch (screenID) {
  case 1: 
    if (withInButton(260, 350, 60)) screenID++; // Walk
    if (withInButton(294, 506, 15)) screenID=3; // Next
    sliderX = sliderCenterX;
    sliderY = sliderCenterY-sliderSize;
    sliderA = 0;
    break;
  case 2:
    if (withInButton(110, 350, 60)) screenID--; // Hunt
    if (withInButton(294, 506, 15)) screenID=17; // Next
    sliderX = sliderCenterX;
    sliderY = sliderCenterY-sliderSize;
    sliderA = 0;
    loadNewImage(18);
    break;
  case 3:
    if (withInButton(80, 410, 15)) screenID++; // Textfield
    break;
  case 4:
    if (withInButton(80, 410, 15)) screenID++; // Textfield
    break;
  case 5:
    if (withInButton(65, 120, 15)) screenID++; // Back
    break;
  case 6:
    if (withInButton(80, 410, 15)) screenID++; // Textfield
    loadNewImage(9);
    break;
  case 7:
    if (withInButton(275, 508, 30)) screenID++; // Nature
    if (withInButton(183, 508, 30)) screenID=9; // Sightseeing
    loadNewImage(10);
    break;
  case 8:
    if (withInButton(183, 508, 30)) screenID++; // Sightseeing
    if (withInButton(280, 578, 15)) {
      screenID=10; // Begin
      hours = 0;
      minutes = 0;
    }
    break;
  case 9:
    if (withInButton(275, 508, 30)) screenID=8; // Nature
    if (withInButton(280, 578, 15)) {
      screenID++; // Begin
      hours = 0;
      minutes = 0;
    }
    loadNewImage(16);
    break;
  case 10:
    if (withInButton(273, 544, 30)) screenID++; // Let's hunt
    loadNewImage(14);
    break;
  case 11:
    if (withInButton(88, 542, 30)) screenID++; // New Clue
    if (withInButton(273, 544, 30)) screenID=16; // Found
    if (withInButton(59, 118, 15)) screenID=10; // Back
    loadNewImage(15);
    break;
  case 12:
    if (withInButton(27, 314, 25)) screenID++; // Arrow
    if (withInButton(88, 542, 30)) screenID=14; // New Clue
    if (withInButton(273, 544, 30)) screenID=16; // Found
    if (withInButton(59, 118, 15)) screenID=10; // Back
    break;
  case 13:
    if (withInButton(325, 314, 25)) screenID--; // Arrow
    if (withInButton(88, 542, 30)) screenID++; // New Clue
    if (withInButton(273, 544, 30)) screenID=16; // Found
    if (withInButton(59, 118, 15)) screenID=10; // Back
    break;
  case 14:
    if (withInButton(88, 542, 30)) screenID++; // New Clue
    if (withInButton(273, 544, 30)) screenID=16; // Found
    if (withInButton(59, 118, 15)) screenID=10; // Back
    break;
  case 15:
    if (withInButton(273, 544, 30)) screenID=16; // Found
    if (withInButton(59, 118, 15)) screenID=10; // Back
    break;
  case 16:
    if (withInButton(273, 544, 30)) screenID=1; // New Hunt
    break;
  case 17:
    if (withInButton(80, 410, 15)) screenID++; // Textfield
    loadNewImage(22);
    break;
  case 18:
    if (withInButton(183, 508, 30)) screenID++; // Sightseeing
    loadNewImage(23);
    break;
  case 19:
    if (withInButton(280, 578, 15)) {
      screenID++; // Begin
      hours = 0;
      minutes = 0;
    }
    loadNewImage(24);
    break;
  case 20:
    if (withInButton(295, 569, 15)) screenID=24; // Next
    if (withInButton(110, 465, 55)) screenID++; // Right Picture
    if (withInButton(258, 465, 55)) screenID=22; // Left Picture
    break;
  case 21:
    if (withInButton(110, 465, 55)) screenID=20; // Right Picture
    if (withInButton(258, 465, 55)) screenID=22; // Left Picture
    break;
  case 22:
    if (withInButton(295, 569, 15)) screenID=23; // Next
    if (withInButton(110, 465, 55)) screenID--; // Right Picture
    if (withInButton(258, 465, 55)) screenID=20; // Left Picture
    break;
  case 23:
    if (withInButton(60, 120, 15)) screenID=20; // Back
    break;
  case 24:
    if (withInButton(60, 120, 15)) screenID=20; // Back
    if (withInButton(295, 569, 15)) screenID++; // Next
    break;
  case 25:
    if (withInButton(60, 120, 15)) screenID--; // Back
    if (withInButton(295, 569, 15)) screenID++; // Next
    break;
  case 26:
    if (withInButton(60, 120, 15)) screenID--; // Back
    if (withInButton(295, 569, 15)) screenID++; // Begin
    loadNewImage(31);
    break;
  case 27:
    if (withInButton(60, 120, 15)) screenID--; // Back
    if (withInButton(88, 551, 30)) screenID++; // Skip
    if (withInButton(273, 544, 30)) screenID++; // Found
    loadNewImage(32);
    break;
  case 28:
    if (withInButton(60, 120, 15)) screenID=26; // Back
    if (withInButton(113, 163, 30)) screenID++; // Picture
    if (withInButton(88, 551, 30)) screenID=31; // Skip
    if (withInButton(273, 544, 30)) screenID=31; // Found
    break;
  case 29:
    if (withInButton(60, 120, 15)) screenID--; // Back
    if (withInButton(273, 544, 30)) screenID=31; // Found
    if (withInButton(90, 550, 30)) screenID++; // Info
    break;
  case 30:
    if (withInButton(273, 544, 30)) screenID++; // Found
    if (withInButton(90, 550, 30)) screenID=28; // Map
    break;
  case 31:
    if (withInButton(60, 120, 15)) screenID=26; // Back
    if (withInButton(88, 551, 30)) screenID++; // Skip
    if (withInButton(273, 544, 30)) screenID++; // Found
    break;
  case 32:
    if (withInButton(273, 544, 30)) screenID=2; // New Walk
    break;
  }
}

void loadNewImage(int index) {
  if (images[index] == null) {
    filename = index+".png";
    images[index] =  loadImage(filename);
  } 
  else if (index+1<framenumber-1) {
    loadNewImage(index+1);
  }
}

// Check if mouse is within one button
boolean withInButton(int x, int y, int size) {
  return (dist(x, y, mouseX, mouseY) <= size);
}

boolean hasHome() {
  if ( screenID <=2)
    return false;
  else
    return true;
}

void details() {
  textFont(f);
  fill(0);
  textSize(20); 
  String title = "Gåsgränd";
  text(title, 185, 175);
  textSize(16);
  String text = "Trivia: Gåsgränd means goose alley in english."+
    " The alley was named after a women who " +
    " lived there in the 16th century.";
  text(text, 45, 255, 280, 200);
  text = "Photo tips: The lighting in this street is " + 
    "really interesting about an hour before sunset." +
    " Today, the sun sets "
    + "at 3:37 PM in Stockholm.";
  text(text, 45, 360, 280, 200);
}



// Time Slider
void timeSlider() {
  if (mousePressed && 
    withInButton(sliderCenterX, sliderCenterY, sliderSize+20) 
    && ! withInButton(sliderCenterX, sliderCenterY, sliderSize-20) ) {
    sliderPos();
    sliderAngle();
    time();
  }
  fill(255, 0, 0);
  float xDir = (sliderX-sliderCenterX)/144.0;
  float yDir = (sliderY-sliderCenterY)/144.0;
  int txM = sliderCenterX + int(120*xDir);
  int tyM = sliderCenterY + int(120*yDir);
  int txR = sliderCenterX + int(165*xDir) +int(20*yDir);
  int tyR = sliderCenterY + int(165*yDir) -int(20*xDir);
  int txL = sliderCenterX + int(165*xDir) -int(20*yDir);
  int tyL = sliderCenterY + int(165*yDir) +int(20*xDir);
  fill(255);
  triangle(txM, tyM, txR, tyR, txL, tyL);
  textFont(f);
  fill(textColor);
  textSize(16); 
  if (minutes <10) {
    text(hours + " h 0" + minutes + " min", sliderCenterX-35, sliderCenterY+8);
  } 
  else {
    text(hours + " h " + minutes + " min", sliderCenterX-35, sliderCenterY+8);
  }
}

void sliderPos() {
  float xDir = mouseX - sliderCenterX; 
  float yDir = mouseY - sliderCenterY;
  float length = dist(0, 0, xDir, yDir);
  xDir = xDir/length;
  yDir =yDir/length; 
  sliderX = sliderCenterX + int(xDir*sliderSize);
  sliderY = sliderCenterY + int(yDir*sliderSize);
}

void sliderAngle() {
  float l1 = dist(0, 0, 0, sliderCenterY-sliderSize);
  float l2 = dist(0, 0, sliderX-sliderCenterX, sliderY-sliderCenterY);
  float dot = (sliderY-sliderCenterY)*(sliderCenterY-sliderSize);
  float cosine = dot/(l1*l2);
  sliderA = acos(cosine);
}

void time() {
  if (sliderX>180) {
    if (sliderA <=PI && sliderA > 15*PI/16) {
      hours = 0;
      minutes = 0;
    }
    else if (sliderA <=15*PI/16 && sliderA > 13*PI/16) {
      hours = 0;
      minutes = 15;
    }
    else if (sliderA <=13*PI/16 && sliderA > 11*PI/16) {
      hours = 0;
      minutes = 30;
    }
    else if (sliderA <=11*PI/16 && sliderA > 9*PI/16) {
      hours = 0;
      minutes = 45;
    }
    else if (sliderA <=9*PI/16 && sliderA > 7*PI/16) {
      hours = 1;
      minutes = 0;
    }
    else if (sliderA <=7*PI/16 && sliderA > 5*PI/16) {
      hours = 1;
      minutes = 15;
    }
    else if (sliderA <=5*PI/16 && sliderA > 3*PI/16) {
      hours = 1;
      minutes = 30;
    }
    else if (sliderA <=3*PI/16 && sliderA > 1*PI/16) {
      hours = 1;
      minutes = 45;
    } 
    else {
      hours = 2;
      minutes = 0;
    }
  } 
  else {
    if (sliderA <=PI && sliderA > 15*PI/16) {
      hours = 0;
      minutes = 0;
    }
    else if (sliderA <=15*PI/16 && sliderA > 13*PI/16) {
      hours = 3;
      minutes = 45;
    }
    else if (sliderA <=13*PI/16 && sliderA > 11*PI/16) {
      hours = 3;
      minutes = 30;
    }
    else if (sliderA <=11*PI/16 && sliderA > 9*PI/16) {
      hours = 3;
      minutes = 15;
    }
    else if (sliderA <=9*PI/16 && sliderA > 7*PI/16) {
      hours = 3;
      minutes = 0;
    }
    else if (sliderA <=7*PI/16 && sliderA > 5*PI/16) {
      hours = 2;
      minutes = 45;
    }
    else if (sliderA <=5*PI/16 && sliderA > 3*PI/16) {
      hours = 2;
      minutes = 30;
    }
    else if (sliderA <=3*PI/16 && sliderA > 1*PI/16) {
      hours = 2;
      minutes = 15;
    } 
    else {
      hours = 2;
      minutes = 0;
    }
  }
}

// Cursor
void screenNot0() {
  noStroke();
  if (mousePressed) {
    fill(239, 230, 230, 191);
  } 
  else {
    fill(239, 230, 230, 127);
  }

  ellipse(mouseX, mouseY, 30, 30);
}




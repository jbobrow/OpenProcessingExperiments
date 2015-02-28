
void setup () {
  size (600, 600);
  background (255);
  frameRate (1000);
  smooth ();
}

float roofPointX = 175;
float roofPointY = 275;

float windowSpacing = 20;
float windowX = 425;
float windowY = 360;
float windowSize = 15;

float doorX = 300;

float openingY =360/roofPointX + 300;
float openingMidX = .5*(roofPointX - 150) + 150;
float openingMidY = .5*(roofPointY + 400);


void draw () {
  // MackayLyons();
}

//PEAK CONTROLLS
void keyPressed () {
  if (key == CODED) {
    if (keyCode == UP) {
      background (255);
      roofPointY--;
      MackayLyons ();
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      background (255);
      roofPointY++;
      MackayLyons ();
    }
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      background (255);
      roofPointX--;
      MackayLyons ();
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      background (255);
      roofPointX++;
      MackayLyons ();
    }
  }

  //WINDOW CONTROLS

  //SPACING
  if (key == 'i') {
    background (255);
    windowSpacing = windowSpacing + 5;
    MackayLyons ();
    println ("window spacing = " + windowSpacing);
  }

  if (key == 'o') {
    if (windowSpacing > 5) {
      background (255);
      windowSpacing = windowSpacing - 5;
      MackayLyons ();
      println ("window spacing = " + windowSpacing);
    }
  }
  //COORDINATES
  if (key == 'd') {
    windowX++;
    MackayLyons ();
  }
  if (key == 'a') {
    windowX--;
    MackayLyons ();
  }
  if (key == 's') {
    windowY++;
    MackayLyons ();
  }
  if (key == 'w') {
    windowY--;
    MackayLyons ();
  }

  //DOOR CONTROLS

  if (key == 'k') {
    doorX--;
    MackayLyons ();
  }

  if (key == 'l') {
    doorX++;
    MackayLyons ();
  }
}



void MackayLyons () {
  strokeWeight (2);
  line (0, height/2 + height/6, width, height/2 + height/6);

  fill(180, 190, 200);
  strokeWeight (1);
  
  beginShape ();
  vertex (150, 400);
  vertex (roofPointX, roofPointY);
  vertex (466, 318);
  vertex (466, 400);
  endShape ();
  
  //Opening
  
  fill (255);
  beginShape();
  vertex (150, 400);
  vertex (.5*(roofPointX - 150) + 150, .5*(roofPointY + 400));
  vertex (250, 352);
  vertex (250, 400);
  endShape ();

  for (float i = 0; i < 100; i = i + windowSpacing) {
    rectMode (CENTER);
    fill (230, 220, 130);
    rect (windowX - i, windowY, windowSize, windowSize);
  }

  fill (255);
  rect (doorX, 380, 17, 40);
}
                


import ddf.minim.*;

//Assignent 2: Media Arts & Practice 404 Tactical Media
//McKenzie Carlile

PImage img;
PImage[] images = new PImage[8]; 
int i = 0;
int savedTime;
int savedTime2;
int totalTime = 50;
int totalTime2 = 2000;
int orbSpeed = 24;
int bottom;
int left;
int right;
float recordedX = 0;
float recordedY = 200;
boolean fire = false;
boolean engage = true;
boolean xhasbeenrecorded = false;

void setup () {
  size(800, 500, P2D);


  noStroke();
  noCursor();
  smooth();

  images[0] = loadImage("orb1.png");
  images[1] = loadImage("orb2.png");
  images[2] = loadImage("orb3.png");
  images[3] = loadImage("orb4.png");
  images[4] = loadImage("orb5.png");
  images[5] = loadImage("orb6.png");
  images[6] = loadImage("orb7.png");
  images[7] = loadImage("orb8.png");

  savedTime = millis();
  img = images [i];
  savedTime2 = millis();

  bottom = (7*(height/8));
  left = width/8;
  right =((width/8)*7);
}

void draw () {
  img = images [i];
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    if (i < 6) {
      i++;
    } else {
      i = 0;
    }
    savedTime = millis();
  }

  int passedTime2 = millis() - savedTime2;
  if (passedTime2 > totalTime2) {
    savedTime2 = millis();
  } else {
    fire = true;
  }

  fill(0, 11, 17, 50);
  noStroke();
  rect(0, 0, width, height);

  if (fire) {
    //float rV = random(-1, 1);
    recordedY = recordedY + orbSpeed;
    if (xhasbeenrecorded == false) {
      recordedX = mouseX;
      xhasbeenrecorded = true;
    }
    if (mouseY < bottom-100) {
      if (mouseX < right-100) {
        image (img, recordedX+75, (recordedY), 50, 50);
      } else {
        image (img, right-25, (recordedY), 50, 50);
      }
      if (engage == true) {
      }
    }
  }

  if (mouseY < bottom-100) {
    if (mouseX < right-100) {
      image (img, mouseX, mouseY, 200, 200);
    } else {
      image (img, right-100, mouseY, 200, 200);
    }
  }
  stroke (180, 234, 254);
  strokeWeight(5);
  line (left, bottom, right, bottom);
  if (engage == true) {
    if (recordedY > bottom-50) {
      xhasbeenrecorded = false;
      recordedY = mouseY+50;
      if (mouseX < right-100) {
        image (img, recordedX, (bottom-100), 200, 200);
      } else {
        image (img, right-100, (bottom-100), 200, 200);
      }
    }
  }
}

void mousePressed () {
  engage = !engage;
  println("engaged = " + engage);
}

//works cited

//hit.wav taken from freesound.org user lavik89
//https://www.freesound.org/people/lavik89/sounds/168984/
//wobble.mp3 taken from freesound.org user Trebblofang
//https://www.freesound.org/people/Trebblofang/sounds/178113/




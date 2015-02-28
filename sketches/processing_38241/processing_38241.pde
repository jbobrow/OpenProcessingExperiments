
// Jolyn Sandford
// CMU EMS Section D
// Assignment 4, September 21st, 2011
// Images property of BBC and JT's Blog

//HENRY HELPED LOADS

//images
PImage[] TARDIS = new PImage[6];
PImage cosmos;
PImage DALEK;
PImage danger;
PImage allonsy;
int timeRecord = -40000;
int[] variation = new int[20];
int[] position = new int[20];
int speed = 1;
int v, p;
int DALEKfloat;
int TARDISfloat;
int flicker = 255;
int count = 0;
int alpha = 255;
boolean lastPress = false;


/////////////////////////////////////////////

void setup() {
  smooth();
  size (1024, 768);

  //load the TARDIS!
  for (int i = 0; i <= 5; i++) {
    TARDIS[i] = loadImage ("tardis" + i + ".png");
  }

  for (int i = 0; i < 20; i++) {
    variation[i] = int(random(-300, 300));
    position[i] = int(random(50, 700));
  }

  //load images
  cosmos = loadImage ("cosmos.jpg");
  DALEK = loadImage ("dalek.png");
  danger = loadImage ("DANGER.png");
  allonsy = loadImage ("allonsy.png");
  
  //load the sounds!
  setupSounds("tardisflight.mp3");
  setupSounds1("exterminate.mp3");
}


/////////////////////////////////////////////

void draw() {
  tint(255, 255);
  image(cosmos, 0, 0);
  bgmusic();

  //daleks
  DANGER();

  //buttons
  DANGERBUTTIN();
  ALLONSYBUTTIN();

  //rotating TARDIS
  TARDIS();
}


/////////////////////////////////////////////

void TARDIS() {
  int rotateTime = ((millis()/60) % 6); //rotates the TARDIS
  TARDISfloat = ((millis()/(10)) % 1320); // moves the TARDIS across the screen

  // makes the TARDIS bob
  int TARDISbob = ((millis()/3) % 2000);
  float inc = TWO_PI/25.0;
  float a = (inc*(TARDISbob))/40;
  float y = 50*(sin(a));

  // makes the TARDIS flicker
  float b = (inc*(rotateTime))/20;
  if (alpha != flicker) {
    if (alpha > flicker) {
      alpha -= 1;
    }
    if (alpha < flicker) {
      alpha += 1;
    }
  }
  tint(255, alpha);

  //draws the TARDIS
  image (TARDIS[rotateTime], TARDISfloat-200, 250+y);
}


/////////////////////////////////////////////

void DALEK() {
  tint(255, 255);
  image (DALEK, 200, 200);
}


////////////////////////////////////////////

void DANGERBUTTIN() {
  fill(224, 61, 7);
  strokeWeight(2);
  stroke(191, 58, 13);
  fill (111, 20, 4);
  int DALEKfloat = ((millis()/5) % 1620);
  if (mousePressed && (800<mouseX) && (mouseX<968) && (700<mouseY) && (mouseY<721)) {
    playSample1();
    timeRecord = millis();
    for (int i = 0; i < 20; i++) {
      variation[i] = int(random(-300, 300));
      position[i] = int(random(50, 700));
    }
  }
  else {
    fill(224, 61, 7);
  }
  rect (800, 700, 168, 21);
  image (danger, 804, 704);
}


////////////////////////////////////////////

void ALLONSYBUTTIN() {
  fill(36, 82, 188);
  strokeWeight(2);
  stroke(8, 33, 90);
  if (mousePressed && (758<mouseX) && (mouseX<968) && (665<mouseY) && (mouseY<689)) {
    if (!lastPress) {
      stroke(165, 187, 237);
      count++;
      if (count%2 == 1) {
        flicker = 255*0;
        playSample();
      }
      else {
        flicker = 255*1;
        playSample();
      }
      lastPress = true;
    }
  }
  else {
    lastPress = false;
  }
  rect (758, 665, 210, 24);
  image (allonsy, 762, 669);
}


/////////////////////////////////////////////

void DANGER() {
  DALEKfloat = ((millis()-timeRecord)/5);
  for (int i = 0; i < 20; i++) {
    v = variation[i];
    p = position[i];
    image (DALEK, (DALEKfloat-600)+v, p);
  }
}


////////////////////////////////////////////

void bgmusic() {
  if (millis() == 1) {
  playSample1();
  }
}


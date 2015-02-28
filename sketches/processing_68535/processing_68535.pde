
//universals



//establish distance for start button and mouse click
float startX;
float startY;


//establish half width and height for male torso area
int radMtorsoX;
int radMtorsoY;

//establish height and width of groin region
int radGroinX;
int radGroinY;

//establish width and height of male torso area
float distanceMX;
float distanceMY;

//establish counters to 'count' mouse clicks (with particular brushes) and program an event after a certain counter amount
int counterKiss;
int counterCream;
int counterBlood;
int counterBruise;
int counterBite;
int counterWhip;

//boolean to switch between different brushes
boolean brushKiss;
boolean brushCream;
boolean brushBlood;
boolean brushBruise;
boolean brushBite;
boolean brushWhip;




void setup() {

  //background homepage image 
  size(500, 500);
  PImage homeImage = loadImage("fthome.png");
  imageMode(CENTER);
  image(homeImage, width/2, height/2);

  //assign integers to half of width and height of male torso area (invisible bounding box)
  radMtorsoX = 175;
  radMtorsoY = height/2;

  //assign values to half width and height of male groin 
  radGroinX = 60;
  radGroinY = 45;

  //start counters at 0
  counterKiss = 0;
  counterCream = 0;

  //establish boolean states as false to start with
  brushKiss = false;
  brushCream = false;
  brushBlood = false;
  brushBruise = false;
  brushBite = false;
  brushWhip = false;

  //button over "start"
  noStroke();
  smooth();
  rectMode(CENTER);
  fill(0, 0, 0, 50);
  rect(168, 180, 110, 40);

  //"radius" of start button to enable it in void draw with mouse
  startX = 55;
  startY = 20;
}




void draw() {

  // fill(255, 255, 255, 50);
  // ellipse(width/3, 450, 90, 120);


  //enable start button to transition to next window of drawing tool
  float distanceSX = dist(168, mouseY, mouseX, mouseY);
  float distanceSY = dist(mouseX, 180, mouseX, mouseY);

  if (mousePressed == true && (distanceSX < startX) && (distanceSY < startY) && (counterKiss == 0) 
    && (counterCream == 0) && (counterBlood == 0) && (counterBruise == 0) && (counterBite == 0) && (counterWhip == 0)) {
    PImage maleImage = loadImage("man.png");
    imageMode(CENTER);
    image(maleImage, width/2, height/2);
  }

  //create boolean conditions to be able to swith between brushes
  if (keyPressed) {
    if (key == 'k') {
      brushKiss = true;
      brushCream = false;
      brushBlood = false;
      brushBruise = false;
      brushBite = false;
      brushWhip = false;
    }
  }

  if (keyPressed) {
    if (key == 'c') {
      brushCream = true;
      brushKiss = false;
      brushBlood = false;
      brushBruise = false;
      brushBite = false;
      brushWhip = false;
    }
  }

  if (keyPressed) {
    if (key == 'd') {
      brushBlood = true;
      brushKiss = false;
      brushCream = false;
      brushBruise = false;
      brushBite = false;
      brushWhip = false;
    }
  }

  if (keyPressed) {
    if (key == 'g') {
      brushBruise = true;
      brushKiss = false;
      brushCream = false;
      brushBlood = false;
      brushBite = false;
      brushWhip = false;
    }
  }

  if (keyPressed) {
    if (key == 't') {
      brushBite = true;
      brushKiss = false;
      brushCream = false;
      brushBlood = false;
      brushBruise = false;
      brushWhip = false;
    }
  }

  if (keyPressed) {
    if (key == 'w') {
      brushWhip = true;
      brushKiss = false;
      brushCream = false;
      brushBlood = false;
      brushBruise = false;
      brushBite = false;
    }
  }

  //state distance between mouses position and centre of torsp
  distanceMX = dist(width/3, mouseY, mouseX, mouseY);
  distanceMY = dist(mouseX, height/2, mouseX, mouseY);

  //state limit on each counter to set up different resulting events later
  //   if (counterKiss >= 30) {
  //   rectMode(CORNER);
  // fill(255, 0, 0);
  //rect(0, 0, width, height);
  //}

  //if (counterCream >= 7) {
  //PImage imageTC = loadImage("whipped.png");
  //imageMode(CORNER);
  //image(imageTC, 0, 0);
  //}

  //enable start button to transition to next window of drawing tool
  float distanceGX = dist(width/3, mouseY, mouseX, mouseY);
  float distanceGY = dist(mouseX, 450, mouseX, mouseY);

  if (mousePressed == true && brushKiss == true && (distanceGX < radGroinX) && (distanceGY < radGroinY)) {
    PImage easyImage = loadImage("easytiger.png");
    imageMode(CENTER);
    image(easyImage, width/2, height/2);
  }
}



//functions for different brushes
void kiss() {
  PImage imageKiss = loadImage("kiss.png");
  imageMode(CENTER);
  image(imageKiss, mouseX, mouseY);
}

void cream() {
  PImage imageCream = loadImage("cream.png");
  imageMode(CENTER);
  image(imageCream, mouseX, mouseY);
}

void blood() {
  PImage imageBlood = loadImage("blood.png");
  imageMode(CENTER);
  image(imageBlood, mouseX, mouseY);
}

void bruise() {
  PImage imageBruise = loadImage("bruise.png");
  imageMode(CENTER);
  image(imageBruise, mouseX, mouseY);
}

void bite() {
  PImage imageBite = loadImage("bite.png");
  imageMode(CENTER);
  image(imageBite, mouseX, mouseY);
}

void whip() {
  PImage imageWhip = loadImage("whip.png");
  imageMode(CENTER);
  image(imageWhip, mouseX, mouseY);
}



//brushes go you good thing! and increase counters by one for each mouse release
void mouseReleased() {
  if (brushKiss == true && (distanceMX < radMtorsoX) && (distanceMY < radMtorsoY) ) {
    kiss();
  }


  if (brushCream == true && (distanceMX < radMtorsoX) && (distanceMY < radMtorsoY) ) {
    cream();
    counterCream ++;
  }

  if (brushBlood == true && (distanceMX < radMtorsoX) && (distanceMY < radMtorsoY) ) {
    blood();
    counterBlood ++;
  }

  if (brushBruise == true && (distanceMX < radMtorsoX) && (distanceMY < radMtorsoY) ) {
    bruise();
    counterBruise ++;
  }

  if (brushBite == true && (distanceMX < radMtorsoX) && (distanceMY < radMtorsoY) ) {
    bite();
    counterBite ++;
  }

  if (brushWhip == true && (distanceMX < radMtorsoX) && (distanceMY < radMtorsoY) ) {
    whip();
    counterWhip ++;
  }
}









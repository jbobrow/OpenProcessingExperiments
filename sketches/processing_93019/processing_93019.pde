
/*
Pearlyn Lii
 03/14/13
 ID 3
 Final_Mock-up
 */


String[] filenames = {
  "pic1.jpg", "pic2.jpg", "pic3.jpg", "pic4.jpg"
}; // order


PImage[] images = new PImage[filenames.length];
int imageIndex = 0;

int savedTime;
int totalTime = 3000;


int selector = 1; //A selector for which scene to display.
float startTime; //Needed for timing calculations
boolean pause;   //A boolean that pauses the selection process.

PImage title;
PImage titleword;
PImage menu;
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;

boolean pmp = false;


void setup() {
  size(400, 1000);
  smooth();
  colorMode(HSB, 360, 100, 100);

  //Timer
  savedTime = millis();

  for (int i = 0; i<filenames.length; i++)
  { 
    images[i] = loadImage(filenames[i]);
  } 


  //--------------------load images--------------------

  imageMode(CENTER);
  title = loadImage("title.jpg");
  titleword = loadImage("titleword.jpg");
  menu = loadImage("menu.jpg");
  pic1 = loadImage("pic1.jpg");
  pic2 = loadImage("pic2.jpg");
  pic3 = loadImage("pic3.jpg");
  pic4 = loadImage("pic4.jpg");

  pmp = false; //Needed to avoid overlapping button glitch
}
void draw() {
  background(360);
  println(selector);

  //Which scene to currently display.

  if (selector == 1) {
    title();
    pause = true;
  }

  else if (selector == 2) {
    titleword();
    pause = true;
  }

  else if (selector == 3) {
    menu();
    pause = true;
  }

  else if (selector == 4) {
    lookbook();
    pause = false;


    if (pause == false) {
      if (millis() - startTime >= 12000) {
        selector = 3; 
        startTime = millis(); //reset timer
      }
    }
  }

  pmp = mousePressed; //Needed to avoid overlapping button glitch
}

//+++++++++++++ TITLE+++++++++++++

void title() {
  scale(.5);
  image(title, width, height);
  fill(360);

  if (mousePressed && !pmp) {
    selector = 2; 
    startTime = millis(); //reset timer
    pause = true;
  }
}


//+++++++++++++ TITLEWORDS +++++++++++++

void titleword() {
  scale(.5);
  image(titleword, width, height);


  if (mousePressed && !pmp) {
    selector = 3; 
    startTime = millis(); //reset timer
    pause = true;
  }
}


//+++++++++++++ MENU +++++++++++++

void menu() {
  scale(.5);
  image(menu, width, height);

  if (mousePressed && !pmp) {
    selector = 4; 
    startTime = millis(); //reset timer
    pause = false;
  }
}

//+++++++++++++ LOOKBOOK +++++++++++++

void lookbook() {

  int passedTime = millis() - savedTime;
  scale(.5);
  image(images[imageIndex], width, height); 


  if (passedTime > totalTime) {
    println ("3 secs");
    imageIndex++;
    savedTime = millis();
  }

  if (imageIndex>filenames.length-1)
    imageIndex = 0;
}





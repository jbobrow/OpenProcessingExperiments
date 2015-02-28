
//establish universals

//font
PFont myFont;
PFont myFont2;
PFont myFont3;
PFont myFont4;

//page turn 'button'
float pageTurnX;
float pageTurnY;

//question mark 'button'
float questionX;
float questionY;

//walkathon button link
float walkX;
float walkY;

//princess names
int numNames = 3;

String[] princessNames = {
  "Belle", "Cinderella", "Snow White"
};

float[] tnX = new float [numNames];
float[] tnY = new float [numNames];

//half the height distance taken by the princess names (to establish mouse click on them later) 
float radNamesY;

//half the width distance taken by the princess names
float radBelleX;
float radCinX;
float radSnowX;


void setup() {


  //background homepage image
  size(1000, 1000);
  PImage homeImage = loadImage("castle pg.png");
  imageMode(CENTER);
  image(homeImage, width/2, height/2);

  //see available fonts
  //String[] fontList = PFont.list();
  //println(fontList);

  //title font "Princesses"
  myFont = createFont("Astloch-Bold", 85, true);
  textFont(myFont);
  textAlign(CENTER);
  text("Princesses", width/2, 150);

  //start instruction
  myFont2 = createFont("Astloch-Bold", 32, true);
  textFont(myFont2);
  textAlign(CENTER);
  fill(100);
  text("press 's' to start story", width/3 *2 + 100, 900);

  //radius of page turn area to enable it in void draw with mouse release
  pageTurnX = 50;
  pageTurnY = 50;

  //question mark to go to next page
  questionX = 100;
  questionY = 100;
  
  //walkathon link button
  walkX = 500;
  walkY = 100;

  //princess names
  for (int i = 0; i < numNames; i ++) {
    tnX[i] = width/2;
    tnY[i] = 220 + i*300;

    //princess name icons
    radNamesY = 50;
    radBelleX = 100;
    radCinX = 200;
    radSnowX = 300;
  }
}

void draw() {


  //if 's' pressed go to next page
  if (keyPressed) {
    if (key == 's') {

      PImage princessImage = loadImage("castle light.png");
      imageMode(CENTER);
      smooth();
      image(princessImage, width/2, height/2);

      myFont2 = createFont("Astloch-Bold", 32, true);
      textFont(myFont2);
      textAlign(CENTER);
      fill(100);
      text("press 'p' for princesses", width/3 *2 + 100, 900);
      text("click to choose", width/3 *2 + 100, 935);
    }



    //if 'p' pressed princess names appear

    if (key == 'p') {

      for (int i = 0; i < numNames; i++) {
        myFont3 = createFont("Astloch-Bold", 52, true);
        textFont(myFont3);
        textAlign(CENTER);
        fill(100);
        smooth();
        text(princessNames[i], tnX[i], tnY[i]);
      }
    }
  }

  //if clicked princess names light up

  for (int i = 0; i < numNames; i++) {
    if (mousePressed == true && (dist(mouseX, mouseY, tnX[i], tnY[i]) < 50)) {

      textFont(myFont3);
      textAlign(CENTER);
      fill(255, 100, 100);
      smooth();
      text(princessNames[i], tnX[i], tnY[i]);
    }
  }


  //mouse click on princess names = images appear

  float distanceBX = dist(width/2, mouseY, mouseX, mouseY);
  float distanceBY = dist(mouseX, 220, mouseX, mouseY);

  float distanceCX = dist(width/2, mouseY, mouseX, mouseY);
  float distanceCY = dist(mouseX, 520, mouseX, mouseY);

  float distanceSX = dist(width/2, mouseY, mouseX, mouseY);
  float distanceSY = dist(mouseX, 820, mouseX, mouseY);


  if (mousePressed == true && (distanceBX < radBelleX) && (distanceBY < radNamesY)) {

    PImage sixImage = loadImage("belle.png");
    imageMode(CENTER);
    smooth();
    image(sixImage, width/2, height/2);
    
    myFont = createFont("Astloch-Bold", 85, true);
    textFont(myFont);
    fill(150);
    textAlign(CENTER);
    text("?", 955, 80);
  }

  if (mousePressed == true && (distanceCX < radCinX) && (distanceCY < radNamesY)) {

    PImage sixImage = loadImage("cin.png");
    imageMode(CENTER);
    smooth();
    image(sixImage, width/2, height/2);
    
    myFont = createFont("Astloch-Bold", 85, true);
    textFont(myFont);
    fill(150);
    textAlign(CENTER);
    text("?", 955, 80);
  }

  if (mousePressed == true && (distanceSX < radSnowX) && (distanceSY < radNamesY)) {

    PImage sixImage = loadImage("snow.png");
    imageMode(CENTER);
    smooth();
    image(sixImage, width/2, height/2);

    myFont = createFont("Astloch-Bold", 85, true);
    textFont(myFont);
    fill(150);
    textAlign(CENTER);
    text("?", 955, 80);
  }

  //enable question mark at page turn to transition to next page 
  float distancePTX = dist(950, mouseY, mouseX, mouseY);
  float distancePTY = dist(mouseX, 50, mouseX, mouseY);

  if (mousePressed == true && (distancePTX < pageTurnX) && (distancePTY < pageTurnY)) {
    PImage castleRedImage = loadImage("castle red.png");
    imageMode(CENTER);
    smooth();
    image(castleRedImage, width/2, height/2);

    myFont4 = createFont("Astloch-Bold", 50, true);
    textFont(myFont4);
    fill(200);
    textAlign(CENTER);
    text("When your little girl dreams of being a princess,", width/2, height/3 + 140);
    text("3 million others each year dream of just being a girl.", width/2, height/3 + 200);

    myFont = createFont("Astloch-Bold", 85, true);
    textFont(myFont);
    fill(150);
    textAlign(CENTER);
    text("?", 700, 700);
  }

  //enable question mark at bottom of page to transition to next page
  float distanceQX = dist(700, mouseY, mouseX, mouseY);
  float distanceQY = dist(mouseX, 700, mouseX, mouseY);

  if (mousePressed == true && (distanceQX < questionX) && (distanceQY < questionY)) {
    PImage castleRedImage = loadImage("castle redder.png");
    imageMode(CENTER);
    smooth();
    image(castleRedImage, width/2, height/2);

    myFont4 = createFont("Astloch-Bold", 50, true);
    textFont(myFont4);
    fill(200);
    textAlign(CENTER);
    text("Female Genital Mutilation is not make believe,", width/2, height/3 + 140);
    text("please help make it a 'once upon a time'.", width/2, height/3 + 200);

    myFont2 = createFont("Astloch-Bold", 32, true);
    textFont(myFont2);
    textAlign(CENTER);
    fill(100);
    text("press 'i' for more info", 700, 900);
   
    
  }
  
  //float distanceWX = dist(700, mouseY, mouseX, mouseY);
  //float distanceWY = dist(mouseX, 700, mouseX, mouseY);

//if (mousePressed == true && (distanceWX < walkX) && (distanceWY < walkY)) {
  //link("http://www.cagem.org/page-0#!__page-0/events");
  


if (keyPressed) {
    if (key == 'i') {
      link("http://www.cagem.org/");
    }
}

}



// Acceptance
// by Colin Horgan

import ddf.minim.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;

Boy boy;
Girl girl;

Plant[] plant;

int changeCount;
float change;

float d;

int textTrans;

float lightTrans = 0;

int gameState;


void setup() {

  size(400, 300);

  background(255);

  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  smooth();

  minim = new Minim(this);

  song1 = minim.loadFile("SHTitle.wav");
  song2 = minim.loadFile("SHAudio.wav");
  song3 = minim.loadFile("SHAudio2.wav");

  song1.loop();

  boy = new Boy(-10, height/2);
  girl = new Girl(0, height/2);

  plant = new Plant[30];


  change = 8.5;

  generatePlants();

  gameState = 0;
} 

void draw() {

  //opening

  if (gameState == 0) {

    background(255);

    if (girl.x <= width*2/3)
    {
      girl.x++;
    }

    if (girl.x >= width/2 && boy.x < width/3)
    {
      boy.x++;
    }

    if (girl.x >= width/2 && textTrans <= 255)
    {
      textTrans++;
    }

    girl.display();
    boy.display();

    fill(0, textTrans);
    textSize(18);
    text("Acceptance", width/2, 100);
    textSize(12);
    text("A Game by Colin Horgan", width/2, 120);
    text("Arrow Keys to Move", width/2, height - 40);
    text("Press Any Key to Begin", width/2, height - 20);

    if (textTrans >= 255 && keyPressed) {
      song2.loop();
      gameState = 1;
    }
  }

  // game

  if (gameState == 1) {

    background(255-d);

    displayPlants();
    girl.display();
    boy.display();
    boy.light();

    girl.walk();
    if (changeCount < 30)
    {
      boy.walk();
    }

    screenChange();

    if (changeCount == 20)
    {
      song3.loop();
    }

    checkEndGame();
  }

  // end
  if (gameState == 2) {

    background(0);

    girl.display();

    displayLight();

    if (girl.trans > 0) {
      girl.trans -=.5;
    }

    if (girl.trans <= 0)
    {
      lightTrans+=.5;
    }

    if (lightTrans >= 255)
    {
      reset();
      gameState = 0;
    }
  }
}


void screenChange() {
  if (boy.x < 0) {
    boy.x = 0;
  }
  if (boy.x > width)
  { 
    if (girl.direction == 1 && girl.x > width) {
      boy.x = 0; 

      changePlants();

      boy.trans -= change;
      boy.lightTrans += change;
      d += change;
      girl.x = 200;
      girl.y = 150;
      girl.direction = ceil(random(3));
      changeCount += 1;
    }
    else
      boy.x = width;
  }

  if (boy.y > height)
  {
    if (girl.direction == 2 && girl.y > height) {
      boy.y = 0; 

      changePlants();

      boy.trans -= change;
      boy.lightTrans += change;
      d += change;
      girl.x = 200;
      girl.y = 150;
      girl.direction = ceil(random(2));
      changeCount += 1;
    }
    else
      boy.y = height;
  }

  else if (boy.y < 0)
  {
    if (girl.direction == 3 && girl.y < 0) {
      boy.y = height; 

      changePlants();

      boy.trans -= change;
      boy.lightTrans += change;
      d += change;
      girl.x = 200;
      girl.y = 150;
      girl.choice = ceil(random(2));
      changeCount += 1;

      if (girl.choice == 1)
        girl.direction = 1;
      else if (girl.choice == 2)
        girl.direction = 3;
    }
    else
      boy.y = 0;
  }
}


void checkEndGame() {

  if (girl.x > width || girl.y < 0 || girl.y > height)
  {
    if (changeCount == 30)
    {
      song2.pause();
      gameState = 2;
    }
  }
}

void generatePlants() {

  for (int i = 0; i < plant.length; i ++) {
    plant[i] = new Plant(i+1);
  }
}

void changePlants() {
  for (int i = 0; i < plant.length; i ++) {
    plant[i].x = round(random(400));
    plant[i].y = round(random(300));
    plant[i].trans += change;
  }
}

void displayPlants() {

  for (int i = 0; i < plant.length; i ++) {
    plant[i].display();
  }
}

void displayLight() {

  noStroke();
  rectMode(CENTER);
  fill(255, lightTrans);
  rect(width/2, height/2, 500, 400);
}

void reset() {

  boy.x = -15;
  boy.y = height/2;
  boy.trans = 255;
  boy.lightTrans = 0;
  boy.porB = round(random(1,10));
  girl.x = 0;
  girl.y = height/2;
  changeCount = 0;
  d = 0;
  textTrans = 0;
  lightTrans = 0;
  girl.trans = 255;
  girl.direction = 1;
  girl.borP = round(random(1,10));
  for (int i = 0; i < plant.length; i++)
  {
    plant[i].trans = 0;
  }
  gameState = 0;
  song3.pause();
}

void stop()
{
  song1.close();
  song2.close();
  song3.close();
  minim.stop();

  super.stop();
}



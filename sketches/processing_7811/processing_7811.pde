
// Project 4 Template
// To understand this code, read Structure 3 (p. 181)
// The RollDice example shows the basic mechanics of 
// working with functions

int page;   // Current page, this is the most important variable in the code

float buttonColorL = 20;//left button colorv
float buttonColorR = 20;//right button color
float bSlider = 0;
int buttonColor1 = 20;
int buttonColor2 = 60;

float timer1 = 0; // animation timer

//ALICE
float ax;
float ay;
float aSize;
int pageSize;
boolean shrooms;
boolean bover = false; //is mouse over size slider
boolean locked = false;
float bx = 270.0; //slider x
float bdifx = 0.0;

int b1x = 30;   // Button 1 x-coordinate
int b1y = 410;  // Button 1 y-coordinate
int b1w = 200;  // Button 1 width
int b1h = 40;   // Button 1 height

int b2x = 410;  // Button 2
int b2y = 410;
int b2w = 200;
int b2h = 40;

PFont font;

PImage caterpillar;
PImage cornershade;
PImage alice1;
PImage mushroomalice;
PImage mushroom;
PImage mushroom2;
PImage shroomS;
PImage sneakalice;
PImage runhatter;
PImage rabbitrunback;
PImage teaparty;
PImage alicetea;
PImage alicescared;
PImage roadsplit;


void setup(){
  caterpillar = loadImage("caterpillar.png");
  cornershade = loadImage("cornershade.png");
  alice1 = loadImage("alice1.png");
  mushroomalice = loadImage("mushroomalice.png");
  mushroom = loadImage("mushroom.png");
  mushroom2 = loadImage("mushroom2.png");
  shroomS = loadImage("shroomS.png");
  sneakalice = loadImage("sneakalice.png");
  runhatter = loadImage("runhatter.png");
  rabbitrunback = loadImage("rabbitrunback.png");
  teaparty = loadImage("teaparty.png");
  alicetea = loadImage("alicetea.png");
  alicescared = loadImage("alicescared.png");
  roadsplit = loadImage("split.png");
  
  
  size(640, 480); 
  smooth();
  font = loadFont("Verdana-20.vlw");
  textFont(font);
  imageMode(CENTER);
  rectMode(CENTER);
  
  page = 1;
  shrooms = false;
  aSize = 1;
  bx = 270;
  bdifx = 0.0;
  bover = false;
  locked = false;
}

void draw() {
  textAlign(CENTER);
  textSize(20);
  if(page == 1){
    pageOne();
  } else if(page == 2){
    pageTwo(); 
  } else if(page == 3){
    pageThree(); 
  } else if(page == 4){
    pageFour();
  } else if(page == 5){
    pageFive();
  } else if(page == 6){
    pageSix();
  } else if(page == 7){
    pageSeven();
  } else if(page == 8){
    pageEight();
  } else if(page == 9){
    pageNine();
  } else if(page == 10){
    pageTen();
  } else if(page == 11){
    pageEleven();
  }
  
    //cornershade
  image(cornershade, width/2, height/2);
  
  //left button color
  if((overButton(b1x, b1y, b1w, b1h) == true) && (buttonColorL < buttonColor2)){
    buttonColorL += 3;
  } else if((overButton(b1x, b1y, b1w, b1h) == false) && (buttonColorL > buttonColor1)){
    buttonColorL -= 3;
  }
  //Right button color
  if((overButton(b2x, b2y, b2w, b2h) == true) && (buttonColorR < buttonColor2)){
    buttonColorR += 3;
  } else if((overButton(b2x, b2y, b2w, b2h) == false) && (buttonColorR > buttonColor1)){
    buttonColorR -= 3;
  }
  
  aSize = 1 + (bx - 270) / (2*52/2);
  pageSize = round(aSize);
  if(shrooms == true){
    //size controls
    fill(50);
    rect(320, 430, 100, 20);
    fill(30);
    triangle(270, 440, 370, 420, 370, 440);
    line(295, 440, 295, 420);
    line(349, 440, 349, 420);
    //test if mouse is over box
    if((mouseX > bx - 15) && (mouseX < bx + 15) && (mouseY > 415) && (mouseY < 445)){
      bover = true;
    } else {
      bover = false;
    }    
    //slider color 
    if((bover == true) && (bSlider < 5)){
      bSlider += 2;
      
    } else
    if((bover == false) && (bSlider > 0)){
      bSlider -= 2;
    }
    if(locked){
      bSlider = 5;
    }
    image(shroomS, bx, 430, shroomS.width + bSlider, shroomS.height + bSlider);
  }
  
/*
  textAlign(LEFT);
  textSize(10);
  fill(201);
  text("page = " + page, 10, 20);
  text("Alice Size = " + aSize, 10, 35);
  text("Shrooms = " + shrooms, 10, 50);
  text("page Size control " + pageSize, 10, 65);
  
  text("x = " + mouseX, 10, 300);
  text("y = " + mouseY, 10, 315);
  */
}

void mousePressed(){
  
  //alice size
  if(bover){
    locked = true;
  } else {
    locked = false;
  }
  bdifx = mouseX - bx;
  
  if(page == 1){
    if((overButton(b1x, b1y, b1w, b1h) == true)&&(shrooms == false)){
      page = 3; 
    } else if(overButton(b2x, b2y, b2w, b2h) == true){
      page = 2;
    }
  } else
  if(page == 2){
    if (overButton(b1x, b1y, b1w, b1h) == true){
      page = 1; 
    } else if ((overButton(b2x, b2y, b2w, b2h) == true) && (shrooms == false)){
      page = 4;
    } else 
    if((overButton(b2x, b2y, b2w, b2h) == true) && (pageSize == 1)){
      page = 4;
    } else if((overButton(b2x, b2y, b2w, b2h) == true) && (pageSize == 2)){
      page = 5;
    } else if((overButton(b2x, b2y, b2w, b2h) == true) && (pageSize == 3)){
      page = 6;
    }
  } else
  if(page == 3){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      page = 2;
    }
  } else
  if(page == 4){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      setup();
    }
  } else
  if(page == 5){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      page = 7;
    } else if((overButton(b2x, b2y, b2w, b2h) == true)){
      page = 8;
    }
  } else
  if(page == 6){
    if((overButton(b2x, b2y, b2w, b2h) == true)){
      page = 8;
    }
  } else
  if(page == 7){
    if((overButton(b2x, b2y, b2w, b2h) == true)){
      page = 8;
    }
  } else
  if(page == 8){
    if((overButton(b1x, b1y, b1w, b1h) == true)){
      page = 10;
    } else if((overButton(b2x, b2y, b2w, b2h) == true)){
      page = 9;
    }
  } else
  if(page == 9){
     if((overButton(b2x, b2y, b2w, b2h) == true)){
      setup();
    }
  } else
  if(page == 10){
    if((overButton(b1x, b1y, b1w, b1h) == true)){
      page = 11;
    } else if((overButton(b2x, b2y, b2w, b2h) == true)){
      page = 9;
    }
  }
}

// Check to see if the click happends over the button
boolean overButton(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    return true; 
  } 
  else{
    return false; 
  }
}

void mouseDragged(){
  if((locked) && (bx >= 270) && (bx <= 370)){
    bx = mouseX - bdifx;
  }
  if(bx > 370){
    bx = 370;
  }
  if(bx < 270){
    bx = 270;
  }
}

void mouseReleased(){
  locked = false;
}

// PAGE ONE----------------------------------------------------------

void pageOne(){
  background(47, 95, 124);
  background(93, 102, 108);
  
  if(shrooms == false){
    pushMatrix();
    translate(map(mouseX, 0, width, 430, 425), 280);
    scale(.35);
    image(alice1, 0, 0);
    popMatrix();
    
    image(caterpillar, map(mouseX, 0, width, 150, 120), 270);
    
    text("The Caterpillar wants to talk to you...", map(mouseX, 0, width, 420, 400), 80);
    
    // Left Button
    fill(buttonColorL); 
    rect(b1x + b1w/2, b1y + b1h/2, b1w, b1h);
    fill(201);
    text("Listen", b1x + b1w/2, b1y + 28);
  
  } else{
    pushMatrix();
    translate(map(mouseX, 0, width, 190, 180), 450);
    scale(1/aSize);
    image(mushroom2, 0, -.5 * mushroom2.height);
    popMatrix();
    text("The Caterpillar is gone", width/2, 100);
  }
  // Right Button
  fill(buttonColorR); 
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Leave", b2x + b2w/2, b2y + 28);
}


// PAGE TWO----------------------------------------------------------

void pageTwo(){
  background(84, 69, 93);
  fill(201);
  
  pushMatrix();
  translate(map(mouseX, 0, width, 60, 20), 310);
  scale(.4 * 1/aSize);
  image(mushroom2, 0, -mushroom2.height/2);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 220, 210), 350);
  scale(.2 + aSize * .3);
  image(sneakalice, 0, -sneakalice.height * .3);
  popMatrix();
  if(shrooms == false){
    text("The Caterpillar yells for you to come back...", width/2, 50);
    text("There is a tea party ahead.", 450, 100);
  } else{
    text("There is a tea party ahead.", map(mouseX, 0, width, 475, 470), 235);
  }
  
  // Left Button
  fill(buttonColorL); 
  rect(b1x + b1w/2, b1y + b1h/2, b1w, b1h);
  fill(201);
  text("Go Back", b1x + b1w/2, b1y + 28);
  
  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Join Tea party", b2x + b2w/2, b2y + 28);
}


// PAGE THREE----------------------------------------------------------

void pageThree(){
  background(80, 60, 66);
  pushMatrix();
  translate(map(mouseX, 0, width, 260, 250) - aSize*10, 450);
  scale(1/aSize * .9);
  image(mushroom, 0, -mushroom.height/2);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 120, 105), 450);
  scale(aSize);
  image(mushroomalice, 0, -mushroomalice.height/2);
  popMatrix();
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Continue", b2x + b2w/2, b2y + 28);
  text("The Caterpillar gives you Mushrooms.", map(mouseX, 0, width, 425, 420), 120);
  text("One piece makes you larger,", map(mouseX, 0, width, 415, 410), 155);
  text("the other makes you smaller.",map(mouseX, 0, width, 415, 410), 180);
  text("(use the slider to grow/shrink)", map(mouseX, 0, width, 415, 410), 205);
  shrooms = true;
}

// PAGE FOUR----------------------------------------------------------

void pageFour(){
  background(96, 11, 11);
  pushMatrix();
  translate(width/2 , map(mouseY, 0, height, 240, 210));
  scale(.2 + aSize/6);
  rotate(map(mouseX, 0, width, -.5, .5));
  image(alicescared, 0, 0);
  popMatrix();
  fill(201);
  text("Mad Hatter throws you in the sugar cup", width/2, 50);
  text("There is no way out", width/2, 400);
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Restart", b2x + b2w/2, b2y + 28);
}

//PAGE FIVE----------------------------------------------------------

void pageFive(){
  background(59, 67, 50);
  pushMatrix();
  translate(map(mouseX, 0, width, 590, 560) , 300);
  scale(.5);
  image(rabbitrunback, 0, -rabbitrunback.height * .3);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 260, 250) , 300);
  scale(.7);
  image(teaparty, 0, 0);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 150, 140) , 360);
  scale(-.6 + aSize * .7);
  image(alicetea, 0, -alicetea.height * .4);
  popMatrix();
  fill(201);
  text("You join the Mad Hatter for Tea", width/2, 50);
  text("The white rabbit runs past screaming 'I'M LATE!'", width/2, 75);
  
  // Left Button
  fill(buttonColorL); 
  rect(b1x + b1w/2, b1y + b1h/2, b1w, b1h);
  fill(201);
  text("Drink More Tea", b1x + b1w/2, b1y + 28);
  
  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Follow Rabbit", b2x + b2w/2, b2y + 28);
}

//PAGE SIX----------------------------------------------------------

void pageSix(){
  background(95, 45, 37);
  pushMatrix();
  translate(map(mouseX, 0, width, 520, 500) , 300);
  scale(1/aSize);
  image(rabbitrunback, 0, -rabbitrunback.height * .3);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 600 - aSize * 10, 680), 300);
  scale(3/aSize);
  image(runhatter, 0, 0);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 125, 115), 300);
  scale(-1 * (aSize - .8), aSize - .8);
  image(alice1, 80, alice1.height * .35);
  popMatrix();
  fill(201);
  text("You try to join them but they run away in fear.", width/2, 50);
  text("The white rabbit runs past screaming 'I'M LATE!'", width/2, 75);

  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Follow Rabbit", b2x + b2w/2, b2y + 28);
}



void pageSeven(){
  background(57, 48, 59);
  pushMatrix();
  translate(map(mouseX, 0, width, 260, 250) , 300);
  scale(.7);
  image(teaparty, 0, 0);
  popMatrix();
  pushMatrix();
  translate(map(mouseX, 0, width, 150, 140) , 360);
  scale(-.6 + aSize * .7);
  image(alicetea, 0, -alicetea.height * .4);
  popMatrix();
  fill(201);
  text("The Mad Hatter tells you the way out of Wonderland", width/2, 50);
  text("lies in the woods.", width/2, 75);

  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Go to the Woods", b2x + b2w/2, b2y + 28);
}

void pageEight(){
  background(45, 45, 62);
  pushMatrix();
  translate(width/2 , 250);
  scale(1.5);
  image(roadsplit, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(map(mouseX, 0, width, 210, 195), 320);
  scale(-.15 * aSize, .15 * aSize);
  image(alice1, 0, 0);
  popMatrix();
  
  fill(201);
  text("Which way should you go?", width/2, 80);
  
  // Left Button
  fill(buttonColorL); 
  rect(b1x + b1w/2, b1y + b1h/2, b1w, b1h);
  fill(201);
  text("Left", b1x + b1w/2, b1y + 28);
  
  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Right", b2x + b2w/2, b2y + 28);
}

void pageNine(){
  background(38, 39, 30);
  pushMatrix();
  translate(map(mouseX, 0, width, 110, 95), 320);
  scale(-.15 * aSize, .15 * aSize);
  image(alice1, 0, 0);
  popMatrix();
  fill(201);
  text("You become lost in the woods.", width/2, 80);
  
  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Restart", b2x + b2w/2, b2y + 28);
  
}

void pageTen(){
  background(36, 54, 37);
    
  fill(201);
  text("'If your wish is to be free,", width/2, 80);
  text("just enter the hole in the tree...'", width/2, 100);
  
  // Left Button
  fill(buttonColorL); 
  rect(b1x + b1w/2, b1y + b1h/2, b1w, b1h);
  fill(201);
  text("Enter the Tree", b1x + b1w/2, b1y + 28);
  
  // Right Button
  fill(buttonColorR);
  rect(b2x + b2w/2, b2y + b2h/2, b2w, b2h);
  fill(201);
  text("Continue Walking", b2x + b2w/2, b2y + 28);
}

void pageEleven(){
  background(255);
  fill(100);
  text("You made it out of Wonderland!", width/2, 100);
  text("THE END", width/2, 200);
}



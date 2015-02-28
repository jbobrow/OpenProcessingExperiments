
PFont groovyBaby57;
PFont groovyBaby34;
PImage hammer;
PImage web;
PImage code;
PImage green;
PImage smashed;
PImage whacacode;
int x;
int y;
int x1;
int y1;
int x2;
int y2;
int lastTime;
int counter;
int counterLastTime;
int delayAmount;
int diameter = 190;
int lives=5;
int score=0;
boolean codeCrushed = false;
boolean code1Crushed = false;
boolean code2Crushed = false;
boolean clickForScore = false;




void setup () {
  size (1500, 1000);
  counter = 60;
  counterLastTime = millis();
  resetTimer();
  smooth();
  noStroke();
  noCursor();

  groovyBaby57 = loadFont("groovyBaby-57.vlw");
  groovyBaby34 = loadFont("groovyBaby-34.vlw");
  hammer = loadImage ("hammer.png");
  web = loadImage ("web.png");
  code = loadImage ("code.png");
  green = loadImage ("green.jpg");
  smashed =loadImage ("codeSmashed.png");
  whacacode = loadImage ("whac-a-code.jpg");
}

void draw() {

  image (whacacode, 0, 0);




  //row1
  fill(255);
  ellipse(200, 300, 174, 30);
  ellipse(700, 300, 174, 30);
  ellipse(1200, 300, 174, 30);
  //row 2
  ellipse(200, 500, 174, 30);
  ellipse(700, 500, 174, 30);
  ellipse(1200, 500, 174, 30);
  //row 3
  ellipse(200, 700, 174, 30);
  ellipse(700, 700, 174, 30);
  ellipse(1200, 700, 174, 30);
  //images






  if (codeCrushed == true) {
    image(smashed, x, y);
  } 
  else {
    image(code, x, y);
  }

  if (code1Crushed == true) {
    image(smashed, x1, y1);
  } 
  else {
    image(code, x1, y1);
  }


  if (code2Crushed == true) {
    image(smashed, x2, y2);
  } 
  else { 
    image(code, x2, y2);
  }


  image(green, 0, 0);

  //HAMMER TIME! 
  pushMatrix();
  if (mousePressed) {
    rotate(-25);
  }
  image(hammer, mouseX-50, mouseY-120);
  popMatrix();


  //text
  fill(0, 0, 0);
  textFont(groovyBaby57);
  text("codes: "+score, 1109, 82);

  textFont(groovyBaby34);
  text("time: "+counter, 1225, 942);




  if ((mousePressed == true) && (dist(mouseX, mouseY, x, y) <= diameter)) {
    codeCrushed = true;
  }
  else {
    codeCrushed = false;
  }

  if ((mousePressed == true) && (dist(mouseX, mouseY, x1, y1) <= diameter)) {
    code1Crushed = true;
  }
  else {
    code1Crushed = false;
  }

  if ((mousePressed == true)  && (dist(mouseX, mouseY, x2, y2) <= diameter)) {
    code2Crushed = true;
  }
  else {
    code2Crushed = false;
  }






  //START of timer code------------------------

  if (millis() - lastTime > delayAmount) {
    

    int randomMole= int (random(1, 10)); 

    if (randomMole == 1) {
      x = 140;
      y = 175;

      x1 = 1140;
      y1 = 375;

      x2 = 1140;
      y2 = 175;
    }

    else if (randomMole == 2) {
      x = 640;
      y = 175;

      x1 = 1140;
      y1 = 575;
    }


    else if (randomMole == 3) {
      x = 1140;
      y = 175;

      x1 = 1140;
      y1 = 375;
    }


    else if (randomMole == 4) {
      x = 140;
      y = 375;
    }


    else if (randomMole == 5) {
      x = 640;
      y = 375;
    }

    else if (randomMole == 6) {
      x = 1140;
      y = 375;
    }
    else if (randomMole == 7) {
      x = 140;
      y = 575;

      x1 = 140;
      y1 = 175;

      x2 = 1140;
      y2 = 575;
    }
    else if (randomMole == 8) {
      x = 640;
      y = 575;
    }
    else if (randomMole == 9) {
      x = 1140;
      y = 575;
    } 
    else if (randomMole == 10) {
      x = 140;
      y = 175;

      x1 = 1140;
      y1 = 375;

      x2 = 1140;
      y2 = 175;
    }


    //end of moles ---------------------------------


    println("Timer triggered");
    resetTimer();
  }

  if (millis() - counterLastTime > 1000) {
    counter = counter - 1;
    counterLastTime = millis();
  }
}

void resetTimer() {
  lastTime = millis();
  delayAmount = int(random(1, 1) * 1000);
  println(delayAmount);
}


//end of timer code------------------------



void mouseClicked() {
  clickForScore = true;

  if ((clickForScore == true) && (codeCrushed == true)) {
    score = score+ 1;
  }


  if ((clickForScore == true) && (code1Crushed == true)) {
    score = score+ 1;
  }

  if ((clickForScore == true) && (code2Crushed == true)) {
    score = score+ 1;
  }
}




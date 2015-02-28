
//Alex Zajicek, "Art Student"

You16a you1;
You16b you2;

int page = 1;
float guessProb = 0;
float incriment = 0;
float frictionX = .85;
float frictionY = .85;
float bounce = -.5;
float velocityX = 0;
float velocityY = 0;
PImage page1Image;
PImage page2Image;
PImage page3Image;
PImage page4Image;
PImage page5Image;
PImage page55Image;
PImage page6Image;
PImage page7Image;
PImage page8Image;
PImage page9Image;
PImage page10Image;
PImage page11Image;
PImage page12Image;
PImage page13Image;
PImage page14Image;
PImage page15Image;
PImage page16aImage;
PImage page16bImage;
PImage page17Image;
PImage page18Image;
PImage page19Image;
PImage page20Image;
PImage page21Image;
PImage page22Image;
PImage page24Image;
PImage page25Image;
PImage page26Image;
PImage page27Image;
PImage theEndImage;
PImage passwordBar;
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;
boolean critiqueTime = false;

void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  page1Image = loadImage("1.png");
  page2Image = loadImage("2.png");
  page3Image = loadImage("3.png");
  page4Image = loadImage("4.png");
  page5Image = loadImage("5.png");
  page55Image = loadImage("5-5.png");
  page6Image = loadImage("6.png");
  page7Image = loadImage("7.png");
  page8Image = loadImage("8.png");
  page9Image = loadImage("9.png");
  page10Image = loadImage("10.png");
  page11Image = loadImage("11.png");
  page12Image = loadImage("12.png");
  page13Image = loadImage("13.png");
  page14Image = loadImage("14.png");
  page15Image = loadImage("15.png");
  page16aImage = loadImage("16a.png");
  page16bImage = loadImage("16b.png");
  page17Image = loadImage("17.png");
  page18Image = loadImage("18.png");
  page19Image = loadImage("19.png");
  page20Image = loadImage("20.png");
  page21Image = loadImage("21.png");
  page22Image = loadImage("22.png");
  page24Image = loadImage("24.png");
  page25Image = loadImage("25.png");
  page26Image = loadImage("26.png");
  page27Image = loadImage("27.png");
  theEndImage = loadImage("TheEnd.png");
  passwordBar = loadImage("PasswordBar.png");
  imageMode(CENTER);
  you1 = new You16a(400, 300);
  you2 = new You16b(250, 200);
  smooth();
}

void draw() {
  if (page != 6 && page != 9 && page != 10) {
    background(0, 0, 100);
  }
  bottomBar();
  pageIndex();
}

void pageIndex() {
  if (page == 1) {
    page1();
  } 
  else if (page == 2) {
    page2();
  } 
  else if (page == 3) {
    page3();
  } 
  else if (page == 4) {
    page4();
  } 
  else if (page == 5) {
    page5();
  } 
  else if (page == 6) {
    page55();
  } 
  else if (page == 7) {
    page6();
  } 
  else if (page == 8) {
    page7();
  } 
  else if (page == 9) {
    page8();
  } 
  else if (page == 10) {
    page9();
  } 
  else if (page == 11) {
    page10();
  } 
  else if (page == 12) {
    page11();
  } 
  else if (page == 13) {
    page12();
  } 
  else if (page == 14) {
    page13();
  } 
  else if (page == 15) {
    page14();
  } 
  else if (page == 16) {
    page15();
  } 
  else if (page == 17) {
    page16a();
  } 
  else if (page == 18) {
    page16b();
  } 
  else if (page == 19) {
    page17();
  } 
  else if (page == 20) {
    page18();
  } 
  else if (page == 21) {
    page19();
  } 
  else if (page == 22) {
    page20();
  } 
  else if (page == 23) {
    page21();
  } 
  else if (page == 24) {
    page22();
  } 
  else if (page == 25) {
    page23();
  } 
  else if (page == 26) {
    page24();
  } 
  else if (page == 27) {
    page25();
  } 
  else if (page == 28) {
    page26();
  }
  else if (page == 29) {
    page27();
  }
  else if (page == 30) {
    page28();
  }
}

void bottomBar() { //creates the bar of options on the bottom
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 50);
  rect(0, height-49, width, 49); //gray bar on bottom
  fill(0, 0, 100);
  rect(4, height-42, width/4-10, 35); //option box 1
  rect(width/4+4, height-42, width/4-10, 35); //option box 2
  rect(width/2+4, height-42, width/4-10, 35); //option box 3
  rect((width/2)+(width/4)+4, height-42, width/4-10, 35); //option box 4
}

void loadingBar() {
  for (int i = 0; i < 300; i = i+20) {
    noiseGrayscale();
    noStroke();
    ellipse(275+i, 300, 18, 18);
  }
}

void loadingBar2() {
  for (int i = 0; i < 300; i = i+20) {
    noiseGrayscale();
    noStroke();
    ellipse(275+i, 425, 18, 18);
  }
}

void virusTiles() {
  for (int i = 0; i < width; i = i+25) {
    noStroke();
    noiseGrayscale();
    rect(i, 0, 25, 25);
    for (int j = 0; j < height; j = j+25) {
      noStroke();
      noiseGrayscale();
      rect(i, j, 25, 25);
    }
  }
}

void noiseGrayscale() {
  fill(0, 0, noise(incriment +=.5)*100);
}

void mouseReleased() {
  if (mouseX > 4 && mouseX < 4+(width/4)-10 && mouseY > height-42 && mouseY < height-7) {
    button1 = true;
  }
  if (mouseX > width/4+4 && mouseX < (width/4+4)+(width/4-10) && mouseY > height-42 && mouseY < height-7) {
    button2 = true;
  }
  if (mouseX > width/2+4 && mouseX < (width/2+4)+(width/4-10) && mouseY > height-42 && mouseY < height-7) {
    button3 = true;
  }
  if (mouseX > (width/2)+(width/4)+4 && mouseX < (width/2)+(width/4)+4+(width/4-10) && mouseY > height-42 && mouseY < height-7) {
    button4 = true;
  }
  if (critiqueTime == true) {
    if (mouseX > 217 && mouseX < 313 && mouseY > 358 && mouseY < 443) {
      giveCrit();
    } 
    else if (mouseX > 342 && mouseX < 453 && mouseY > 343 && mouseY < 435) {
      giveCrit();
    } 
    else if (mouseX > 470 && mouseX < 535 && mouseY > 326 && mouseY < 404) {
      giveCrit();
    } 
    else if (mouseX > 538 && mouseX < 600 && mouseY > 300 && mouseY < 353) {
      giveCrit();
    } 
    else if (mouseX > 575 && mouseX < 633 && mouseY > 256 && mouseY < 286) {
      giveCrit();
    } 
    else if (mouseX > 561 && mouseX < 617 && mouseY > 212 && mouseY < 243) {
      giveCrit();
    } 
    else if (mouseX > 522 && mouseX < 580 && mouseY > 178 && mouseY < 204) {
      giveCrit();
    } 
    else if (mouseX > 437 && mouseX < 500 && mouseY > 105 && mouseY < 250) {
      image(page9Image, width/2, height/2);
      textSize(14);
      fill(0, 100, 100);
      text("Put another 3 hours into this.", 237, 314);
      textSize(12);
      fill(0, 0, 0);
    } 
    else if (mouseX > 146 && mouseX < 178 && mouseY > 178 && mouseY < 330) {
      image(page9Image, width/2, height/2);
      textSize(14);
      fill(0, 100, 100);
      text("I need to pee...", 237, 314);
      textSize(12);
      fill(0, 0, 0);
    }
  }
}

void buttonsOff() {
  button1 = false;
  button2 = false;
  button3 = false;
  button4 = false;
}

void boardDrawing() {
  stroke(0, 0, 0);
  if (mousePressed) {
    strokeWeight(25);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  color cp1;
  color cp2;
  color cp3;
  color cp4;
  cp1 = get(289, 209);
  cp2 = get(506, 210);
  cp3 = get(487, 289);
  cp4 = get(301, 294);
  float b = brightness(cp1);
  float b2 = brightness(cp2);
  float b3 = brightness(cp3);
  float b4 = brightness(cp4);
  if (b < 10) {
    if (b2 < 10) {
      if (b3 < 10) {
        if (b4 < 10) {
          page = 29;
        }
      }
    }
  }
  strokeWeight(1);
}

void guessPassword() {  //Code adapted from example on http://processing.org/reference/random_.html
  textSize(25);
  fill(0, 0, 0);
  String[] words = { 
    "password.", "12345.", "my birthday.", 
    "computer.", "username.", "pa$$w0rd.", 
    "idontknow.", "kthbai", 
    "just work please", "help.", 
    "PASSWORD", "p@$$vv0|2|)", "agdklajgol.", 
    "Unacceptable.", "ahrldhgi.", 
    "iSuck", "ihateschool", 
    "p0nies."
  };
  int password = int(random(words.length));
  text(words[password], 228, 425);
  textSize(12);
  guessProb = random(1);
}

void giveCrit() {
  image(page9Image, width/2, height/2);
  textSize(14);
  fill(0, 100, 100);
  String[] words = { 
    "It sucks.", "I like it.", "It's good.", 
    "I like the way you followed the assignment.", "You should've colored it with coffee.", "I don't know.", 
    "I agree with him.", "Yeah.", 
    "You should switch your major.", "I'm hungry.", 
    "You should have done something else.", "I have a sore throat.", "****", 
    "I don't like any of your art.", "Stop using black.", 
    "That's so deep.", "OMG Sooooo deep!", 
    "<3"
  };
  int crit = int(random(words.length));
  text(words[crit], 237, 314);
  textSize(12);
  fill(0, 0, 0);
}



void page1() {
  guessProb = 0;
  fill(0, 0, 0);
  image(page1Image, width/2, height/2);
  text("Check the time.", 16, height-22);
  text("Eat breakfast.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 2;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 4;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page2() {
  fill(0, 0, 0);
  image(page2Image, width/2, height/2);
  text("Check your wall clock.", 16, height-22);
  text("Check your computer.", width/4+16, height-22);
  text("Check your phone.", width/2+20, height-22);
  if (button1 == true) {
    page = 3;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 7;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 8;
    buttonsOff();
  }
}

void page3() {
  fill(0, 0, 0);
  image(page3Image, width/2, height/2);
  text("Eat breakfast.", 16, height-22);
  text("Check your phone.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 4;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 8;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page4() {
  fill(0, 0, 0);
  image(page4Image, width/2, height/2);
  text("Head to class.", 16, height-22);
  if (button1 == true) {
    page = 5;
    buttonsOff();
  } 
  else if (button2 == true) {
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page5() {
  fill(0, 0, 0);
  image(page5Image, width/2, height/2);
  text("Go draw on the board", 16, height-22);
  text("Run out of class.", width/4+16, height-22);
  if (button1 == true) {
    background(0, 0, 100);
    page = 6;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 24;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page55() {
  fill(0, 0, 0);
  image(page55Image, width/2, height/2);
  noStroke();
  fill(0, 0, 100);
  rect(0, 0, width, 55);
  strokeWeight(1);
  fill(0, 0, 0);
  text("Draw with your mouse.", 16, height-22);
  boardDrawing();
  if (button1 == true) {
    //page = 17;
    buttonsOff();
  } 
  else if (button2 == true) {
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page6() {
  fill(0, 0, 0);
  image(page6Image, width/2, height/2);
  loadingBar();
  stroke(0, 0, 0);
  fill(0, 0, 0);
  text("Wait for it to load.", 16, height-22);
  text("Slap your computer.", width/4+16, height-22);
  if (button1 == true) {
    background(0, 0, 100);
    page = 7;
    buttonsOff();
  } 
  else if (button2 == true) {
    background(0, 0, 100);
    image(page8Image, width/2, height/2);
    page = 9;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page7() {
  fill(0, 0, 0);
  image(page7Image, width/2, height/2);
  text("Run to class.", 16, height-22);
  text("Eat, then run to class.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 10;
    image(page9Image, width/2, height/2);
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 5;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page8() {
  fill(0, 0, 0);
  //image(page8Image, width/2, height/2);
  text("Guess your password.", 16, height-22);
  text("Just check your phone.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    image(passwordBar, width/2, height/2);
    guessPassword();
    if (guessProb < .05) {
      page = 30;
    }
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 8;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page9() {
  critiqueTime = true;
  fill(0, 0, 0);
  text("Click on students for crit.", 16, height-22);
  text("Head to your next class.", width/4+16, height-22);
  if (button1 == true) {
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 17;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page10() {
  fill(0, 0, 0);
  image(page10Image, width/2, height/2);
  text("Go back to sleep.", 16, height-22);
  text("Get on the computer.", width/4+16, height-22);
  text("Head to class.", width/2+20, height-22);
  if (button1 == true) {
    background(0, 0, 100);
    page = 11;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 7;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 5;
    buttonsOff();
  }
}

void page11() {
  fill(0, 0, 0);
  virusTiles();
  fill(0, 0, 100);
  stroke(0, 0, 100);
  rect(0, 0, width, 50);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  image(page11Image, width/2, height/2);
  bottomBar();
  fill(0, 0, 0);
  text("Run antivirus software.", 16, height-22);
  text("Reformat everything.", width/4+16, height-22);
  text("Call 911.", width/2+20, height-22);
  if (button1 == true) {
    page = 13;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 27;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 16;
    buttonsOff();
  }
}

void page12() {
  fill(0, 0, 0);
  image(page12Image, width/2, height/2);
  text("E-mail the teacher.", 16, height-22);
  text("Cry.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 14;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 15;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page13() {
  fill(0, 0, 0);
  image(page13Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page14() {
  fill(0, 0, 0);
  image(page14Image, width/2, height/2);
  text("E-mail the teacher.", 16, height-22);
  text("Cry more.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 14;
    buttonsOff();
  } 
  else if (button2 == true) {
    background(0, 0, 100);
    page = 15;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page15() {
  fill(0, 0, 0);
  image(page15Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page16a() {
  fill(0, 0, 0);
  image(page16aImage, width/2, height/2);
  text("Move with the arrow keys.", 16, height-22);
  //  text("Exit.", 16, height-22);
  //  text("Go to the next room.", width/4+16, height-22);
  you1.collide();
  you1.moveYou();
  you1.display();
  if (button1 == true) {
    //page = 26;
    buttonsOff();
  } 
  else if (button2 == true) {
    //page = 18;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page16b() {
  fill(0, 0, 0);
  image(page16bImage, width/2, height/2);
  text("Move with the arrow keys.", 16, height-22);
  //text("Exit.", 16, height-22);
  //text("Go to the basement.", width/4+16, height-22);
  //text("Go to your next class.", width/2+20, height-22);
  you2.collide();
  you2.moveYou();
  you2.display();
  if (button1 == true) {
    //page = 17;
    buttonsOff();
  } 
  else if (button2 == true) {
    //page = 19;
    buttonsOff();
  } 
  else if (button3 == true) {
    //page = 20;
    buttonsOff();
  }
}

void page17() {
  fill(0, 0, 0);
  image(page17Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page18() {
  fill(0, 0, 0);
  image(page18Image, width/2, height/2);
  text("Red.", 16, height-22);
  text("Blue.", width/4+16, height-22);
  text("Green.", width/2+20, height-22);
  if (button1 == true) {
    page = 21;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 22;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 23;
    buttonsOff();
  }
}

void page19() {
  fill(0, 0, 0);
  image(page19Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page20() {
  fill(0, 0, 0);
  image(page20Image, width/2, height/2);
  text("Run out of class.", 16, height-22);
  text("Cry.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 24;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 25;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page21() {
  fill(0, 0, 0);
  image(page21Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page22() {
  fill(0, 0, 0);
  image(page22Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page23() {
  fill(0, 0, 0);
  image(page14Image, width/2, height/2);
  text("Keep crying.", 16, height-22);
  text("Run out of class.", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    background(0, 0, 100);
    page = 25;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 24;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page24() {
  fill(0, 0, 0);
  image(page24Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  text("Go back to sleep.", width/2+20, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    page = 11;
    buttonsOff();
  }
}

void page25() {
  fill(0, 0, 0);
  image(page25Image, width/2, height/2);
  text("The End.", 16, height-22);
  text("Restart?", width/4+16, height-22);
  if (button1 == true) {
    page = 28;
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page26() {
  fill(0, 0, 0);
  image(theEndImage, width/2, height/2);
  text("Restart?", 16, height-22);
  if (button1 == true) {
    page = 1;
    buttonsOff();
  } 
  else if (button2 == true) {
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page27() {
  fill(0, 0, 0);
  image(page26Image, width/2, height/2);
  text("Leave class.", 16, height-22);
  if (button1 == true) {
    page = 17;
    buttonsOff();
  } 
  else if (button2 == true) {
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

void page28() {
  fill(0, 0, 0);
  image(page27Image, width/2, height/2);
  text("Wow, you guessed right.", 16, height-22);
  text("Wait for it to log in.", width/4+16, height-22);
  loadingBar2();
  if (button1 == true) {
    buttonsOff();
  } 
  else if (button2 == true) {
    page = 12;
    buttonsOff();
  } 
  else if (button3 == true) {
    buttonsOff();
  }
}

class You16a {
  float x, y, speedx, speedy;
  //constructor
  You16a(float _x, float _y) {
    x = _x;
    y = _y;
  }
  //methods
  void moveYou() {
    x+=velocityX;
    y+=velocityY;
    velocityY *= frictionY;
    velocityX *= frictionX;
  }
  void collide() {
    color cp;
    /*img16b.loadPixels();
     int img16bSize = img16b.width * img16b.height;
     for (int i = 0; i < img16bSize; i++) {
     cp = img16b.pixels[i];
     float h = hue(cp);
     float s = saturation(cp);
     float b = brightness(cp);
     }*/
    if (velocityY > 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x), int(y+12+i));
        float b = brightness(cp);
        if (b < 10) {
          velocityY*=bounce;
        }
      }
    }
    else if (velocityY < 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x), int(y-12-i));
        float b = brightness(cp);
        if (b < 10) {
          velocityY*=bounce;
        }
      }
    }
    if (velocityX > 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x+12+i), int(y));
        float b = brightness(cp);
        if (b < 10) {
          velocityX*=bounce;
        }
      }
    } 
    else if (velocityX < 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x-12-i), int(y));
        float b = brightness(cp);
        if (b < 10) {
          velocityX*=bounce;
        }
      }
    }
    if (x > 65 && x < 210 && y > 453) {
      page = 26;
      x = 400;
      y = 300;
    }
    if (x > 672 && y > 82 && y < 170) {
      page = 18;
      x = 400;
      y = 300;
    }
  }
  void display() {
    ellipse(x, y, 25, 25);
  }
}

class You16b {
  float x, y, speedx, speedy;
  //constructor
  You16b(float _x, float _y) {
    x = _x;
    y = _y;
  }
  //methods
  void moveYou() {
    x+=velocityX;
    y+=velocityY;
    velocityY *= frictionY;
    velocityX *= frictionX;
  }
  void collide() {
    color cp;
    /*img16b.loadPixels();
     int img16bSize = img16b.width * img16b.height;
     for (int i = 0; i < img16bSize; i++) {
     cp = img16b.pixels[i];
     float h = hue(cp);
     float s = saturation(cp);
     float b = brightness(cp);
     }*/
    if (velocityY > 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x), int(y+12+i));
        float b = brightness(cp);
        if (b < 10) {
          velocityY*=bounce;
        }
      }
    }
    else if (velocityY < 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x), int(y-12-i));
        float b = brightness(cp);
        if (b < 10) {
          velocityY*=bounce;
        }
      }
    }
    if (velocityX > 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x+12+i), int(y));
        float b = brightness(cp);
        if (b < 10) {
          velocityX*=bounce;
        }
      }
    } 
    else if (velocityX < 0) {
      for (int i = 0; i < 6; i++) {
        cp = get(int(x-12-i), int(y));
        float b = brightness(cp);
        if (b < 10) {
          velocityX*=bounce;
        }
      }
    }
    if (x < 128 && y > 150 && y < 210) {
      page = 17;
      x = 250;
      y = 200;
    }
    if (x > 500 && x < 605 && y < 165) {
      page = 19;
      x = 250;
      y = 200;
    }
    if (x > 475 && x < 580 && y > 450) {
      page = 20;
      x = 250;
      y = 200;
    }
  } 
  void display() {
    ellipse(x, y, 25, 25);
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      velocityY = -5;
    } 
    else if (keyCode == DOWN) {
      velocityY = 5;
    } 
    else if (keyCode == LEFT) {
      velocityX = -5;
    } 
    else if (keyCode == RIGHT) {
      velocityX = 5;
    }
  }
}



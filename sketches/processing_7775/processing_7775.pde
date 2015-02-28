
int page = 1;   
PFont font;

int b1x = 50;   // Button 1 x-coordinate
int b1y = 400;  // Button 1 y-coordinate
int b1w = 100;  // Button 1 width
int b1h = 50;   // Button 1 height

int b2x = 220;  // Button 2
int b2y = 400;
int b2w = 140;
int b2h = 50;

int b3x= 420;
int b3y= 400;
int b3w= 140;
int b3h= 50;


int x;

PImage Page1;
PImage Page2;
PImage Page3;
PImage Page4;
PImage Page5;
PImage Page6;
PImage Page7;
PImage Page8;
PImage Page9;
PImage Page10;
PImage Page11;
PImage Page12;
PImage Page13;
PImage Page14;

void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("Ondine_Regular-48.vlw");
  textFont(font);
  
    Page1 = loadImage("Card1.png");
    Page2 = loadImage("Card2.png");
    Page3 = loadImage("Card3.png");
    Page4 = loadImage("Card4.png");
    Page5 = loadImage("Card5.png");
    Page6 = loadImage("Card6.png");
    Page7 = loadImage("Card7.png");
    Page8 = loadImage("Card8.png");
    Page9 = loadImage("Card9.png");
    Page10 = loadImage("Card10.png");
    Page11 = loadImage("Card11.png");
    Page12 = loadImage("Card12.png");
    Page13 = loadImage("Card13.png");
    Page14 = loadImage("Card14.png");
 
}

void draw() {
  if (page == 1) {
    pageOne();
  } else if (page == 2) {
    pageTwo(); 
  } else if (page == 3) {
    pageThree(); 
  } else if (page == 5) {
    pageFive();
  } else if (page == 6) {
    pageSix();
  } else if (page == 7) {
    pageSeven();
  } else if (page == 8) {
    pageEight();
  } else if (page == 9) {
    pageNine();
  } else if (page == 4) {
    pageFour();
  } else if (page == 10) {
    pageTen();
  } else if (page == 11) {
    pageEleven();
  } else if (page == 12) {
    pageTwelve();
  }else if (page == 13) {
    pageThirteen();
  }else if (page == 14) {
    pageFourteen();
  }
}

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    } 

  } else if (page == 2) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 3; 
    } 

  } else if (page == 3) {
    if (overButton(b1x+385, b1y-100, b1w, b1h) == true) {
      page = 5; 
    } 
    else if (overButton(b2x+227, b2y-50, b2w, b2h) == true) {
      page = 9;
    }   
    else if (overButton(b3x+32, b3y, b3w, b3h) == true) {
      page = 8;
    }
  }else if (page == 5) {
    if (overButton(b1x, b1y-250, b1w, b1h) == true) {
      page = 6; 
  }else if (page == 5) {
    if (overButton(b3x, b3y-250, b3w, b3h) == true) {
      page = 7; 
    }
}
  }else if (page == 6) {
    if (overButton(b1x+385, b1y, b1w, b1h) == true) {
      page = 1; 
}
  }else if (page == 7) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 1; 
}

  } else if (page == 9) {
    if (overButton(b1x+20, b1y-100, b1w, b1h) == true) {
      page = 4; 

}else if (page == 9) {
    if (overButton(b3x-340, b3y-5, b3w, b3h) == true) {
      page = 8; 

}else if (page == 9) {
    if (overButton(b2x-90, b2y-55, b2w, b2h) == true) {
      page = 10; 
    }
}
}
  }else if (page == 4) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 1; 

}
  }else if (page == 8) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 1; 

}
  }else if (page == 10) {
    if (overButton(b1x+372, b1y-50, b1w, b1h) == true) {
      page = 11; 

}else if (page == 10) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 14; 

}
}
  }else if (page == 11) {
    if (overButton(b1x-25, b1y+8, b1w, b1h) == true) {
      page = 12; 

}else if (page == 11) {
    if (overButton(b3x-220, b3y+8, b3w, b3h) == true) {
      page = 13; 

}
}
  }else if (page == 12) {
    if (overButton(b1x+37, b1y, b1w, b1h) == true) {
      page = 1; 

}

  }else if (page == 13) {
    if (overButton(b1x-8, b1y, b1w, b1h) == true) {
      page = 1; 

}
  }else if (page == 14) {
    if (overButton(b1x+10, b1y, b1w, b1h) == true) {
      page = 1; 

}
  }
}


boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}


// PAGE ONE

void pageOne() {
  textSize (20);
  background(147, 195, 224);
  image (Page1,0,0);
  
  fill(255);
 
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Next", b1x + b1w/2, b1y + 32);
  
  // Right Button

  fill(0);
  textAlign(LEFT);
}


// PAGE TWO

void pageTwo() {
  background(195, 147, 224);
  fill(255);
   image(Page2,0,0);
  
  // Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Next", b1x + b1w/2, b1y + 32);
  textAlign(LEFT);
}


// PAGE THREE

void pageThree() {
  background(195, 224, 147);
 image(Page3,0,0);


 // Left Button
  if (overButton(b1x+387, b1y-100, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Smoke More", b1x + b1w/2+387, b1y + 32-100);
  
// Center Button
  if (overButton(b2x+200, b2y-50, b2w, b2h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  text("Eat Big Mushroom", b2x + b2w/2+227, b2y + 32-50);
  textAlign(LEFT);
  
  // Right Button

  if (overButton(b3x, b3y, b3w, b3h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Eat Tiny Mushroom", b3x + b3w/2+32, b3y + 32);
}
  
  // PAGE FIVE

void pageFive() {
  background(255, 100, 147);
  
image (Page5,0,0);

 // Left Button
  if (overButton(b1x, b1y-250, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Smoke More", b1x + b1w/2, b1y + 32-250);
  

  // Right Button

  if (overButton(b3x, b3y-250, b3w, b3h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Try to tell the story", b3x + b3w/2, b3y + 32-250);
  }
  
  
  // PAGE SIX

void pageSix() {
  fill(255);
  background(0);
  image(Page6,0,0);
  

 // Left Button
  if (overButton(b1x+385, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2+385, b1y + 32);
  
  }
  
    // PAGE SEVEN

void pageSeven() {
  fill(255);
  background(0);
  image (Page7,0,0);
  

 // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2, b1y + 32);
  
  }
  
    // PAGE EIGHT

void pageEight() {
  fill(255);
  background(0);
  image (Page8,0,0);
  

 // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2, b1y + 32);
  
  }  
  
      // PAGE NINE

void pageNine() {
  background(125, 246, 180);
 image (Page9,0,0);

 // Left Button
  if (overButton(b1x+20, b1y-100, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Step on Caterpillar", b1x + b1w/2+20, b1y + 32-100);
  
// Center Button
  if (overButton(b2x-90, b2y-55, b2w, b2h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  text("Eat Mushroom Again", b2x + b2w/2-90, b2y + 32-55);
  textAlign(LEFT);
  
  // Right Button

  if (overButton(b3x-340, b3y-5, b3w, b3h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Try the Small Mushroom", b3x + b3w/2+10-340, b3y + 32-5);
  
  }  

    // PAGE FOUR

void pageFour() {
  fill(255);
  background(0);
  image (Page4,0,0);

 // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2+7, b1y + 32);
  
  }  
  
    // PAGE TEN

void pageTen() {
  background(15, 204, 255);
image (Page10,0,0);


 // Left Button
  if (overButton(b1x+372, b1y-50, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Reason with bird", b1x + b1w/2+372, b1y + 32-50);
  

  // Right Button

  if (overButton(b3x, b3y, b3w, b3h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Eat Small Mushrooms", b3x + b3w/2+10, b3y + 32);
  }

    // PAGE ELEVEN
void pageEleven() {
  background(100, 145, 185);
image (Page11,0,0);


 // Left Button
  if (overButton(b1x-25, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Cook Eggs", b1x + b1w/2-25, b1y + 40);
  

  // Right Button

  if (overButton(b3x-220, b3y, b3w, b3h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Eat The Eggs Raw", b3x + b3w/2-220, b3y + 40);
  }

    // PAGE TWELVE
void pageTwelve() {
  fill (255);
  background(0);
  image (Page12,0,0);
  
 // Left Button
  if (overButton(b1x+37, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2+ 37, b1y + 32);
}
  
      // PAGE THIRTEEN
void pageThirteen() {
  fill (255);
  background(0);
  
  image (Page13,0,0);

 // Left Button
  if (overButton(b1x-8, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2-8, b1y + 32);
}

      // PAGE FOURTEEN
void pageFourteen() {
  fill (0);
  background(255);
 
  
 text ("WIN", 245, 300);
  image (Page14,0,0);

 // Left Button
  if (overButton(b1x+10, b1y, b1w, b1h) == true) {
    fill(100); 
  } 
  else {
    fill(255); 
  }
  textAlign(CENTER);
  text("Restart?", b1x + b1w/2+10, b1y + 32);
}


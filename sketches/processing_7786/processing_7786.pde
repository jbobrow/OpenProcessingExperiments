

int page = 1;

//images
PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;
PImage p8;
PImage p9;
PImage p10;
PImage p11;
PImage p12;
PImage p13;
PImage p14;

//fonts
PFont fontbutton;
PFont fonttext;

//variables
int b1x = 475;   //PAGE ONE enter
int b1y = 360;  
int b1w = 140; 
int b1h = 50;   

int b2x = 385;   //PAGE TWO go through door
int b2y = 230;
int b2w = 200;
int b2h = 45;

int b3x = 360;   //PAGE TWO stay in room
int b3y = 300;
int b3w = 260;
int b3h = 45;

int b4x = 40;   //PAGE THREE follow rabbit
int b4y = 230;  
int b4w = 190; 
int b4h = 45; 

int b5x = 40;   // PAGE THREE go back
int b5y = 320;  
int b5w = 120; 
int b5h = 45; 

int b6x = 420;   // PAGE FOUR drink it
int b6y = 240;  
int b6w = 130; 
int b6h = 45; 

int b7x = 390;   // PAGE FOUR cry
int b7y = 310;  
int b7w = 210; 
int b7h = 45; 

int b8x = 475;   // PAGE FIVE start over
int b8y = 400;  
int b8w = 140; 
int b8h = 45; 

//int b9x = 350;   // PAGE SIX swim on your own
//int b9y = 165;  
//int b9w = 200; 
//int b9h = 45; 

int b10x = 390;   // PAGE SIX take his offer
int b10y = 165;  
int b10w = 140; 
int b10h = 45; 

int b11x = 115;   // PAGE SEVEN start over
int b11y = 330;  
int b11w = 140; 
int b11h = 45; 

int b12x = 140;   // PAGE EIGHT eat bread
int b12y = 150;  
int b12w = 250; 
int b12h = 45; 

int b13x = 420;   // PAGE EIGHT wait
int b13y = 150;  
int b13w = 70; 
int b13h = 45; 

int b14x = 375;   // PAGE NINE accept his invitation
int b14y = 355;  
int b14w = 230; 
int b14h = 45; 

int b15x = 395;   // PAGE NINE continue walking
int b15y = 405;  
int b15w = 210; 
int b15h = 45; 

int b16x = 350;   // PAGE TEN play again
int b16y = 110;  
int b16w = 145; 
int b16h = 45; 

int b17x = 120;   // PAGE ELEVEN help
int b17y = 320;  
int b17w = 80; 
int b17h = 45; 

int b18x = 95;   // PAGE ELEVEN refuse
int b18y = 370;  
int b18w = 140; 
int b18h = 45; 

int b19x = 475;   // PAGE TWELVE play again
int b19y = 400;  
int b19w = 145; 
int b19h = 45; 

int b20x = 475;   // PAGE THIRTEEN start over
int b20y = 400;  
int b20w = 140; 
int b20h = 45; 

int b21x = 475;   // PAGE FOURTEEN start over
int b21y = 400;  
int b21w = 140; 
int b21h = 45; 



void setup() {
  size(640, 480); 
  smooth();

  //fonts
  fontbutton = loadFont("EdwardianScriptITC-75.vlw");
  fonttext = loadFont ("Didot-Bold-100.vlw");
  textFont (fontbutton);
  textFont (fonttext);

  //images
  p1 = loadImage ("pageonepicture.png");
  p2 = loadImage ("pagetwopicture.png");
  p3 = loadImage ("pagethreepicture.png");
  p4 = loadImage ("pagefourpicture.png");
  p5 = loadImage ("pagefive.png");
  p6 = loadImage ("pagesixpicture.png");
  p7 = loadImage ("pagesevenpicture.png");
  p8 = loadImage ("pageeightpicture.png");
  p9 = loadImage ("pageninepicture.png");
  p10 = loadImage ("pagetenpicture.png");
  p11 = loadImage ("pageelevenpicture.png");
  p12 = loadImage ("pagetwelvepicture.png");
  p13 = loadImage ("pagethirteenpicture.png");
  p14 = loadImage ("pagefourteenpicture.png");
}


void draw() {
  if (page == 1) {
    pageOne();
    image(p1, 0, 0);
  } 
  else if (page == 2) {
    pageTwo(); 
    image (p2, 0, 0);
  } 
  else if (page == 3) {
    pageThree(); 
    image (p3, 0, 0);
  }
  else if (page == 4) {
    pageFour();
    image (p4, 0, 0);
  }
  else if (page == 5) {
    pageFive();
    image (p5, 0, 0);
  }
  else if (page == 6) {
    pageSix();
    image (p6, 0, 0);
  }
  else if (page == 7) {
    pageSeven();
    image (p7, 0, 0);
  }
  else if (page == 8) {
    pageEight();
    image (p8, 0, 0);
  }
  else if (page == 9) {
    pageNine();
    image (p9, 0, 0);
  }
  else if (page == 10) {
    pageTen();
    image (p10, 0, 0);
  }
  else if (page == 11) {
    pageEleven();
    image (p11, 0, 0);
  }
  else if (page == 12) {
    pageTwelve();
    image (p12, 0, 0);
  }
  else if (page == 13) {
    pageThirteen();
    image (p13, 0, 0);
  }
  else if (page == 14) {
    pageFourteen();
    image (p14, 0, 0);
  }
}

//PAGE CHANGES

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    }
  } 
  else if (page == 2) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3; 
    } 
    else if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 4; 
    }
  } 
  else if (page == 3) {
    if (overButton(b4x, b4y, b4w, b4h) == true) {
      page = 8; 
    } 
    else if (overButton(b5x, b5y, b5w, b5h) == true) {
      page = 2; 
    }
  } 
  else if (page == 4) {
    if (overButton(b6x, b6y, b6w, b6h) == true) {
      page = 5; 
    } 
    else if (overButton(b7x, b7y, b7w, b7h) == true) {
      page = 6; 
    }
  } 
  else if (page == 5) {
    if (overButton(b8x, b8y, b8w, b8h) == true) {
      page = 2; 
    } 
  } 
  else if (page == 6) {
   // if (overButton(b9x, b9y, b9w, b9h) == true) {
   //   page = 9; 
   // } 
    if (overButton(b10x, b10y, b10w, b10h) == true) {
      page = 7; 
    }
  } 
  else if (page == 7) {
    if (overButton(b11x, b11y, b11w, b11h) == true) {
      page = 2; 
    } 
  } 
  else if (page == 8) {
    if (overButton(b12x, b12y, b12w, b12h) == true) {
      page = 9; 
    } 
    else if (overButton(b13x, b13y, b13w, b13h) == true) {
      page = 14; 
    }
  } 
  else if (page == 9) {
    if (overButton(b14x, b14y, b14w, b14h) == true) {
      page = 10; 
    } 
    else if (overButton(b15x, b15y, b15w, b15h) == true) {
      page = 11; 
    }
  } 
  else if (page == 10) {
    if (overButton(b16x, b16y, b16w, b16h) == true) {
      page = 2; 
    } 
  } 
  else if (page == 11) {
    if (overButton(b17x, b17y, b17w, b17h) == true) {
      page = 12; 
    } 
    else if (overButton(b18x, b18y, b18w, b18h) == true) {
      page = 13; 
    }
  } 
  else if (page == 12) {
    if (overButton(b19x, b19y, b19w, b19h) == true) {
      page = 2; 
    } 
  } 
  else if (page == 13) {
    if (overButton(b20x, b20y, b20w, b20h) == true) {
      page = 2; 
    } 
  }
  else if (page == 14) {
    if (overButton(b21x, b21y, b21w, b21h) == true) {
      page = 2; 
    } 
  }  
}


// click
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
  background(0);

  fill(255);
  textFont (fonttext);
  textSize (60);
  text("Welcome", 170, 70);
  textSize (45);
  text("to", 243, 105);
  textSize (70);
  text ("Wonderland", 350, 150);
  textSize (20);
  textAlign (LEFT);
  text ("Make your way through Wonderland! The right decisions will lead you to fun, but be careful... the wrong ones will lead you to disaster!", 330, 220, 300, 200);

  //Enter Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255,0,0); 
  } 
  else {
    fill(0); 
  }
  noStroke();
  rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  textFont(fontbutton);
  textSize (55);
  fill(255);
  text("Enter...", b1x + b1w/2, b1y + 40);

}

// PAGE TWO

void pageTwo() {
  background(0);
  fill(255);
  textAlign (CENTER);
  textFont (fonttext);
  textSize (26);
  text("You enter a room and behind a curtain you discover a small door. Your options are...", 20, 50, 600, 90);

  // TOP Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }

  rect(b2x, b2y, b2w, b2h);
  fill(255);
  textFont (fontbutton);
  textSize (35);
  textAlign(CENTER);
  text("Go through the door", b2x + b2w/2, b2y + 30);

  //BOTTOM Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }

  rect (b3x, b3y, b3w, b3h);
  fill (255);
  textFont (fontbutton);
  textSize (35);
  textAlign(CENTER);
  text("Stay and explore the room", b3x + b3w/2, b3y + 30);
}

// PAGE THREE

void pageThree() {
  background(0);
  fill(255);
  textAlign (LEFT);
  textFont (fonttext);
  textSize (26);
  text("You find yourself in a tiny hallway and notice a rabbit speeding past. Do you...", 20, 50, 450, 100);

  // Left Button
  if (overButton(b4x, b4y, b4w, b4h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }
  rect(b4x, b4y, b4w, b4h);
  textFont (fontbutton);
  textSize (35);
  textAlign(CENTER);
  fill(255);
  text("Follow the rabbit?", b4x + b4w/2, b4y + 32);

  // Right Button
  if (overButton(b5x, b5y, b5w, b5h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }
  rect(b5x, b5y, b5w, b5h);
  fill(255);
  text("Go back?", b5x + b5w/2, b5y + 32);
}

//PAGE FOUR

void pageFour () {
  background (0);
  fill (255);
  textAlign (CENTER);
  textFont (fonttext);
  textSize (26);
  text ("You find a bottle labeled 'Drink Me' sitting on a table. Do you...", 350, 70, 300, 200);

  // Left Button
  if (overButton(b6x, b6y, b6w, b6h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }
  rect(b6x, b6y, b6w, b6h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(255);
  text("Drink it?", b6x + b6w/2, b6y + 32);

  // Right Button
  if (overButton(b7x, b7y, b7w, b7h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }
  rect(b7x, b7y, b7w, b7h);
  fill(255);
  text("Cry in frustration?", b7x + b7w/2, b7y + 32);
}

//PAGE FIVE

void pageFive () {
  background (0);
  textFont (fonttext);
  textSize (26);
  textAlign (CENTER);
  text ("Oh no! Whatever was inside that bottle made you grow extremely tall and you're stuck being gigantic forever!", 375, 100, 200, 300);

  // Left Button
  if (overButton(b8x, b8y, b8w, b8h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(0); 
  }
  rect(b8x, b8y, b8w, b8h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(255);
  text("Start Over", b8x + b8w/2, b8y + 32);

}

//PAGE SIX

void pageSix () {
  background (255);
  textAlign (CENTER);
  textFont (fonttext);
  textSize (26);
  text ("You cried so much that you created a sea of tears! While swimming to safety you come across a large rat who offers you a ride to shore. You decide to...", 20, 30, 600, 150);

  // Left Button
  if (overButton(b10x, b10y, b10w, b10h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b10x, b10y, b10w, b10h);
  textFont (fontbutton);
  textSize (35);
  textAlign(CENTER);
  fill(0);
  text("Take his offer", b10x + b10w/2, b10y + 32);

  // Right Button
//  if (overButton(b9x, b9y, b9w, b9h) == true) {
//    fill(255, 0, 0); 
//  } 
//  else {
//    fill(255); 
//  }
//  rect(b9x, b9y, b9w, b9h);
 // fill(0);
 // text("Swim on your own", b9x + b9w/2, b9y + 32);
}

//PAGE SEVEN

void pageSeven () {
  background (255);
  textFont (fonttext);
  textSize (26);
  text ("Oh no! The rat tricked you and took you to the lobster who thought you looked tasty and made you his meal!", 40, 130, 300, 230);

  // Left Button
  if (overButton(b11x, b11y, b11w, b11h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b11x, b11y, b11w, b11h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Start Over", b11x + b11w/2, b11y + 32);

}

//PAGE EIGHT

void pageEight () {
  background (255);
  textAlign (CENTER);
  textFont (fonttext);
  textSize (20);
  text ("The hallway lead straight into the rabbit's house and you barely fit inside his tiny room in which you found a loaf of bread labeled 'Eat Me'. The rabbit thinks you're a giant monster and wants you out. What do you do?", 30, 30, 580, 150);

  // Left Button
  if (overButton(b12x, b12y, b12w, b12h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b12x, b12y, b12w, b12h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Eat the bread you found", b12x + b12w/2, b12y + 32);

  // Right Button
  if (overButton(b13x, b13y, b13w, b13h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b13x, b13y, b13w, b13h);
  fill(0);
  text("Wait ", b13x + b13w/2, b13y + 32);
}

//PAGE NINE

void pageNine () {
  background (255);
  textAlign (CENTER);
  textFont (fonttext);
  textSize (16);
  fill (0);
  text ("The bread you ate made you shrink and you escaped the rabbit's house. While wandering down the road you see a cat in a tree. He says he has somewhere to be and invites you to go with him. Do you...", 200, 250, 400, 150);

  // Left Button
  if (overButton(b14x, b14y, b14w, b14h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b14x, b14y, b14w, b14h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Accept his invitation?", b14x + b14w/2, b14y + 32);

  // Right Button
  if (overButton(b15x, b15y, b15w, b15h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b15x, b15y, b15w, b15h);
  fill(0);
  text("Continue walking?", b15x + b15w/2, b15y + 32);
}

//PAGE TEN

void pageTen () {
  background (255);
  textFont (fonttext);
  textSize (26);
  text ("Lucky you! You took a chance and your trust in the cat led you to a party!", 30, 30, 580, 100);

  // Left Button
  if (overButton(b16x, b16y, b16w, b16h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b16x, b16y, b16w, b16h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Play Again", b16x + b16w/2, b16y + 32);

}

//PAGE ELEVEN

void pageEleven () {
  background (255);
  textAlign (CENTER);
  textFont (fonttext);
  textSize (18);
  text ("You keep making your way down the road and come across a few worried looking playing cards frantically trying to paint some roses. They tell you they'll be in trouble if they don't finish quickly and ask for your help. What do you do?", 50, 100, 250, 250);

  // Left Button
  if (overButton(b17x, b17y, b17w, b17h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b17x, b17y, b17w, b17h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Help", b17x + b17w/2, b17y + 32);

  // Right Button
  if (overButton(b18x, b18y, b18w, b18h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b18x, b18y, b18w, b18h);
  fill(0);
  text("Politely refuse", b18x + b18w/2, b18y + 32);
}

//PAGE TWELVE

void pageTwelve () {
  background (255);
  textFont (fonttext);
  textSize (20);
  text ("The cards appreciated your help very much! You saved their lives from the evil queen and they took you to live in their palace to be treated like a princess!", 30, 50, 580, 100);

  // Left Button
  if (overButton(b19x, b19y, b19w, b19h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b19x, b19y, b19w, b19h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Play Again", b19x + b19w/2, b19y + 32);
}

//PAGE THIRTEEN

void pageThirteen () {
  background (255);
  textFont (fonttext);
  textSize (26);
  textAlign (CENTER);
  text ("On no! The cards are infuriated at your refusal and their entire deck attacks you and drives you right out of Wonderland!", 30, 30, 580, 100);

  // Left Button
  if (overButton(b20x, b20y, b20w, b20h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b20x, b20y, b20w, b20h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Start Over", b20x + b20w/2, b20y + 32);
}

//PAGE FOURTEEN

void pageFourteen () {
  background (255);
  textFont (fonttext);
  textSize (26);
  textAlign (CENTER);
  text ("Oh no! You took a risk with no reward. The rabbit hired the lizard to get you out of the house by burning it down with you still stuck inside!", 330, 100, 250, 280);

  // Left Button
  if (overButton(b21x, b21y, b21w, b21h) == true) {
    fill(255, 0, 0); 
  } 
  else {
    fill(255); 
  }
  rect(b21x, b21y, b21w, b21h);
  textAlign(CENTER);
  textFont (fontbutton);
  textSize (35);
  fill(0);
  text("Start Over", b21x + b21w/2, b21y + 32);
}









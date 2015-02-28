
int page = 1;
PFont font;

PImage One;
PImage Two;
PImage Three;
PImage Four;
PImage Five;
PImage Six;
PImage Seven;
PImage Eight;
PImage Nine;
PImage Ten;
PImage Eleven;
PImage Twelve;
PImage Thirteen;
PImage Fourteen;
PImage Sixteen;
PImage Seventeen;
PImage Eighteen;

int b1x = 350;  // Button 1 x-coordinate
int b1y = 400;  // Button 1 y-coordinate
int b1w = 100;  // Button 1 width
int b1h = 50;   // Button 1 height

int b2x = 500;  // Button 2 x-coordinate
int b2y = 400;  // Button 2 y-coordinate
int b2w = 100;  // Button 2 width
int b2h = 50;   // Button 2 height

int b3x = 275; // Button on Page 3
int b3y = 350;
int b3w = 65;
int b3h = 100;

int b11x = 300; // Button on Page 11
int b11y = 150;
int b11w = 150;
int b11h = 150;

int b12x = 200; // Button on Page 12
int b12y = 200;
int b12w = 300;
int b12h = 150;

void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("Futura-Medium-20.vlw");
  textFont(font);
}

void draw() {
  if (page == 1) {
    pageOne();
  } else if (page == 2) {
    pageTwo(); 
  } else if (page == 3) {
    pageThree(); 
  } else if (page == 4) {
    pageFour();
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
  } else if (page == 10) {
    pageTen();
  } else if (page == 11) {
    pageEleven();
  } else if (page == 12) {
    pageTwelve();
  } else if (page == 13) {
    pageThirteen();
  } else if (page == 14) {
    pageFourteen();
  } else if (page == 15) {
    pageFifteen();
  } else if (page == 16) {
    pageSixteen();
  } else if (page == 17) {
    pageSeventeen();
  } else if (page == 18) {
    pageEighteen();
  } else if (page == 19) {
    pageNineteen();
  }
}

void mousePressed() {
  if (page == 1) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 2; 
    } 
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 18;
    }
  } else if (page == 2) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3; 
    } 
  } 
    else if (page == 3) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 4; 
    } 
  } 
    else if (page == 4) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 5; 
    } 
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 6; 
    } 
  } 
    else if (page == 5) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 7; 
    } 
  } 
    else if (page == 6) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 7; 
    } 
  } 
    else if (page == 7) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 8; 
    } 
  } 
    else if (page == 8) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 9; 
    } 
  } 
    else if (page == 9) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 10; 
    } 
  } 
    else if (page == 10) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 11; 
    } 
  } 
    else if (page == 11) {
    if (overButton(b11x, b11y, b11w, b11h) == true) {
      page = 12; 
    } 
  } 
    else if (page == 12) {
    if (overButton(b12x, b12y, b12w, b12h) == true) {
      page = 13; 
    } 
  } 
    else if (page == 13) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 14; 
    } 
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 15; 
    } 
  } 
    else if (page == 14) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 16; 
    } 
  } 
    else if (page == 15) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 1; 
    } 
  } 
    else if (page == 16) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 17; 
    } 
  } 
    else if (page == 17) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 18; 
    } 
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 19; 
    } 
  } 
    else if (page == 18) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 19; 
    } 
  } 
      else if (page == 19) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 1; 
    } 
  } 
}

// Click over button
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
  One = loadImage("1-2.gif");
  image(One, 0, 0);
  text("Hello, Alice.", 50, 100);
  text("Welcome to Wonderland!", 50, 125);
  
  // Left Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  textAlign(CENTER);
  fill(0);
  text("Play", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE TWO

void pageTwo() {
  background(255);
  fill(0);
  Two = loadImage("2.gif");
  image(Two, 0, 0);
  text("You're bored. Follow the White Rabbit?", 50, 100);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Follow", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE THREE

void pageThree() {
  background(255);
  fill(0);

  // Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
     fill(255);
   }
  else {
    fill(0); 
  }
  rect(b3x, b3y, b3w, b3h);
  
  Three = loadImage("3.gif");
  image(Three, 0, 0);
  text("You come to a small door.", 50, 100);
  
//  // Button
//  if (overButton(b2x, b2y, b2w, b2h) == true) {
//    fill(255); 
//  } 
//  else {
//    fill(153); 
//  }
//  rect(b2x, b2y, b2w, b2h);
//  fill(0);
//  textAlign(CENTER);
//  text("Enter", b2x + b2w/2, b2y + 32);
//  textAlign(LEFT);
}


// PAGE FOUR

void pageFour() {
  background(255);
  fill(0);
  Four = loadImage("4.gif");
  image(Four, 0, 0);
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  fill(0);
  text("Drink me!", b1x + b1w/2, b1y + 32);
  
  // Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  text("Eat me!", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE FIVE

void pageFive() {
  background(255);
  fill(0);
  Five = loadImage("5.gif");
  image(Five, 0, 0);
  text("Oh no! You shrunk!", 50, 100);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Proceed", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE SIX

void pageSix() {
  background(255);
  fill(0);
  Six = loadImage("6.gif");
  image(Six, 0, 0);
  text("You grew to an inordinately large height!", 50, 50);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Proceed", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE SEVEN

void pageSeven() {
  background(255);
  fill(0);
  Seven = loadImage("7.gif");
  image(Seven, 0, 0);
  text("You cry, and your tears form a pool. Swim to shore?", 50, 50);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Swim", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}

// PAGE EIGHT

void pageEight() {
  background(255);
  fill(0);
  Eight = loadImage("8.gif");
  image(Eight, 0, 0);
  text("You see the White Rabbit.", 50, 500);
  text("He sends you to his house to fetch his things.", 50, 75);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Go", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}

// PAGE NINE

void pageNine() {
  background(255);
  fill(0);
  Nine = loadImage("9.gif");
  image(Nine, 0, 0);
  text("In the house, you find a bottle of liquid.", 50, 100);
  text("Do you drink the liquid or leave the house?", 50, 125);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Drink it", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}

// PAGE TEN

void pageTen() {
  background(255);
  fill(0);
  Ten = loadImage("10.gif");
  image(Ten, 0, 0);
  text("Oops. You grow to the size of the room.", 50, 50);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Escape", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE ELEVEN

void pageEleven() {
  background(255);
  fill(0);
  
  // Button
  if (overButton(b11x, b11y, b11w, b11h) == true) {
     fill(255);
   }
  else {
    fill(0); 
  }
  rect(b11x, b11y, b11w, b11h);
  
  Eleven = loadImage("11.gif");
  image(Eleven, 0, 0);
  text("The White Rabbit returns.", 50, 50);
  text("He's mad, but you notice your now-giant hand can swat him.", 50, 75);
  
//  // Button
//  if (overButton(b2x, b2y, b2w, b2h) == true) {
//    fill(255); 
//  } 
//  else {
//    fill(153); 
//  }
//  rect(b2x, b2y, b2w, b2h);
//  fill(0);
//  textAlign(CENTER);
//  text("Swat him", b2x + b2w/2, b2y + 32);
//  textAlign(LEFT);
}


// PAGE TWELVE

void pageTwelve() {
  background(255);
  fill(0);
  
  // Button
  if (overButton(b12x, b12y, b12w, b12h) == true) {
     fill(255);
   }
  else {
    fill(0); 
  }
  rect(b12x, b12y, b12w, b12h);
  
  Twelve = loadImage("12.gif");
  image(Twelve, 0, 0);
  text("You wander into the forest and see a Caterpillar sitting on", 50, 50);
  text("a mushroom. He says that one part of the mushroom makes", 50, 75);
  text("you shrink.", 50, 100);
  
//  // Button
//  if (overButton(b2x, b2y, b2w, b2h) == true) {
//    fill(255); 
//  } 
//  else {
//    fill(153); 
//  }
//  rect(b2x, b2y, b2w, b2h);
//  fill(0);
//  textAlign(CENTER);
//  text("Eat some", b2x + b2w/2, b2y + 32);
//  textAlign(LEFT);
}


// PAGE THIRTEEN

void pageThirteen() {
  background(255);
  fill(0);
  Thirteen = loadImage("13.gif");
  image(Thirteen, 0, 0);
  text("Yikes! Your neck stretches above the trees, and a pigeon", 50, 50);
  text("sees you and attacks, thinking you're a serpent hungry", 50, 75);
  text("for pigeon eggs. Eat another part of the mushroom or", 50, 100);
  text("fight the pigeon?", 50, 125);
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  fill(0);
  text("Eat", b1x + b1w/2, b1y + 32);
  
  // Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  text("Fight", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE FOURTEEN

void pageFourteen() {
  background(255);
  fill(0);
  Fourteen = loadImage("14.gif");
  image(Fourteen, 0, 0);
  text("Hooray! You shrunk to normal height.", 50, 50);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Proceed", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE FIFTEEN

void pageFifteen() {
  background(255);
  fill(0);
  text("You underestimate your vulnerability despite your size,", 50, 100);
  text("and get killed by the pigeon. Play again?", 50, 125);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Play again", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE SIXTEEN

void pageSixteen() {
  background(255);
  fill(0);
  Sixteen = loadImage("16.gif");
  image(Sixteen, 0, 0);
  text("You wander until you come to the house of the Duchess,", 50, 50);
  text("where you find a grinning Cheshire Cat.", 50, 75);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Talk", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE SEVENTEEN

void pageSeventeen() {
  background(255);
  fill(0);
  Seventeen = loadImage("17.gif");
  image(Seventeen, 0, 0);
  text("The Cat says everyone in Wonderland is crazy, including you.", 50, 50);
  text("Are you skeptical, or do you believe him?", 50, 75);
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  fill(0);
  text("Skeptical", b1x + b1w/2, b1y + 32);
  
  // Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  text("Believe", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE EIGHTEEN

void pageEighteen() {
  background(255);
  fill(0);
  Eighteen = loadImage("18.gif");
  image(Eighteen, 0, 0);
  text("You taunt the Cat and it fades to nothing but", 50, 50);
  text("a floating grin.", 50, 75);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Leave", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE NINETEEN

void pageNineteen() {
  background(0);
  fill(255);
  text("You wake up. It was a dream.", 50, 100);
  
  // Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  textAlign(CENTER);
  text("Play again", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}




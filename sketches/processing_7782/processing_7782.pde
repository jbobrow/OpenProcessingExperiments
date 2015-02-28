

int page = 1;
PFont font;

PImage first;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;

int b1x = 0;
int b1y = 0;
int b1w = 640;
int b1h = 480;

int b2x = 213;
int b2y = 141;
int b2w = 110;
int b2h = 40;

int b3x = 213;
int b3y = 182;
int b3w = 100;
int b3h = 50;

int b4x = 300;
int b4y = 244;
int b4w = 107;
int b4h = 50;

int b5x = 306;
int b5y = 319;
int b5w = 120;
int b5h = 60;

int b6x = 237;
int b6y = 15;
int b6w = 150;
int b6h = 200;

int b7x = 275;
int b7y = 260;
int b7w = 250;
int b7h = 140;

int b8x = 108;
int b8y = 73;
int b8w = 110;
int b8h = 110;

int b9x = 80;
int b9y = 273;
int b9w = 154;
int b9h = 140;

int b10x = 450;
int b10y = 60;
int b10w = 90;
int b10h = 140;

int b11x = 410;
int b11y = 315;
int b11w = 200;
int b11h = 200;

int b12x = 361;
int b12y = 0;
int b12w = 640;
int b12h = 255;

int b13x = 0;
int b13y = 120;
int b13w = 272;
int b13h = 360;

int b14x = 307;
int b14y = 80;
int b14w = 140;
int b14h = 120;

int b15x = 25;
int b15y = 275;
int b15w = 125;
int b15h = 200;

int b16x = 539;
int b16y = 360;
int b16w = 140;
int b16h = 100;

void setup() {
  size (640, 480);
  smooth ();
  font = loadFont("AmericanTypewriter-48.vlw");
  textFont(font);
  first = loadImage ("first.jpg");
  one = loadImage ("1a.jpg");  
  two = loadImage ("2a.jpg");
  three = loadImage ("3.jpg");
  four = loadImage ("4a.jpg");
  five = loadImage ("5a.jpg");
  six = loadImage ("6a.jpg");
  seven = loadImage ("7.jpg");
  eight = loadImage ("88.jpg");  
}

void draw() {
  if (page == 1) {
    pageOne();
  } 
  else if (page == 2) {
    pageTwo(); 
  } 
  else if (page == 3) {
    pageThree(); 
  } 
  else if (page == 4) {
    pageFour();
  }
  else if (page == 5) {
    pageFive();
  }
  else if (page == 6) {
    pageSix();
  }
  else if (page == 7) {
    pageSeven();
  }
  else if (page == 8) {
    pageEight();
  }
  else if (page == 9) {
    pageNine();
  }
}

void mousePressed() {

  if (page == 1) {
    if (overButton (b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    }
  }


  else if (page == 2) {
    if (overButton (b2x, b2y, b2w, b2h) == true) {
      page = 3; 
    } 
    else if (overButton (b3x, b3y, b3w, b3h) == true) {
      page = 4;
    }
  } 

  else if (page == 3) {
    if (overButton (b4x, b4y, b4w, b4h) == true) {
      page = 4;
    } 
    if (overButton (b5x, b5y, b5w, b5h) == true) {
      page = 5;
    }
  }

  else if (page == 4) {
    if (overButton (b6x, b6y, b6w, b6h) == true) {
      page = 6;
    }
    if (overButton (b7x, b7y, b7w, b7h) == true) {
      page = 7;
    }
  }

  else if (page == 5) {
    if (overButton (b8x, b8y, b8w, b8h) == true) {
      page = 8;
    }
    if (overButton (b9x, b9y, b9w, b9h) == true) {
      page = 2;
    }
  }

  else if (page == 6) {
    if (overButton (b10x, b10y, b10w, b10h) == true) {
      page = 5;
    }
    if (overButton (b11x, b11y, b11w, b11h) == true) {
      page = 9;
    }
  }

  else if (page == 7) {
    if (overButton (b12x, b12y, b12w, b12h) == true) {
      page = 3;
    }
    if (overButton (b13x, b13y, b13w, b13h) == true) {
      page = 9;
    }
  }

  else if (page == 8) {
    if (overButton (b14x, b14y, b14w, b14h) == true) {
      page = 3;
    }
    if (overButton (b15x, b15y, b15w, b15h) == true) {
      page = 9;
    }
  }
  
  else if (page == 9) {
    if (overButton (b16x, b16y, b16w, b16h) == true) {
      page = 1;
    }
  }

}
// Check to see if the click happends over the button
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

  image (first, 0, 0);

}


// PAGE TWO

void pageTwo() {
  image (one, 0, 0);

}


// PAGE THREE

void pageThree() {
  image (two, 0, 0);
}


//PAGE FOUR

void pageFour() {
  image (three, 0, 0);
}



//PAGE FIVE

void pageFive() {

  image (four, 0, 0);
}

//PAGE SIX

void pageSix() {
  image (five, 0, 0);
}

//PAGE SEVEN

void pageSeven() {
  image (six, 0, 0);
}

//PAGE EIGHT

void pageEight() {

  image (seven, 0, 0);
}


//PAGE NINE
void pageNine() {

  image (eight, 0, 0);
}










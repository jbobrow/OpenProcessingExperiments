
int card = 0;
PFont font;
PImage BB5;
PImage BB;
PImage BB0;
PImage BB1;
PImage BB2A;
PImage BB2A2;
PImage BB2B;
PImage BB3B;
PImage BB4;
PImage BB6;
PImage BB6A;
PImage BB6A2;
PImage BB6A33;
PImage BB6A4;
PImage BB77;
PImage BB8;
PImage BB9;
PImage BB10;

boolean move = true;

void setup() {
  size(640, 480);
  smooth();
  font = loadFont("Hel.vlw");
  textFont(font);
  BB5= loadImage("BB5.jpg"); 
  BB= loadImage("BB.jpg");
  BB0= loadImage("BB0.jpg");
  BB1= loadImage("BB1.jpg");
  BB2A= loadImage("BB2A.jpg");
  BB2A2= loadImage("BB2A2.jpg");
  BB2B= loadImage("BB2B.jpg");
  BB3B= loadImage("BB3B.jpg");
  BB4= loadImage("BB4.jpg");
  BB5= loadImage("BB5.jpg");
  BB6= loadImage("BB6.jpg");
  BB6A= loadImage("BB6A.jpg");
  BB6A2= loadImage("BB6A2.jpg");
  BB6A33= loadImage("BB6A33.jpg");
  BB6A4= loadImage("BB6A4.jpg");
  BB77= loadImage("BB77.jpg");
  BB8= loadImage("BB8.jpg");
  BB9= loadImage("BB9.jpg");
  BB10= loadImage("BB10.jpg");
}


void draw() {
  background(255);

  if (card == 0) {
    background(0);

    image (BB,0,0);

    if (mousePressed && move) {
      card = 1;
      move = false;

    }  



  } 
  else if (card == 1) {
    background(50);

    image (BB0,0,0);
    if (mousePressed && move) {
      card = 2;
      move = false;

    } 



  } 
  else if (card == 2) {
    background(100);


    image (BB1,0,0);

    int left = 50;
    int right = 220;
    int top = 376;
    int bottom = 407;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 3;
        move = false;   

      }
    }
    left = 297;
    right = 600;
    top = 376;
    bottom = 407;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 4;
        move = false;
      }  
    }

  } 
  else if (card == 3) {
    background(150);

    image (BB2A,0,0);
    if (mousePressed && move) {
      card = 31;
      move = false;

    } 
  } 
  else if (card == 31) {
    background(200);

    image (BB2A2,0,0);
    if (mousePressed && move) {
      card = 0;
      move = false;

    } 

  } 
  else if (card == 4) {
    background(250);

    image (BB2B,0,0);
    if (mousePressed && move) {
      card = 5;
      move = false;

    } 

  } 
  else if (card == 5) {
    background(250);

    image (BB3B,0,0);
    if (mousePressed && move) {
      card = 6;
      move = false;

    } 
  }
  else if (card == 6) {
    background(250);

    image (BB4,0,0);
    if (mousePressed && move) {
      card = 7;
      move = false;

    } 


  } // end cards
  else if (card == 7) {
    background(250);

    image (BB5,0,0);

    int left = 13;
    int right = 347;
    int top = 69;
    int bottom = 396;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 71;
        move = false;   

      }
    }
    left = 387;
    right = 628;
    top = 372;
    bottom = 396;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 8;
        move = false;
      }  
    }



  } // end cards

  else if (card == 71) {
    background(250);

    image (BB6,0,0);
    if (mousePressed && move) {
      card = 72;
      move = false;
    }
  } //end cards
  
  else if (card == 72) {
    background(250);

    image (BB6A,0,0);
    if (mousePressed && move) {
      card = 73;
      move = false;
    }
  } //end cards
  else if (card == 73) {
    background(250);

    image (BB6A2,0,0);
    if (mousePressed && move) {
      card = 74;
      move = false;
    }
  } //end cards
  else if (card == 74) {
    background(250);

    image (BB6A33,0,0);
    if (mousePressed && move) {
      card = 75;
      move = false;
    }
  } //end cards
  else if (card == 75) {
    background(250);

    image (BB6A4,0,0);
    if (mousePressed && move) {
      card = 10;
      move = false;
    }
  } //end cards
  else if (card == 8) {
    background(250);

    image (BB77,0,0);
    if (mousePressed && move) {
      card = 9;
      move = false;
    }
  } //end cards
  else if (card == 9) {
    background(250);

    image (BB8,0,0);
    if (mousePressed && move) {
      card = 10;
      move = false;
    }
  } //end cards
   else if (card == 10) {
    background(250);

    image (BB9,0,0);
    if (mousePressed && move) {
      card = 11;
      move = false;
    }
  } //end cards
  else if (card == 11) {
    background(250);

    image (BB10,0,0);
    if (mousePressed && move) {
      card = 0;
      move = false;
    }
  } //end cards
}  // end of draw function dont add code after this



void mouseReleased() {
  move = true;
}

void mousePressed() {
  println(mouseX + ", "+ mouseY);
}











// text names
PFont titlefont;
PFont navfont;
PFont font;

int currentTime = 0;
int colour = 0;
int diameter = 100;
float fill1 = random(0, 255);
color c1 = color(fill1);
float circlepx = random(100, 300);

/////
int start;
/////

int colour2 = 0;
int diameter2 = 100;
float fill2 = random(0, 255);
color c2 = color(fill2);
float circlepx2 = random(100, 300);

int colour3 = 0;
int diameter3 = 100;
float fill3 = random(0, 255);
color c3 = color(fill2);
float circlepx3 = random(100, 300);


boolean left;
boolean right;
boolean up;
boolean down;

boolean win = false;
boolean lose = false;

int page = 1; //sets the initial page to titlePage

///////////////////////////////VOID SETUP/////
void setup () {
  size (640, 480);
  background(255);
  noStroke();
  currentTime = 0;
}


void resetGame()
{background(255);

}


///////////////////////////////VOID DRAW/////
void draw() {
  if (page == 1) {
    titlePage();
  }
  else if (page == 2) {
    howPage();
  }
  // lev1 = 5 secs, 13 secs
  else if (page == 3) {
    levelOne();
  }
  // lev2 = 5 secs, 10 secs
  else if (page == 4) {
    levelTwo();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == DOWN) {
      down = true;
    }
  }
  
  //////gets back to first page
//    if (key == ' '){
//    resetGame();
//    }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == DOWN) {
      down = false;
    }
  }
}


///////////////////////////////titlePage/////page=1
void titlePage() {
  background(255);
  titlefont = loadFont ("emu64.vlw");
  textFont(titlefont);
  fill(0);
  text("SIMPLE\nSHAPES", 135, 140);
  navfont = loadFont ("emu24.vlw");
  textFont(navfont);
  text("CLICK HERE!", 250, 340);

  ///////////////////page change/////
  if(mousePressed) {
    page = 2;
  }
}




/////////////////////////////////OLDhowPage/////badinstructions
//
//
//void howPage() {
//  background (255);
//  font = loadFont ("emu16.vlw");
//  textFont(font);
//  text ("SIMPLE SHAPES IS A MEMORY GAME!\n\nUSE THE SLIDERS:\n - SHAPE SLIDER \n - LINE DENSITY SLIDER \n - LINE ANGLE SLIDER \nTO REPRODUCE THE ORIGINAL SHAPES.\n\nYOU HAVE 15 SECONDS!\n", 30, 50, 585, 400);
//  text ("ARE YOU READY?", 260, 280);
//  text ("CLICK TO PLAY!", 340, 340);
//
//  ///////////////////page change/////
//  if(mousePressed) {
//    page = 3;
//  }
// 
//}


///////////////////////////////howPage/////


void howPage() {
  background (255);
  font = loadFont ("emu16.vlw");
  textFont(font);
  text ("SIMPLE SHAPES IS A MEMORY GAME!\n\nUSE YOUR KEYBOARD:\n - SIZE: D=SMALLER & U=BIGGER \n - COLOR: L=DARKER & R=LIGHTER \nTO REPRODUCE THE ORIGINAL SHAPES.\n\nYOU HAVE 15 SECONDS!\n", 30, 50, 585, 400);
  text ("ARE YOU READY?", 260, 280);
  text ("CLICK TO PLAY!", 340, 340);

  ///////////////////page change/////
  if(mousePressed) {
    page = 3;
  }
 
}




///////////////////////////////gameOne/////
void levelOne() {
  background (255);
  //  font = loadFont ("emu16.vlw");
  //  textFont(font);
  //  text ("ARE YOU READY?", 260, 280);
  //  text ("CLICK TO PLAY!", 340, 340);

  ///////////////////load random shape (ONE)/////
  fill(c1);
  rectMode(CENTER);
  ellipse(160, 240, circlepx, circlepx);


  if (millis()>currentTime+10000) {

    currentTime=0;
    background(255);
    if (left) {
      colour -= 1;
    } 

    if (left) {
      if (colour <= 0) {
        colour = 0;
      }
    }


    if (right) {
      colour += 1;
    }

    if (right) {
      if (colour >= 255) {
        colour = 255;
      }
    }

    if (up) {
      diameter += 1;
    }

    if (up) {
      if (diameter >= 300) {
        diameter = 300;
      }
    }

    if (down) {
      diameter -= 1;
    }

    if (down) {
      if (diameter <= 10) {
        diameter = 10;
      }
    }
///////
    background(255); //don't think this is needed ??
    fill(colour);
    rectMode(CENTER);
    ellipse(160+320, 240, diameter, diameter);
  }

  //TIME'S UP
  if (millis()>currentTime+23000) {

    //DRAWS ORIGINAL CIRCLE
    fill(c1);
    rectMode(CENTER);
    ellipse(160, 240, circlepx, circlepx);

    //DRAWS 'AWESOME!' TEXT
    if ((colour >= (fill1 - 20) && colour <= (fill1 - 10)) || (colour >= (fill1 + 10) && colour <= (fill1 + 20))) {
      if ((diameter >= (circlepx - 20) && diameter <= (circlepx - 10)) || (diameter >= (circlepx + 10) && diameter <= (circlepx + 20))) {

        fill(0);
        textMode(CENTER);
        text ("CLOSE ENOUGH", 640/2, 480/2, 150, 20);
        
                    if (mousePressed == true) {
        win = true;
        page = 4;
        currentTime = millis();
      }
      }
    }

    if (colour >= (fill1 - 10) && colour <= (fill1 + 10) && diameter >= (circlepx - 10) && diameter <= (circlepx + 10)) {

      fill(0);
      textMode(CENTER);
      text ("NICE JOB", 640/2, 480/2, 150, 20);
      
        if (mousePressed == true) {
        win = true;
        page = 4;
        currentTime = millis();
      }
    }
  

    if ((colour == fill1) && (diameter == circlepx)) {
      fill(0);
      textMode(CENTER);
      text ("PERFECT", 640/2, 480/2, 150, 20);
      
                  if (mousePressed == true) {
        win = true;
        page = 4;
        currentTime = millis();
      }
    }


    else if ((colour < (fill1 - 20)) || (colour > (fill1 + 20)) || (diameter < (circlepx - 20)) || (diameter > (circlepx + 20))) {
      fill(0);
      text ("TRY AGAIN.. \n CLOSE TO RESTART", 640/2, 480/2, 400, 50);
      
//          if (key == ' '){
//            win=false;
//            resetGame();
//          }
      
      
/////////////


//      if (mousePressed == true) {
//     //    win = true;
//         page = 3;
//      }
    }
    }
  }


  ///////////////////////////////gameTwo/////
  void levelTwo() {
    background (255);

    ///////////////////load random shape (TWO)/////
    fill(c2);
    rectMode(CENTER);
    ellipse(160, 240, circlepx2, circlepx2);

    if (millis()>currentTime+10000) {
      background(255);
      if (left) {
        colour2 -= 1;
      } 

      if (left) {
        if (colour2 <= 0) {
          colour2 = 0;
        }
      }


      if (right) {
        colour2 += 1;
      }

      if (right) {
        if (colour2 >= 255) {
          colour2 = 255;
        }
      }

      if (up) {
        diameter2 += 1;
      }

      if (up) {
        if (diameter2 >= 300) {
          diameter2 = 300;
        }
      }

      if (down) {
        diameter2 -= 1;
      }

      if (down) {
        if (diameter2 <= 10) {
          diameter2 = 10;
        }
      }

      fill(colour2);
      rectMode(CENTER);
      ellipse(160+320, 240, diameter2, diameter2);
    }

    //TIME'S UP
    if (millis()>currentTime+20000) {

      //DRAWS ORIGINAL CIRCLE
      fill(c2);
      rectMode(CENTER);
      ellipse(160, 240, circlepx2, circlepx2);

      //DRAWS 'AWESOME!' TEXT
      if ((colour2 >= (fill2 - 20) && colour2 <= (fill2 - 10)) || (colour2 >= (fill2 + 10) && colour2 <= (fill2 + 20))) {
        if ((diameter2 >= (circlepx2 - 20) && diameter2 <= (circlepx2 - 10)) || (diameter2 >= (circlepx2 + 10) && diameter2 <= (circlepx2 + 20))) {

          fill(0);
          textMode(CENTER);
          text ("CLOSE ENOUGH", 640/2, 480/2, 250, 20);
        }
      }

      if (colour2 >= (fill2 - 10) && colour2 <= (fill2 + 10) && diameter2 >= (circlepx2 - 10) && diameter2 <= (circlepx2 + 10)) {

        fill(0);
        textMode(CENTER);
        text ("NICE JOB", 640/2, 480/2, 150, 20);
        
        //////
        if (mousePressed == true) {
          page = 1;
        }
      }

    if ((colour2 == fill2) && (diameter2 == circlepx2)) {
      fill(0);
      textMode(CENTER);
      text ("PERFECT", 640/2, 480/2, 150, 20);
      
             /////////
             if (mousePressed == true) {
          page = 1;
        }
    }


    else if ((colour2 < (fill2 - 20)) || (colour2 > (fill2 + 20)) || (diameter2 < (circlepx2 - 20)) || (diameter2 > (circlepx2 + 20))) {
        fill(0);
        text ("TRY AGAIN.. \n CLOSE TO RESTART", 640/2, 480/2, 400, 50);
        
                

//        if (mousePressed == true) {
//          lose = true;
//          page = 2;
//        }
      }
    }
  }











  ///////////////////////////////gameTwo/////
  void levelThree() {
    background (255);

    ///////////////////load random shape (TWO)/////
    fill(c3);
    rectMode(CENTER);
    ellipse(160, 240, circlepx3, circlepx3);

    if (millis()>currentTime+10000) {
      background(255);
      if (left) {
        colour3 -= 1;
      } 

      if (left) {
        if (colour3 <= 0) {
          colour3 = 0;
        }
      }


      if (right) {
        colour3 += 1;
      }

      if (right) {
        if (colour3 >= 255) {
          colour3 = 255;
        }
      }

      if (up) {
        diameter3 += 1;
      }

      if (up) {
        if (diameter3 >= 300) {
          diameter3 = 300;
        }
      }

      if (down) {
        diameter3 -= 1;
      }

      if (down) {
        if (diameter3 <= 10) {
          diameter3 = 10;
        }
      }

      fill(colour3);
      rectMode(CENTER);
      ellipse(160+320, 240, diameter3, diameter3);
    }

    //TIME'S UP
    if (millis()>currentTime+15000) {

      //DRAWS ORIGINAL CIRCLE
      fill(c3);
      rectMode(CENTER);
      ellipse(160, 240, circlepx3, circlepx3);

      //DRAWS 'AWESOME!' TEXT
      if ((colour3 >= (fill3 - 20) && colour3 <= (fill3 - 10)) || (colour3 >= (fill3 + 10) && colour3 <= (fill3 + 20))) {
        if ((diameter3 >= (circlepx3 - 20) && diameter3 <= (circlepx3 - 10)) || (diameter3 >= (circlepx3 + 10) && diameter3 <= (circlepx3 + 20))) {

          fill(0);
          textMode(CENTER);
          text ("CLOSE ENOUGH", 640/2, 480/2, 250, 20);
        }
      }

      if (colour3 >= (fill3 - 10) && colour3 <= (fill3 + 10) && diameter3 >= (circlepx3 - 10) && diameter3 <= (circlepx3 + 10)) {

        fill(0);
        textMode(CENTER);
        text ("NICE JOB", 640/2, 480/2, 150, 20);
        
        //////
        if (mousePressed == true) {
          page = 1;
        }
      }

    if ((colour3 == fill3) && (diameter3 == circlepx3)) {
      fill(0);
      textMode(CENTER);
      text ("PERFECT", 640/2, 480/2, 150, 20);
      
             /////////
             if (mousePressed == true) {
          page = 1;
        }
    }


    else if ((colour3 < (fill3 - 20)) || (colour3 > (fill3 + 20)) || (diameter3 < (circlepx3 - 20)) || (diameter3 > (circlepx3 + 20))) {
        fill(0);
        text ("TRY AGAIN.. \n CLOSE TO RESTART", 640/2, 480/2, 400, 50);
        
                

//        if (mousePressed == true) {
//          lose = true;
//          page = 2;
//        }
      }
    }
  }














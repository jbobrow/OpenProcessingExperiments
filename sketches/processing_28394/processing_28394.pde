
/////////  FERTIG ////////

float Paintbrush= 2;

//////////// clear Button ///////////////
boolean hit = false;
boolean hit2 = false;

//////////// buttons (Farbe)/////////////

int B1 = color (255, 243, 0); //Gelb
int B2 = color (255, 154, 3); //Orange
int B3 = color (245, 0, 0); //Rot
int B4 = color (206, 37, 245); //Lila/Pink
int B5 = color (8, 216, 255); //Türkis
int B6 = color (10, 89, 242); //Dunkelblau
int B7 = color (154, 227, 0); //Grün
int B8 = color (131, 131, 131); //Grau
int B9 = color (0, 0, 0); //Schwarz
int R = color (255); //Radiergummi
int Bunt = color(170, 0, 26);
int Stempelfarbe = color(255, 255, 255, 0);
color penColor = color(0, 0, 0);
int thick = 1;
PFont f;
int strokeColor = 255;

int rollover=0;

//////////// Stempel //////////////////

PImage a;
PImage icon1;
PImage icon2;
PImage icon3;
PImage icon4;
PImage icon5;
PImage icon6;
PImage icon7;
PImage icon8;
PImage icon9;
PImage icon10;
PImage icon11;
PImage icon12;
PImage icon13;
PImage icon14;
PImage icon15;
PImage copyright;

//////////////////////////////

void setup() {
  size(1000, 800);
  smooth();
  background(255);
  f = loadFont ("HelveticaNeue-UltraLight-48.vlw");

  //////////// Stempel Images ////////

  size(1000, 800);
  icon1 = loadImage("Ameise.png");
  icon2 = loadImage("Bäume.png");
  icon3 = loadImage("Blume_1.png");
  icon4 = loadImage("Essen.png");
  icon5 = loadImage("fisch.png");
  icon6 = loadImage("Gedöns.png");
  icon7 = loadImage("Gras.png");
  icon8 = loadImage("hut_klein.png");
  icon9 = loadImage("Kleks.png");
  icon10 = loadImage("Krone.png");
  icon11 = loadImage("Luftballon.png");
  icon12 = loadImage("Schleife.png");
  icon13 = loadImage("Spinne.png");
  icon14 = loadImage("Sprechblase.png");
  icon15 = loadImage("Wolken.png");
  a = loadImage("leer.png");
  copyright = loadImage("copy.png");
}

///////////////  Kästen  /////////////

void draw() {



  //////////////// Rollover ////////

  rollover=0;

  ///////// Farben + Buttons ///////////////



  if (mouseX > 25 && mouseX < 60) {
    if (mouseY > 288.5 && mouseY < 323.5) {
      rollover=1;
    }
  }

  if (mouseX > 25 && mouseX < 60) {
    if (mouseY > 328.5 && mouseY < 363.5) {
      rollover=1;
    }
  }

  if (mouseX > 25 && mouseX < 60) {
    if (mouseY > 368.5 && mouseY < 403.5) {
      rollover=1;
    }
  }

  if (mouseX > 25 && mouseX < 60) {
    if (mouseY > 408.5 && mouseY < 443.5) {
      rollover=1;
    }
  }

  if (mouseX > 25 && mouseX < 140) {
    if (mouseY > 248.5 && mouseY < 283.5) {
      rollover=1;
    }
  }

  if (mouseX > 65 && mouseX < 100) {
    if (mouseY > 288.5 && mouseY < 323.5) {
      rollover=1;
    }
  }

  if (mouseX > 65 && mouseX < 100) {
    if (mouseY > 328.5 && mouseY < 363.5) {
      rollover=1;
    }
  }

  if (mouseX > 65 && mouseX < 100) {
    if (mouseY > 368.5 && mouseY < 403.5) {
      rollover=1;
    }
  }

  if (mouseX > 105 && mouseX < 140) {
    if (mouseY > 288.5 && mouseY < 323.5) {
      rollover=1;
    }
  }

  if (mouseX > 105 && mouseX < 140) { 
    if (mouseY > 328.5 && mouseY < 363.5) {
      rollover=1;
    }
  }

  if (mouseX > 105 && mouseX < 140) {  
    if (mouseY > 368.5 && mouseY < 403.5) {
      rollover=1;
    }
  }

  if (mouseX> 18 && mouseX< 32 ) {
    if (mouseY> 480 && mouseY< 580) {  
      rollover=1;
    }
  }

  if (mouseX > 43 && mouseX< 57) {
    if (mouseY> 480 && mouseY< 580) {
      rollover=1;
    }
  }

  if (mouseX> 69 && mouseX< 77) {
    if (mouseY> 480 && mouseY< 580) {
      rollover=1;
    }
  }

  if (mouseX> 93 && mouseX< 105) {
    if (mouseY> 480 && mouseY< 580) {
      rollover=1;
    }
  }

  if (mouseX> 118 && mouseX < 134) {
    if (mouseY> 480 && mouseY< 580) {
      rollover=1;
    }
  }

  if (mouseX > 60 && mouseX < 145 && mouseY > 405.5 && mouseY < 444) {
    rollover=1;
  }

  if (mouseX > 27 && mouseX < 90) {
    if (mouseY > 720 && mouseY < 755) {
      rollover=1;
    }
  }



  ///////////// ROLLOVER STEMPEL ////////////////

  if (mouseX>29 && mouseX<59 && mouseY>50 && mouseY<80) {
    rollover=1;
  }

  if (mouseX>29 && mouseX<59 && mouseY>95 && mouseY<125) {
    rollover=1;
  }

  if (mouseX>29 && mouseX<59 && mouseY>130 && mouseY<160) {
    rollover=1;
  }

  if (mouseX>29 && mouseX<59 && mouseY>165 && mouseY<195) {
    rollover=1;
  }

  if (mouseX>29 && mouseX<59 && mouseY>200 && mouseY<230) {
    rollover=1;
  }

  if (mouseX>64 && mouseX<94 && mouseY>60 && mouseY<90) {
    rollover=1;
  }

  if (mouseX>64 && mouseX<94 && mouseY>95 && mouseY<125) {
    rollover=1;
  }
  if (mouseX>64 && mouseX<94 && mouseY>130 && mouseY<160) {
    rollover=1;
  }
  if (mouseX>64 && mouseX<94 && mouseY>165 && mouseY<195) {
    rollover=1;
  }

  if (mouseX>64 && mouseX<94 && mouseY>200 && mouseY<230) {
    rollover=1;
  }

  if (mouseX>99 && mouseX<129 && mouseY>60 && mouseY<90) {
    rollover=1;
  }

  if (mouseX>99 && mouseX<129 && mouseY>95 && mouseY<125) {
    rollover=1;
  }
  if (mouseX>99 && mouseX<129 && mouseY>130 && mouseY<160) {
    rollover=1;
  }
  if (mouseX>99 && mouseX<129 && mouseY>165 && mouseY<195) {
    rollover=1;
  }
  if (mouseX>99 && mouseX<129 && mouseY>200 && mouseY<230) {
    rollover=1;
  }

  ////////////////  ROLLOVER ENDE ///////////////

  if (rollover==1) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }

  /////////////// Stempel Daten /////////////

  noStroke();
  fill(255);
  rect(0, 0, 165, 800);


  image(icon1, 29, 60, 30, 20);
  image(icon2, 29, 95, 30, 30);
  image(icon3, 29, 130, 30, 30);
  image(icon4, 29, 165, 30, 30);
  image(icon5, 29, 205, 30, 20);
  image(icon6, 64, 60, 30, 30);
  image(icon7, 64, 95, 30, 30);
  image(icon8, 64, 135, 30, 20);
  image(icon9, 68, 165, 25, 30);
  image(icon10, 64, 200, 30, 30);
  image(icon11, 104, 60, 20, 30);
  image(icon12, 104, 95, 20, 30);
  image(icon13, 99, 130, 30, 30);
  image(icon14, 99, 165, 30, 30);
  image(icon15, 99, 210, 30, 15);

  image(copyright, 815, 750, 154, 27);


  ////////////// BUTTON ///////////////

  strokeWeight(5);
  stroke(255);
  fill(B1); //gelber Button
  rect(25, 288.5, 35, 35);
  fill(B2); //orangener Button
  rect(25, 328.5, 35, 35);
  fill(B3); //roter Button
  rect(25, 368.5, 35, 35);
  fill(B4); //lila/pinker Button
  rect(65, 288.5, 35, 35);
  fill(B5); //türkisener Button
  rect(65, 328.5, 35, 35);
  fill(B6); //dunkelblauer Button
  rect(65, 368.5, 35, 35);
  fill(B7); //grüner Button
  rect(105, 288.5, 35, 35);
  fill(B8); //grauer Button
  rect(105, 328.5, 35, 35);
  fill(B9); //schwarzer Button
  rect(105, 368.5, 35, 35);
  fill(170, 0, 26);
  rect(25, 248.5, 115, 35);

  ///////////// clear Button  ///////

  fill(0);
  rect(66.5, 413.5, 70, 26);
  textFont(f, 19);
  fill(255);
  text("CLEAR", 71, 433.5);
  if (mouseX > 60 && mouseX < 145 && mouseY > 405.5 && mouseY < 444) {
    if (!hit) {
      fill(100);
    }
    if (mousePressed) {
      fill(255);
      rect(180,0,800,1000);
      image(copyright, 815, 750, 154, 27);
    }
    else {
      fill(200);
    }
    hit = true;
  }
  else {
    hit = false;
    fill(100);
  }

  //////////////// RANDOM BUTTON //////////

  textFont(f, 23);
  fill(255);
  smooth();
  text("RANDOM", 33, 275);

  ///////////// SAVE Button  ////////////

  fill(196, 196, 196);
  rect(27, 720, 60, 35);

  textFont(f, 20);
  fill(255);
  smooth();
  text("SAVE", 33, 745);

  if (mousePressed) {
    if (mouseX > 27 && mouseX < 90) {
      if (mouseY > 720 && mouseY < 755) {
        noStroke();
        fill(255);
        rect(0, 0, 165, 800);
        saveFrame(saveFile(new Frame(), "save your great work", "", "kunstwerk"));
      }
    }
  }


  ////////////// liniendicke ////////////

  fill(penColor);
  stroke(strokeColor);
  strokeWeight(1);
  rect(47, 480, 5, 100);

  strokeWeight(1);
  rect(69, 480, 8, 100);

  strokeWeight(1);
  rect(93, 480, 12, 100);

  strokeWeight(1);
  rect(118, 480, 16, 100);

  strokeWeight(1);
  rect(25, 480, 3, 100);



  if (mousePressed) {

    if (mouseX > 25 && mouseX < 60 && mouseY > 408.5 && mouseY < 443.5) {
      penColor = R;
      thick = 2;
      strokeColor = 0;
      a = loadImage("leer.png");
    }
    if (mouseX > 25 && mouseX < 60) {
      if (mouseY > 288.5 && mouseY < 323.5) {
        penColor = B1;
        thick = 2;
        strokeColor = 255;
        a = loadImage("leer.png");
      }
      else if (mouseY > 328.5 && mouseY < 363.5) {
        penColor = B2;
        thick = 2;
        strokeColor = 255;
        a = loadImage("leer.png");
      }
      else if (mouseY > 368.5 && mouseY < 403.5) {
        penColor = B3;
        thick = 2;
        strokeColor = 255;
        a = loadImage("leer.png");
      }
    }
    if (mousePressed) {
      if (mouseX > 25 && mouseX < 140) {
        if (mouseY > 248.5 && mouseY < 283.5) {
          penColor = Bunt;
          thick = 2;
          strokeColor = 255;
          a = loadImage("leer.png");
        }
      }
      if (mousePressed) {
        if (mouseX > 65 && mouseX < 100) {
          if (mouseY > 288.5 && mouseY < 323.5) {
            penColor = B4;
            thick = 2;
            strokeColor = 255;
            a = loadImage("leer.png");
          }
          else if (mouseY > 328.5 && mouseY < 363.5) {
            penColor = B5;
            thick = 2;
            strokeColor = 255;
            a = loadImage("leer.png");
          }
          else if (mouseY > 368.5 && mouseY < 403.5) {
            penColor = B6;
            thick = 2;
            strokeColor = 255;
            a = loadImage("leer.png");
          }
        }


        if (mousePressed) {
          if (mouseX > 105 && mouseX < 140) {
            if (mouseY > 288.5 && mouseY < 323.5) {
              penColor = B7;
              thick = 2;
              strokeColor = 255;
              a = loadImage("leer.png");
            }
            else if (mouseY > 328.5 && mouseY < 363.5) {
              penColor = B8;
              thick = 2;
              strokeColor = 255;
              a = loadImage("leer.png");
            }
            else if (mouseY > 368.5 && mouseY < 403.5) {
              penColor = B9;
              thick = 2;
              strokeColor = 255;
              a = loadImage("leer.png");
            }
          }

          ////////// RANDOM PenColor ////////////////

          stroke(penColor);

          if (penColor == Bunt) {
            stroke(random(255), random(255), random(255));
          }

          strokeWeight(thick);
          if (mouseX > 180) {
            line(pmouseX, pmouseY, mouseX, mouseY);
          }


          ///////////////////////////////////

          if (mousePressed)
          {
            if (mouseX> 18 && mouseX< 32 )
            {
              if (mouseY> 480 && mouseY< 580)
              {
                thick = 1;
              }
            }
          }
          if (mouseX > 43 && mouseX< 57)
          {
            if (mouseY> 480 && mouseY< 580)
            {
              thick = 3;
            }
          }
          if (mouseX> 69 && mouseX< 77)
          {
            if (mouseY> 480 && mouseY< 580)
            {
              thick = 6;
            }
          }

          if (mouseX> 93 && mouseX< 105)
          {
            if (mouseY> 480 && mouseY< 580)
            {
              thick = 10;
            }
          }
          if (mouseX> 118 && mouseX < 134)
          {
            if (mouseY> 480 && mouseY< 580)
            {
              thick = 15;
            }
          }
        }
      }
    }
  }

  fill(R); //Radiergummi
  stroke(0);
  strokeWeight(2);
  rect(29, 413.5, 26, 26);
}

///////////////// Stempel Funktion /////////////

void mousePressed() {
  if (mouseX > 200) {
    image(a, mouseX-a.width/2, mouseY-a.height/2);
  }

  if (mouseX>29 && mouseX<49 && mouseY>60 && mouseY<90) {
    a = loadImage("Ameise.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>29 && mouseX<59 && mouseY>95 && mouseY<125) {
    a = loadImage("Bäume.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>29 && mouseX<59 && mouseY>130 && mouseY<160) {
    a = loadImage("Blume_1.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>29 && mouseX<59 && mouseY>165 && mouseY<195) {
    a = loadImage("Essen.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>29 && mouseX<59 && mouseY>200 && mouseY<230) {
    a = loadImage("fisch.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>64 && mouseX<94 && mouseY>60 && mouseY<90) {
    a = loadImage("Gedöns.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>64 && mouseX<94 && mouseY>95 && mouseY<125) {
    a = loadImage("Gras.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>64 && mouseX<94 && mouseY>130 && mouseY<160) {
    a = loadImage("hut_klein.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>64 && mouseX<94 && mouseY>165 && mouseY<195) {
    a = loadImage("Kleks.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>64 && mouseX<94 && mouseY>200 && mouseY<230) {
    a = loadImage("Krone.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>99 && mouseX<129 && mouseY>60 && mouseY<90) {
    a = loadImage("Luftballon.png");
    penColor = Stempelfarbe;
  }

  if (mouseX>99 && mouseX<129 && mouseY>95 && mouseY<125) {
    a = loadImage("Schleife.png");
    penColor = Stempelfarbe;
  }   

  if (mouseX>99 && mouseX<129 && mouseY>130 && mouseY<160) {
    a = loadImage("Spinne.png");
    penColor = Stempelfarbe;
  }    

  if (mouseX>99 && mouseX<129 && mouseY>165 && mouseY<195) {
    a = loadImage("Sprechblase.png");
    penColor = Stempelfarbe;
  }   

  if (mouseX>99 && mouseX<129 && mouseY>200 && mouseY<230) {
    a = loadImage("Wolken.png");
    penColor = Stempelfarbe;
  }
}   

////////////////// KEY ////////////////

void keyPressed() {
  if (key=='c') {
    background(255);
  }
  // if (key =='s') {
  // saveFrame("kunstwerk_###.jpg");
  // }
}

/////////////////////////////////




/*

 Project_title: THE CURIOUS DIET
 
 Project_descripion:  “The curious diet” is project that show a diet composed of a number of foods related 
 to their calories brought in human body. A series of foods is presented to the user: he will have to choose 
 a minimum number of foods and finally it is be possible to present the value of reached calories. 
 The game evolves into a funny story, with two games connected to the states of body.
 
 Authors: LUIGI FRETTOLOSO, ANDREA MICCO, VALERIA SANGUIN
 
 19 October 2012
 
 versian 2.0b3
 Copyright_information
 
 libraries used
 _ Soundlib minim (http://code.compartmental.net/tools/minim/)
 
 */
 
 
// Value
int state = 0;
int col;
int x = 80;
int y = 55;
int x1 = 620;

int countFood = 0;
int kal = 0;
/*
int trasp = 255;
int val= 5;*/

// Immagini
PImage BackgroundT;

PImage inizio;

PImage intro;

PImage tavola;
PImage tavolaOk;
PImage tavolaUI;
PImage clear;

PImage eating;

PImage minore;
PImage minoreUI;
PImage maggiore;
PImage maggioreUI;

PImage win;
PImage win2;
PImage winUI;

PImage lose1; //Rosso
PImage lose2; //Verde
PImage calcolo2; //Verde

PImage mano;

PImage rit;



// Colore
color getColor = 0;
color getColor2 = 0;
int getColor3;
int getColor4;
color getColor5 = 0;
color getColor7 = 0;
int getColor6;
int getColor8;


/*
// Piatto 
PImage piatto; 
int xFo1 = 670;
int yFo1 = 215;
*/
// Food 1 = uova
PImage f01; 
int xFo1 = x;
int yFo1 = 350;
int fo1 = - 1;


// Food 2 = Becon
PImage f02; 
int xFo2 = x;
int yFo2 = 265;
int fo2 =  -1;


// Food 3 = Pizza
PImage f03; 
int xFo3 = x;
int yFo3 = 175 ;
int fo3 = - 1;


// Food 4 = Funghi
PImage f04; 
int xFo4 = x + 10;
int yFo4 = y;
int fo4 = - 1;


// Food 5 = Patatine Fritte
PImage f05; 
int xFo5 = 185;
int yFo5 = y;
int fo5 = - 1;


// Food 6 = Zucchine
PImage f06; 
int xFo6 = 300;
int yFo6 = y;
int fo6 = - 1;


// Food 7 = Hamburger
PImage f07; 
int xFo7 = 410;
int yFo7 = y;
int fo7 = - 1;



// Food 8 = insalata
PImage f08; 
int xFo8 = 510;
int yFo8 = y;
int fo8 = - 1;


// Food 9 = Pollo
PImage f09; 
int xFo9 = x1;
int yFo9 = y;
int fo9 = - 1;


// Food 10 = Frappé
PImage f10; 
int xFo10 = x1;
int yFo10 = 165;
int fo10 = - 1;


// Food 11 = Banana
PImage f11; 
int xFo11 = x1;
int yFo11 = 265;
int fo11 = - 1;


// Food 12 = Saker
PImage f12; 
int xFo12 = x1;
int yFo12 = 350;
int fo12 = - 1;


//sound
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioPlayer pulsante;
AudioPlayer colonnasonora;
AudioPlayer winning;
AudioPlayer gameover;
AudioPlayer running;
AudioPlayer intervallo;


// Spiegazione Corsa ad Ostacoli
PImage spie1;

// Spiegazione Corsa Spesa
PImage spie2;


// Corsa Spesa 

PImage ciboImm[] = new PImage [10];
PImage backgroundSpesa;
PImage carrello;

int cxPos= 20; //Posizione X del carrello
int cyPos = 450; //Posizione Y del carrello

float dis;
int score = 0;

float[] xPos = new float [6];
float[] yPos = new float [6];
float[] speed = new float [6];



// Corsa Ostacoli 

PImage mobiliImm[] = new PImage [10];
PImage soffittoImm[] = new PImage [10];
PImage scoreImm;

float disC;
//int scoreC = 0;

float[] mxPos = new float [3];
float[] myPos = new float [3];
float[] mSpeed = new float [3];

float[] sxPos = new float [4];
float[] syPos = new float [4];
float[] sSpeed = new float [4];


PImage backgroundCorsa;
PImage personaggio1;

int dirY1= 5;
int dirS = 0;

int dyPos= 450; //Posizione Y del personaggio
int dxPos = 20; //Posizione X del personaggio

 

int startingTime; //inizializza i secondi
void draw() {



  // Prima Schermata
  if (state == 0) {

    image(inizio, 0, 0);
  }

  // Seconda Schermata
  if (state == 1) {

    image(BackgroundT, 0, 0);


    image(intro, 0, 0);
  }

  // Terza Schermata
  if (state == 2) {
    println(kal);


    image(BackgroundT, 0, 0);



    //image(tavolaUI, 0, 0);
    if (countFood >= 1) {
      image(clear, 0, 0);
    }
    else {
      image(tavola, 0, 0);
    }

    if (countFood >= 3) {
      image(tavolaOk, 0, 0);
    }
    else {
      image(tavola, 0, 0);
    }


    /// Movimenti Alimenti
    // f01
    if (getColor == -199758) {
      // Uova
      fo1 = 0;
    }

    if (fo1 == - 1) {
      image(f01, xFo1, yFo1);
    }
    else if (fo1 == 0) {
      image(f01, mouseX - f01.width/2, mouseY - f01.height/2);
    }
    else if (fo1 == 1) {
      image(f01, 310, 210);
    }


    // fo2
    if (getColor == -7315) {
      // Becon
      fo2 = 0;
    }

    if (fo2 == -1) {
      image(f02, xFo2, yFo2);
    }
    else if (fo2 == 0) {
      image(f02, mouseX - f02.width/2, mouseY - f02.height/2);
    }
    else if (fo2 == 1) {
      image(f02, 410, 210);
    }

    // fo3
    if (getColor == -16094) {
      // Pizza
      fo3 = 0;
    }

    if (fo3 == -1) {
      image(f03, xFo3, yFo3);
    }
    else if (fo3 == 0) {
      image(f03, mouseX - f03.width/2, mouseY - f03.height/2);
    }
    else if (fo3 == 1) {
      image(f03, 400, 300);
    }

    // fo4
    if (getColor == -4456624) {
      // Funghi
      fo4 = 0;
    }

    if (fo4 == -1) {
      image(f04, xFo4, yFo4);
    }
    else if (fo4 == 0) {
      image(f04, mouseX - f04.width/2, mouseY - f04.height/2);
    }
    else if (fo4 == 1) {
      image(f04, 300, 300);
    }

    // fo5
    if (getColor == -7280088) {
      // Patate Fritte
      fo5 = 0;
    }

    if (fo5 == -1) {
      image(f05, xFo5, yFo5);
    }
    else if (fo5 == 0) {
      image(f05, mouseX - f05.width/2, mouseY - f05.height/2);
    }
    else if (fo5 == 1) {
      image(f05, 310, 210);
    }

    // fo6
    if (getColor == -10312171) {
      // Zucchine
      fo6 = 0;
    }

    if (fo6 == -1) {
      image(f06, xFo6, yFo6);
    }
    else if (fo6 == 0) {
      image(f06, mouseX - f06.width/2, mouseY - f06.height/2);
    }
    else if (fo6 == 1) {
      image(f06, 410, 210);
    }

    // fo7
    if (getColor == -13376769) {
      // Hamburger
      fo7 = 0;
    }

    if (fo7 == -1) {
      image(f07, xFo7, yFo7);
    }
    else if (fo7 == 0) {
      image(f07, mouseX - f07.width/2, mouseY - f07.height/2);
    }
    else if (fo7 == 1) {
      image(f07, 400, 300);
    }

    // fo8
    if (getColor == -13921027) {
      // Insalata
      fo8 = 0;
    }

    if (fo8 == -1) {
      image(f08, xFo8, yFo8);
    }
    else if (fo8 == 0) {
      image(f08, mouseX - f08.width/2, mouseY - f08.height/2);
    }
    else if (fo8 == 1) {
      image(f08, 300, 300);
    }

    // fo9
    if (getColor == -15254828) {
      // Pollo
      fo9 = 0;
    }

    if (fo9 == -1) {
      image(f09, xFo9, yFo9);
    }
    else if (fo9 == 0) {
      image(f09, mouseX - f09.width/2, mouseY - f09.height/2);
    }
    else if (fo9 == 1) {
      image(f09, 310, 210);
    }

    // fo10
    if (getColor == -13747285) {
      // Frappè
      fo10 = 0;
    }

    if (fo10 == -1) {
      image(f10, xFo10, yFo10);
    }
    else if (fo10 == 0) {
      image(f10, mouseX - f10.width/2, mouseY - f10.height/2);
    }
    else if (fo10 == 1) {
      image(f10, 410, 210);
    }

    // fo11
    if (getColor == -5761343) {
      // Banana
      fo11 = 0;
    }

    if (fo11 == -1) {
      image(f11, xFo11, yFo11);
    }
    else if (fo11 == 0) {
      image(f11, mouseX - f11.width/2, mouseY - f11.height/2);
    }
    else if (fo11 == 1) {
      image(f11, 400, 300);
    }

    // fo12
    if (getColor == -2874189) {
      // Saker
      fo12 = 0;
    }

    if (fo12 == -1) {
      image(f12, xFo12, yFo12);
    }
    else if (fo12 == 0) {
      image(f12, mouseX - f12.width/2, mouseY - f12.height/2);
    }
    else if (fo12 == 1) {
      image(f12, 300, 300);
    }

    // Mano
    //noCursor();
    //image (mano, mouseX, mouseY);
  }

  // Schermata Risultati Calorie
  if (state == 3) {

    cursor();

    if ( kal >= 620) {

      state = 5;
    }
    else  if ( kal <= 480) {

      state = 9;
    }
    else  if (kal > 480 && kal < 620) {

      state = 4;
    }
    else {

      state = 0;
    } 

    // Risultato Win 
    if (state == 4) {

      image(win2, 0, 0);
      winning.play();
     
      fill(255);

      textSize(50);
      text(kal, 300, 370);
    }


    // Risultato Maggiore 
    if (state == 5) {

      intervallo.play();

      //background(241, 90, 34,100);
      // tint (255, trasp);
      //image(BackgroundT, 0, 0);

      /* noStroke();
       fill(241, 90, 34, 150);
       rect(0, 0, 800, 600);*/
      println(getColor3);
      //image(calcolo2, 0, 0);

      image(maggiore, 0, 0);

      fill(255);

      textSize(50);
      text(kal, 280, 187);
      //  trasp = trasp - val;
    }

    // Risultato Minore 
    if (state == 9) {

      intervallo.play();
      //image(BackgroundT, 0, 0);

      /*noStroke();
       fill(82, 79, 161, 150);
       rect(0, 0, 800, 600);*/

      println(getColor8);
      image(minore, 0, 0);
      //image(calcolo2, 0, 0);

      fill(255);
      textSize(50);
      text(kal, 280, 187);
    }
  }


  //Spiegazione Corsa Ostacoli

  if ( state == 6) {

    image(BackgroundT, 0, 0);

    image(spie1, 0, 0);
  }


  //Spiegazione Corsa Spesa

  if ( state == 10) {

    //image(BackgroundT, 0, 0);

    image(spie2, 0, 0);
    /*println(getColor4);
     image(calcolo2, 0,0);*/
  }


  // Corsa ostacoli
  if (state == 7) {

    running.play();

    int seconds = (millis() - startingTime) / 1000;
    if (seconds <= 15) {
      image(backgroundCorsa, 0, 0);

      image(personaggio1, dxPos, dyPos);

      for (int i = 0; i < mxPos.length; i = i + 1) {
        image (mobiliImm[i], mxPos[i], myPos[i]);

        if (dist(dxPos, dyPos, mxPos[i], myPos[i]) < 100) {
          dxPos = 0;
          //    scoreC = scoreC + 1;
        }

        mxPos[i] = mxPos[i] + mSpeed[i];

        if (mxPos[i] > width + 200 || mxPos[i] < -1000) {
          mSpeed[i] = mSpeed[i] * -1;
        }
        mxPos[i] = mxPos[i] + mSpeed[i];
      }

      dxPos = dxPos + dirS;
      dyPos = dyPos + dirY1;

      //top border
      if (dyPos < 20) {
        dyPos = 20;
      }
      //bottom border
      if (dyPos > 380) {
        dyPos = 380;
      }

      //left border
      if (dxPos < 0) {
        dxPos = 0;
      }
      //right border
      if (dxPos > 750) {
        dxPos = 750;
      }



      // *********** collegamento al Win da sostituire al posto del testo! **********
      if (dxPos >= 550 && dxPos <= 750 && dyPos >= 150 && dyPos <= 450) {

        state = 13;
      }

      for (int i = 0; i < sxPos.length; i = i + 1) {
        image (soffittoImm[i], sxPos[i], syPos[i]);

        if (dist(dxPos, dyPos, sxPos[i], syPos[i]) < 100) {
          dxPos = 0;
          //      scoreC = scoreC + 1;
        }

        sxPos[i] = sxPos[i] + sSpeed[i];

        if (sxPos[i] > width + 200 || sxPos[i] < -1000) {
          sSpeed[i] = sSpeed[i] * -1;
        }
        sxPos[i] = sxPos[i] + sSpeed[i];
      }
    }
    else {
      // *********** collegamento al Lose da sostituire al posto del testo! **********
      state = 8;
    }


    image(scoreImm, 630, 30); 

    fill(100);
    //  text ("score:" + scoreC, 100,100);
    textSize (25);
    text (str(16-seconds) +" sec", 660, 75);
  }


  //corsa Spesa 
  if (state == 11) {

    running.play();

    // ********** Inizio If del tempo
    int seconds = (millis() - startingTime) / 1000;
    if (seconds <= 15 && seconds <= 15) {

      image(backgroundSpesa, 0, 0);

      image(carrello, cxPos, cyPos);
      for (int i = 0; i < xPos.length; i = i + 1) {
        image (ciboImm[i], xPos[i], yPos[i]);

        if (dist(cxPos, cyPos, xPos[i], yPos[i]) < 50) {
          xPos[i] = 0;
          yPos[i] = random(0, height - 300);
          speed[i] = random(1);
          score = score + 1;
        }

        xPos[i] = xPos[i] + speed[i];

        if (xPos[i] > width || xPos[i] < 0) {
          speed[i] = speed[i] * -1;
        }
        xPos[i] = xPos[i] + speed[i];
      }

      cxPos = cxPos + dirS;
      cyPos = cyPos + dirY1;

      //top border
      if (cyPos < 20) {
        cyPos = 20;
      }
      //bottom border
      if (cyPos > 380) {
        cyPos = 380;
      }
      //left border
      if (cxPos < 0) {
        cxPos = 0;
      }
      //right border
      if (cxPos > 650) {
        cxPos = 650;
      }

      // *********** punteggio **********
      fill(255);
      textSize (40);
      text ("" + score, 665, 115);

      fill(100);
      textSize (25);
      text (str(16-seconds) + " sec", 655, 200);

      // *********** collegamento al Win da sostituire al posto del testo! **********
      if (score >=10 && seconds <= 15) {
        state = 13;

        // Chiusura If del tempo
      }
      else if (score <10 && seconds >= 15) {
        // *********** collegamento al Lose da sostituire al posto del testo! **********
        state = 12;

        /*if (mousePressed) {
         startingTime = millis();
         }*/
      }
    }
  }


  // You Lose Rosso 
  if (state == 8) {

    gameover.play();
    image(lose1, 0, 0);
    //image(rit, 0, 0);
    //println(getColor7);
  }


  // You Lose verde 
  if (state == 12) {
    gameover.play();
    image(lose2, 0, 0);
  }

  // Risultato WinFinale 
  if (state == 13) {

    image(win, 0, 0);
    winning.play();
     
  }
}

void mousePressed() {

  // Scorrimento Schermate
  color col= get(mouseX, mouseY);
  println(col);

  // Schermata 1/2
  if (mousePressed && col== - 528528 && state < 5) {
    state = state + 1;

    minim = new Minim(this);
    pulsante = minim.loadFile("boing.mp3");
    pulsante.play();
  }

  // Schermata 3/4
  if (mousePressed && col== - 528529 && state < 5) {
    state = state + 1;

    minim = new Minim(this);
    pulsante = minim.loadFile("boing.mp3");
    pulsante.play();
  }

  // Clear
  getColor5 = clear.get(mouseX, mouseY);
  //println(getColor5);
  if (mousePressed && getColor5== -7415560 && state <= 5) {
    fo1 = - 1;
    fo2 = - 1;
    fo3 = - 1;
    fo4 = - 1;
    fo5 = - 1;
    fo6 = - 1;
    fo7 = - 1;
    fo8 = - 1;
    fo9 = - 1;
    fo10 = - 1;
    fo11 = - 1;
    fo12 = - 1;

    countFood = 0;
    kal = 0;

    score = 0;

    minim = new Minim(this);
    pulsante = minim.loadFile("boing.mp3");
    pulsante.play();
  }




  //Schermata Intervallo Calorie Alte
  color getColor3 = get(mouseX, mouseY);
  //println(getColor3);

  if (mousePressed && getColor3 ==  - 663184) {

    state = state + 1 ;

    //startingTime = millis();
  }


  //Schermata Intervallo Calorie Alte
  color getColor8 = get(mouseX, mouseY);
  //println(getColor8);

  if (mousePressed && getColor8 ==  - 395923) {

    state = state + 1 ;

    //startingTime = millis();
  }


  //Schermata Spiegazioni Corsa ad Ostacoli
  color getColor6 = get(mouseX, mouseY);
  //println(getColor4);

  if (mousePressed && getColor6 == - 657552 ) {

    state = state + 1;

    startingTime = millis();
  }



  //Schermata Spiegazioni Corsa Spesa
  color getColor4 = get(mouseX, mouseY);
  //println(getColor4);

  if (mousePressed && getColor4 == - 527506 ) {

    state =  state + 1;

    startingTime = millis();
  }


  // Torna ai Giochi
  getColor7 = rit.get(mouseX, mouseY);
  //println(getColor4);

  if (mousePressed && getColor7 == - 9609335 ) {

    state = state - 1;

    score = 0;

    startingTime = millis();
  }



  getColor2 = winUI.get(mouseX, mouseY);

  println(getColor2);


  // Win Ritorno alla tavola
  if (getColor2 == -13676474) {

    state = 0;

    fo1 = - 1;
    fo2 = - 1;
    fo3 = - 1;
    fo4 = - 1;
    fo5 = - 1;
    fo6 = - 1;
    fo7 = - 1;
    fo8 = - 1;
    fo9 = - 1;
    fo10 = - 1;
    fo11 = - 1;
    fo12 = - 1;

    countFood = 0;
    kal = 0;

    score = 0;

    minim = new Minim(this);
    pulsante = minim.loadFile("boing.mp3");
    pulsante.play();
  }



  getColor = tavolaUI.get(mouseX, mouseY);

  println(getColor);
}



void mouseReleased() {



  getColor = tavolaUI.get(mouseX, mouseY);

  if ( getColor == -16777216 && fo1 ==0 || fo2 == 0 || fo3 == 0 ||fo4 == 0 ||fo5 == 0 ||fo6 == 0 || fo7== 0 ||fo8 == 0 ||fo9 == 0 ||fo10 == 0 ||fo11== 0 ||fo12 == 0 ) {
    minim = new Minim(this);
    song = minim.loadFile("cibo_squash.mp3");
    song.play();
  }

  // Piatto + fo1
  if (getColor == -16777216 && fo1 == 0) {
    // Piatto + Uova
    fo1 = 1;

    countFood++;

    kal = kal + 190;
  }
  else if (fo1 == 0) {
    fo1 = -1;
  }

  // Piatto + fo2
  if (getColor == -16777216 && fo2 == 0) {
    // Piatto + Becon
    fo2 = 1;

    countFood++;

    kal = kal + 340;
  }
  else if (fo2 == 0) {
    fo2 = -1;
  }

  // Piatto + fo3
  if (getColor == -16777216 && fo3 == 0) {
    // Piatto + Pizza
    fo3 = 1;

    countFood++;
    kal = kal + 280;
  }
  else if (fo3 == 0) {
    fo3 = -1;
  }

  // Piatto + fo4
  if (getColor == -16777216 && fo4 == 0) {
    // Piatto + Funghi
    fo4 = 1;

    countFood++;
    kal = kal + 25;
  }
  else if (fo4 == 0) {
    fo4 = -1;
  }

  // Piatto + fo5
  if (getColor == -16777216 && fo5 == 0) {
    // Piatto + Patate Fritte
    fo5 = 1;

    countFood++;
    kal = kal + 470;
  }
  else if (fo5 == 0) {
    fo5 = -1;
  }

  // Piatto + fo6
  if (getColor == -16777216 && fo6 == 0) {
    // Piatto + Zucchine
    fo6 = 1;

    countFood++;    
    kal = kal + 70;
  }
  else if (fo6 == 0) {
    fo6 = -1;
  }

  // Piatto + fo7
  if (getColor == -16777216 && fo7 == 0) {
    // Piatto + Hamburger
    fo7 = 1;

    countFood++;    
    kal = kal + 474;
  }
  else if (fo7 == 0) {
    fo7 = -1;
  }

  // Piatto + fo8
  if (getColor == -16777216 && fo8 == 0) {
    // Piatto + Insalata
    fo8 = 1;

    countFood++;    
    kal = kal + 120;
  }
  else if (fo8 == 0) {
    fo8 = -1;
  }

  // Piatto + fo9
  if (getColor == -16777216 && fo9 == 0) {
    // Piatto + Pollo
    fo9 = 1;

    countFood++;    
    kal = kal + 273;
  }
  else if (fo9 == 0) {
    fo9 = -1;
  }

  // Piatto + fo10
  if (getColor == -16777216 && fo10 == 0) {
    // Piatto + Frappè
    fo10 = 1;

    countFood++;    
    kal = kal + 256;
  }
  else if (fo10 == 0) {
    fo10 = -1;
  }

  // Piatto + fo11
  if (getColor == -16777216 && fo11 == 0) {
    // Piatto + Banana
    fo11 = 1;

    countFood++;    
    kal = kal + 65;
  }
  else if (fo11 == 0) {
    fo11 = -1;
  }

  // Piatto + fo12
  if (getColor == -16777216 && fo12 == 0) {
    // Piatto + Saker
    fo12 = 1;

    countFood++;    
    kal = kal + 421;
  }
  else if (fo12 == 0) {
    fo12 = -1;
  }
}


void keyPressed() {
  if (keyCode == UP) {
    dirY1 = -4;
  }
  if (keyCode == DOWN) {
    dirY1 = 4;
  }
  if (keyCode == RIGHT) {
    dirS = 4;
  }
  if (keyCode == LEFT) {
    dirS = -4;
  }
}

void keyReleased() {
  dirS = 0;
  dirY1 = 7; //direzione omino
}

void setup() {

  size(800, 600, P2D);

  // Sound
  minim = new Minim(this);
  colonnasonora = minim.loadFile("soundtrack01.wav");
  colonnasonora.play();
  gameover = minim.loadFile("LOSE.wav");
  winning = minim.loadFile("Ta Da.wav");
  intervallo=minim.loadFile("intervallo_calorie_02.wav");



  /*//sound per corsa ostacoli && spesa
   if (state == 7 || state == 12 ) {
   minim = new Minim(this);*/
  running = minim.loadFile("running_01.mp3");
  /* running.play();
   }*/



  // background di tutte le finestre
  BackgroundT = loadImage("sfondo.jpg");

  //image(BackgroundT, 0, 0);

  // inizio
  inizio = loadImage("inizio.jpg");

  // Schermata 2
  intro = loadImage("intro-2.jpg");

  // Schermata 3
  tavola = loadImage("tavola-03.png");
  tavolaOk = loadImage("tavola-03_ok.png");
  tavolaUI = loadImage("clic-04.jpg");
  clear = loadImage("clear.png");
  f01 = loadImage ("f01.png");
  f02 = loadImage ("f02.png");
  f03 = loadImage ("f03.png");
  f04 = loadImage ("f04.png");
  f05 = loadImage ("f05.png");
  f06 = loadImage ("f06.png");
  f07 = loadImage ("f07.png");
  f08 = loadImage ("f08.png");
  f09 = loadImage ("f09.png");
  f10 = loadImage ("f10.png");
  f11 = loadImage ("f11.png");
  f12 = loadImage ("f12.png");
  mano= loadImage ("mano.png");

  //Schermata 4/5
  eating = loadImage ("eating.png");
  maggiore = loadImage ("maggiore.jpg");
  minore = loadImage ("minore.jpg");
  calcolo2 = loadImage ("calcolo2UI.png");
  rit = loadImage ("final-09UI.png");

  // Win
  win = loadImage ("finali-10.jpg");
  win2 = loadImage ("finali-11.jpg");
  winUI = loadImage ("final-10UI.png");

  // Lose 1/2
  lose1 = loadImage ("finali-08.jpg");
  lose2 = loadImage ("finali-09.jpg");

  //Spiegazione Corsa Ostacoli
  spie1 = loadImage ("info-1-1-1.jpg");
  spie2 = loadImage ("info-2-1.jpg");


  // Corsa ostacoli

  backgroundCorsa = loadImage("sfondo_salotto-02.jpg");
  personaggio1 = loadImage("char1.png");
  scoreImm = loadImage("sfondo_score.png");

  // Loop dei mobili
  for (int i = 0; i < mxPos.length; i = i + 1) {
    mxPos[i] = random(width);
    myPos[i] = random(height - 300, height - 150);
    mSpeed[i] = random(1);
    //println (random(0, 4));
    mobiliImm[i] = loadImage ("mobili"+int(random(0, 3))+".png");
  }

  // Loop dei soffitto
  for (int i = 0; i < sxPos.length; i = i + 1) {
    sxPos[i] = random(width);
    syPos[i] = random(0, height - 700);
    sSpeed[i] = random(1);
    //println (random(0, 4));
    soffittoImm[i] = loadImage ("soffitto"+int(random(0, 3))+".png");
  }

  startingTime = millis(); //converte in millis




    // Corsa Spesa
  for (int i = 0; i < xPos.length; i = i + 1) {
    xPos[i] = random(width);
    yPos[i] = random(0, height - 800);
    speed[i] = random(1);

    //println (random(0, 4));
    ciboImm[i] = loadImage ("cibo"+int(random(0, 4))+".png");
  }

  backgroundSpesa = loadImage("corsa1.jpg");
  carrello = loadImage("carrello.png");



  smooth(4);
}




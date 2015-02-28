
int lvl = 0;
int lvlup = 1;
boolean intro = false;
boolean extro = false;
int perder;
int ganhar;
String winorlose = " ";



//--------------------------------------- LVL0
int xx = 0;
int yy = 0;
PImage mapa;
PImage lock;




//--------------------------------------- LVL1
int moverxx;
int moveryy;
int xxx = -1;
int yyy= 0;
int lvl1points = 0;
int filll = 255;
int[] positionxx = {
  300, 300, 500, 700, 450, 100
};
int[] positionyy = {
  300, 500, 500, 600, 0, -100
};
PImage[] direita =  new PImage[4];
PImage[] esquerda =  new PImage[4];
PImage[] cima =  new PImage[4];
PImage[] baixo =  new PImage[4];
int lvl1imageCounter = 0;
PImage[] teste = direita;
PImage lvl1fundo;
PImage uvas;





//--------------------------------------- LVL2
PImage pisafundo;
boolean lr;
int lvl2counter = 0;
int lvl2points;
PImage[] imageSequence =  new PImage[3];
int counterOfImageNumber = 0;
long timer;
long interval = 1000;
int clock = 0;





//--------------------------------------- LVL3
int pressCounter = 0;
int presses = pressCounter * 100;
int lvl3runner = 0;
int lvl3riorunner = 0;
float rand;
int randd;
float alea;
int aleaa;
int upp = 0;
int filler = 0;
PImage rio;
PImage barco;
PImage rocha;





//--------------------------------------- LVL4
int clicker;
int r;
int g;
int b;
int lvl4selector;
PImage fundoblend;
PImage selector;






void setup() {
  size(800, 600);
  smooth();
  PFont font;
  font = loadFont("AtariST8x16SystemFont-48.vlw");
  textFont(font, 32);




  //--------------------------------------- LVL0
  mapa = loadImage("mapa.png");
  lock = loadImage("lock.png");



  //--------------------------------------- LVL1
  lvl1fundo = loadImage("fundovindima.png");
  uvas = loadImage("uvas.png");

  for ( int i = 0 ; i <= 3 ; i++)
  {
    direita[i] =loadImage("direita0" + str(i) + ".png" );
  }
  for ( int i = 0 ; i <= 3 ; i++)
  {
    esquerda[i] =loadImage("esquerda0" + str(i) + ".png" );
  }
  for ( int i = 0 ; i <= 3 ; i++)
  {
    baixo[i] =loadImage("frente0" + str(i) + ".png" );
  }  
  for ( int i = 0 ; i <= 3 ; i++)
  {
    cima[i] =loadImage("tras0" + str(i) + ".png" );
  }




  //--------------------------------------- LVL2
  pisafundo = loadImage("pisa_fundo.png");
  for ( int i = 0 ; i < 3 ; i++) {
    imageSequence[i] =loadImage( "pernas" + str(i) + ".png" );
  }
  timer = millis() + interval;



  //--------------------------------------- LVL3
  rand = random(4);
  randd = int(rand);
  rio = loadImage("rio.png");
  barco = loadImage("barco.png");
  rocha = loadImage("rocha.png");



  //--------------------------------------- LVL4
  fundoblend = loadImage("misturafundo.png");
  selector = loadImage("selector.png");
}




void draw() {

  //--------------------------------------- LVL0
  if (lvl == 0) {
    noStroke();
    image(mapa, 0, 0);

    noFill();
    stroke(255);
    strokeWeight(4);
    rect(xx, yy, 396, 296);

    if (lvlup < 2) {
      image(lock, 538, 88);
    }
    if (lvlup < 3) {
      image(lock, 538, 388);
    }
    if (lvlup < 4) {
      image(lock, 138, 388);
    }
  }

  //--------------------------------------- LVL1
  if (lvl == 1) {
    if (intro) {
      fill(255);
      noStroke();
      rect(0, 0, width, height);
      fill(0);
      text("RAMOS PINTO LVL1", 100, 300);
    } 
    else if (extro) {
      noStroke();
      fill(perder, ganhar, 0);
      rect(0, 0, width, height);
      fill(0);
      text(winorlose, 100, 200);
    } 
    else {
      background(0, 255, 0);
      image(lvl1fundo, -800 + moverxx, -600 + moveryy);

      fill(255);
      textSize(32);
      text(lvl1points, 10, 30);
      text(15 - clock, 10, 60);
      if ( lvl1imageCounter > 3 ) lvl1imageCounter = 0;
      image(teste[lvl1imageCounter], 300, 200);
      lvl1imageCounter++;

      if ( timer < millis() ) {
        timer = millis() + interval;
        clock++;
        println (clock);
      }

      for (int i = 0; i < 6; i++) {
        if (positionxx[i] + moverxx > 350 && positionxx[i] + moverxx < 450
          && positionyy[i] + moveryy > 200 && positionyy[i] + moveryy < 400) {

          positionxx[i] = -99999;
          positionyy[i] = -99999;
          lvl1points = lvl1points + 1;
        }
        fill(filll);
        image(uvas, positionxx[i] + moverxx, positionyy[i] + moveryy);
        moverxx = moverxx + xxx;
        moveryy = moveryy + yyy;
      }
      if (clock == 15) {
        if (lvl1points >= 5) {
          ganhar = 255;
          perder = 0;
          extro = true;
          winorlose = "ganhaste!";
          lvlup=2;
        } 
        else {
          perder = 255;
          ganhar = 0;
          extro = true;
          winorlose = "perdeste!";
        }
        lvl1points = 0;
        clock = 0;
      }
    }
  }


  //--------------------------------------- LVL2
  if (lvl == 2) {
    if (intro) {
      fill(255);
      noStroke();
      rect(0, 0, width, height);
      fill(0);
      text("RAMOS PINTO LVL2", 100, 300);
    }
    else if (extro) {
      noStroke();
      fill(perder, ganhar, 0);
      rect(0, 0, width, height);
      fill(0);
      text(winorlose, 100, 200);
    }
    else {
      if ( timer < millis() ) {
        timer = millis() + interval;
        clock++;
        println (clock);
      }

      image(pisafundo, 0, 0 );

      image(imageSequence[counterOfImageNumber], 0, 0);
      text("POINTS- " + lvl2counter, 50, 50);
      text("TIME- " + str(15-clock), 50, 80);

      if (clock >= 15) {
        if (lvl2counter >= 100) {
          ganhar = 255;
          perder = 0;
          extro = true;
          lvlup = 3;
          winorlose = "ganhaste!";
        }
        else if (lvl2counter < 100) {
          ganhar = 0;
          perder = 255;
          extro = true;
          winorlose = "perdeste!";
        }
        lvl2counter = 0;
        clock = 0;
      }
    }
  }


  //--------------------------------------- LVL3
  if (lvl == 3) {
    if (intro) {
      fill(255);
      noStroke();
      rect(0, 0, width, height);
      fill(0);
      text("RAMOS PINTO LVL3", 100, 300);
    } 
    else if (extro) {
      noStroke();
      fill(perder, ganhar, 0);
      rect(0, 0, width, height);
      fill(0);
      text(winorlose, 100, 200);
    } 
    else {
      fill(0);
      rect(0, 0, width, height);
      image(rio, 0, 0 - lvl3riorunner);
      stroke(255);

      fill(255);
      image(barco, (pressCounter * 160) + 35, 30);
      textSize(32);

      if (lvl3runner < 630) {
        fill(255);
        image(rocha, 30 + (160 * randd), 600 - lvl3runner);
        if (upp == 8) {
          image(rocha, 30 + (160 * aleaa), 600 - lvl3runner);
        }
        lvl3runner+=13;
      }

      if (lvl3riorunner < 1130) {
        lvl3riorunner+=13;
      } 
      else {
        lvl3riorunner = 0;
      }

      if (lvl3runner >= 630 && upp < 10) {
        lvl3runner = 0;
        upp++;
        rand = random(4);
        randd = int(rand);
        if (upp == 8) {
          alea = random(4);
          aleaa = int(alea);
        }
      }



      if (lvl3runner > 470 && lvl3runner < 525 && upp < 10) {
        if (randd == pressCounter || (upp == 8 && aleaa == pressCounter)) {
          perder = 255;
          ganhar = 0;
          extro = true;
          winorlose = "perdeste!";
        }
      } 
      else if (upp == 10 && perder == 0) {
        perder = 0;
        ganhar = 255;
        extro = true;
        lvlup = 4;
        winorlose = "ganhaste!";
      }
    }
  }




  //--------------------------------------- LVL4
  if (lvl == 4) {
    if (intro) {
      fill(255);
      noStroke();
      rect(0, 0, width, height);
      fill(0);
      text("RAMOS PINTO LVL4", 100, 300);
    } 
    else if (extro) {
      noStroke();
      fill(perder, ganhar, 0);
      rect(0, 0, width, height);
      fill(0);
      text(winorlose, 100, 200);
    } 
    else {
      noStroke();

      fill(0);
      rect(0, 0, width, height);
      fill(154, 30, 68);
      rect(50, 50, 100, 100);


      fill(74 + (r*40), 100-(g*70), 28+(b*20));
      rect(200, 590 - clicker * 35, 400, 400);
      image(fundoblend, 0, 0);


      image(selector, 65 + (lvl4selector * 233), 10);


      if (clicker == 5) {
        if (r == 2 && g == 1 && b ==2) {
          ganhar = 255;
          perder = 0;
          lvlup = 1;
          winorlose = "GAME OVER!";
          extro = true;
        } 
        else {
          ganhar = 0;
          perder = 255;
          winorlose = "perdeste!";
          extro = true;
        }
      }
    }
  }
}

void keyPressed() {
  //--------------------------------------- LVL1
  if (lvl == 1) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        xxx = + 1;
        yyy = 0;
        teste = esquerda;
      }
    }

    if (key == CODED) {
      if (keyCode == RIGHT) {
        xxx = - 1;
        yyy = 0;
        teste = direita;
      }
    }

    if (key == CODED) {
      if (keyCode == DOWN) {
        xxx = 0;
        yyy = -1;
        teste = baixo;
      }
    }

    if (key == CODED) {
      if (keyCode == UP) {
        xxx = 0;
        yyy = + 1;
        teste = cima;
      }
    }


    if (key == ' ') {
      if (intro) {
        intro = false;
      }
    }
  }




  //--------------------------------------- LVL2
  if (lvl == 2) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        counterOfImageNumber = 1;
      }
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        counterOfImageNumber = 2;
      }
    }
    if (key == ' ') {
      if (intro) {
        intro = false;
      }
    }
  }





  //--------------------------------------- LVL3
  if (lvl == 3) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (pressCounter < 4) {
          pressCounter++;
        }
      }
    }

    if (key == CODED) {
      if (keyCode == LEFT) {
        if (pressCounter > 0) {
          pressCounter--;
        }
      }
    }
    if (key == ' ') {
      if (intro) {
        intro = false;
      }
    }
  }



  //--------------------------------------- LVL4
  if (lvl == 4) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        if (lvl4selector > 0) {
          lvl4selector--;
        }
      }
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (lvl4selector < 2) {
          lvl4selector++;
        }
      }
    }
    if (key == ' ') {
      if (intro) {
        intro = false;
      } 
      else if (lvl4selector == 0) {
        r++;
        clicker++;
      } 
      else if (lvl4selector == 1) {
        g++;
        clicker++;
      } 
      else if (lvl4selector == 2) {
        b++;
        clicker++;
      }
    }
  }



  //--------------------------------------- LVL0
  if (lvl == 0) {
    if (xx == 0 && yy == 0) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          xx = 400;
          yy = 0;
        } 
        else if (keyCode == DOWN) {
          xx = 0;
          yy = 300;
        }
      }
      if (key == ' ') {
        lvl = 1;
        intro = true;
      }
    }



    if (xx == 400 && yy == 0) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          xx = 400;
          yy = 300;
        } 
        else if (keyCode == LEFT) {
          xx = 0;
          yy = 0;
        }
      }
      if (key == ' ' && lvlup >= 2) {
        lvl = 2;
        intro = true;
      }
    }

    if (xx == 400 && yy == 300) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          xx = 0;
          yy = 300;
        } 
        else if (keyCode == UP) {
          xx = 400;
          yy = 0;
        }
      }
      if (key == ' ' && lvlup >= 3) {
        lvl = 3;
        intro = true;
      }
    }



    if (xx == 0 && yy == 300) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          xx = 400;
          yy = 300;
        }
        else if (keyCode == UP) {
          xx = 0;
          yy = 0;
        }
      }
      if (key == ' ' && lvlup >= 4) {
        lvl = 4;
        intro = true;
      }
    }
  }
}


void keyReleased() {
  //--------------------------------------- LVL1
  if (lvl == 1) {
    if (key == ' ') {
      if (extro) {
        lvl = 0;
        extro = false;
      }
    }
  }



  //--------------------------------------- LVL2
  if (lvl == 2) {
    if (key == CODED) {
      if (keyCode == LEFT && !intro) {
        counterOfImageNumber = 0;
        lvl2counter++;
      }
    }
    if (key == CODED) {
      if (keyCode == RIGHT && !intro) {
        counterOfImageNumber = 0;
        lvl2counter++;
      }
    }
    if (key == ' ') {
      if (extro) {
        extro = false;
        lvl = 0;
      }
    }
  }



  //--------------------------------------- LVL3
  if (lvl == 3) {
    if (key == ' ') {
      if (extro) {
        lvl = 0;
        extro = false;
      }
    }
  }
  
  
 
 
 
 
 //--------------------------------------- LVL3
  if (lvl == 4) {
    if (extro) {
      extro = false;
      lvl = 0;
    }
  }
}




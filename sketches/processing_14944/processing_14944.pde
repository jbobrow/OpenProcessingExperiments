
//  Maya Tanaka
//  Desma 28 Interactivity
//  Project 04 - Narrate
//  2010/11/04
//  Version 2.1

//  Images and stories taken from http://www.gutenberg.org/files/18732/18732-h/18732-h.htm
//  Coding referenced  from: Tea Party by Mimi http://openprocessing.org/visuals/?visualID=7817
//                          Project 4: The Griffin of Wonderland by Matthew Rigodanzo http://openprocessing.org/visuals/?visualID=7798
//                          Button Function Example http://classes.dma.ucla.edu/Fall10/28/_resources/buttonFunction.zip

int page = 0;
//  Triggers-----------------------------------------------
int party = 0;
int mouse = 0;
int fox = 0;
int boar = 0;
int dolphin = 0;
int foxEncounter01 = 0;
int foxEncounter02 = 0;
int foxEncounter03 = 0;
int foxEncounter04 = 0;
int deadFox = 0;
int foxParty = 0;
int boarEncounter = 0;
int dolphinEncounter = 0;
int humanEncounter = 0;
int damage = 0;
PFont font;

//  Images-------------------------------------------------
PImage lionMouse01, lionMouse02;
PImage lionAttack01, lionAttack02;
PImage lionLove, lionLove02, lionGameOver;
PImage encounterMouse, encounterFox, encounterBoar, encounterDolphin, encounterHuman; 
PImage woodcutter, humanSad, humanBig, woodcutterGrin;
PImage mouseMoral, boarMoral, dolphinMoral, foxMoral, compromiseMoral;
PShape river, seashore, town;
PShape textRiver, textSeashore, textTown;
PShape encounterFlash;
PShape attack, letGo, compromise, formPact, peace, walkAround, yes;
PShape heart;
PShape flower;
PShape backgroundCover, backgroundScreen01, backgroundWhereToGo;
PShape backgroundPink, backgroundParty;
PShape backgroundGrass, backgroundGrass02;
PShape backgroundRiver;
PShape backgroundSeashore, backgroundSeashore02;
PShape backgroundTown, backgroundHouse;
PShape doorClosed, doorOpen;
PShape gameOver;

//  Colors-------------------------------------------------
color colorRed = color (255,25,25);

//  Button Parameters--------------------------------------
int b1ax = 0;
int b1ay = 0;
int b1aw = 640;
int b1ah = 480;
int b2ax = 60;
int b2ay = 360;
int b2aw = 230;
int b2ah = 75;
int b3ax = 350;
int b3ay = 360;
int b3aw = 230;
int b3ah = 75;

//  Setup--------------------------------------------------
void setup () {
  size (640,480);
  noStroke ();
  cursor (CROSS);
  //  Font
  font = loadFont ("ArabicTypesetting-48.vlw");
  textFont (font);
  //  Load Images
  lionMouse01 = loadImage ("lionMouse01.png");
  lionMouse02 = loadImage ("lionMouse02.png");
  lionAttack01 = loadImage ("lionAttack01.png");
  lionAttack02 = loadImage ("lionAttack02.png");
  lionLove = loadImage ("lionLove.png");
  lionLove02 = loadImage ("lionLove02.png");
  lionGameOver = loadImage ("lionGameOver.png");
  encounterMouse = loadImage ("encounterMouse.png");
  encounterFox = loadImage ("encounterFox.png");
  encounterBoar = loadImage ("encounterBoar.png");
  encounterDolphin = loadImage ("encounterDolphin.png");
  encounterHuman = loadImage ("encounterHuman.png");
  woodcutter = loadImage ("woodcutter.png");
  humanSad = loadImage ("humanSad.png");
  humanBig = loadImage ("humanBig.png");
  woodcutterGrin = loadImage ("woodcutterGrin.png");
  mouseMoral = loadImage ("mouseMoral.jpg");
  boarMoral = loadImage ("boarMoral.jpg");
  dolphinMoral = loadImage ("dolphinMoral.jpg");
  foxMoral = loadImage ("foxMoral.jpg");
  compromiseMoral = loadImage ("compromiseMoral.jpg");
  encounterFlash = loadShape ("encounterFlash.svg");
  river = loadShape ("river.svg");
  seashore = loadShape ("seashore.svg");
  town = loadShape ("town.svg");
  textRiver = loadShape ("textRiver.svg");
  textSeashore = loadShape ("textSeashore.svg");
  textTown = loadShape ("textTown.svg");
  attack = loadShape ("attack.svg");
  letGo = loadShape ("letGo.svg");
  formPact = loadShape ("formPact.svg");
  compromise = loadShape ("compromise.svg");
  peace = loadShape ("peace.svg");
  heart = loadShape ("heart.svg");
  flower = loadShape ("flower.svg");
  yes = loadShape ("yes.svg");
  walkAround = loadShape ("walkAround.svg");
  backgroundCover = loadShape ("backgroundCover.svg");
  backgroundScreen01 = loadShape ("backgroundScreen01.svg");
  backgroundWhereToGo = loadShape ("backgroundWhereToGo.svg");
  backgroundPink = loadShape ("backgroundPink.svg");
  backgroundParty = loadShape ("backgroundParty.svg");
  backgroundGrass = loadShape ("backgroundGrass.svg");
  backgroundGrass02 = loadShape ("backgroundGrass02.svg");
  backgroundTown = loadShape ("backgroundTown.svg");
  backgroundHouse = loadShape ("backgroundHouse.svg");
  backgroundRiver = loadShape ("backgroundRiver.svg");
  doorClosed = loadShape ("doorClosed.svg");
  doorOpen = loadShape ("doorOpen.svg");
  backgroundSeashore = loadShape ("backgroundSeashore.svg");
  backgroundSeashore02 = loadShape ("backgroundSeashore02.svg");
  gameOver = loadShape ("gameOver.svg");
}

//  Draw---------------------------------------------------
void draw () {
  println (page);
  smooth ();

  if (page == 0) {
    pageZero ();
  } 
  else if (page == 1) {
    pageOne ();
  }
  else if (page == 2) {
    pageTwo ();
  }
  else if (page == 3) {
    pageThree ();
  }
  else if (page == 4) {
    pageFour ();
  }
  else if (page == 5) {
    pageFive ();
  }
  else if (page == 6) {
    pageSix ();
  }
  else if (page == 7) {
    pageSeven ();
  }
  else if (page == 8) {
    pageEight ();
  }
  else if (page == 9) {
    pageNine ();
  }
  else if (page == 10) {
    pageTen ();
  } 
  else if (page == 11) {
    pageEleven ();
  } 
  else if (page == 12) {
    pageTwelve ();
  }
  else if (page == 13) {
    pageThirteen ();
  }
  else if (page == 14) {
    pageFourteen ();
  }
  else if (page == 15) {
    pageFifteen ();
  }
  else if (page == 16) {
    pageSixteen ();
  }
  else if (page == 17) {
    pageSeventeen ();
  }
  else if (page == 18) {
    pageEighteen ();
  }
  else if (page == 19) {
    pageNineteen ();
  }
  else if (page == 20) {
    pageTwenty ();
  }
  else if (page == 21) {
    pageTwentyOne ();
  }
  else if (page == 22) {
    pageTwentyTwo ();
  }
  else if (page == 23) {
    pageTwentyThree ();
  }
  else if (page == 24) {
    pageTwentyFour ();
  }
  else if (page == 25) {
    pageTwentyFive ();
  }
  else if (page == 26) {
    pageTwentySix ();
  }
  else if (page == 27) {
    pageTwentySeven ();
  }
  else if (page == 29) {
    pageTwentyNine ();
  }
  else if (page == 30) {
    pageThirty ();
  }
  else if (page == 31) {
    pageThirtyOne ();
  }
  else if (page == 32) {
    pageThirtyTwo ();
  }
  else if (page == 33) {
    pageThirtyThree ();
  }
  else if (page == 34) {
    pageThirtyFour ();
  }
  else if (page == 35) {
    pageThirtyFive ();
  }
  else if (page == 36) {
    pageThirtySix ();
  }
  else if (page == 37) {
    pageThirtySeven ();
  }
  else if (page == 38) {
    pageThirtyEight ();
  }
  else if (page == 39) {
    pageThirtyNine ();
  }
  else if (page == 40) {
    pageFourty ();
  }
  else if (page == 41) {
    pageFourtyOne ();
  }
  else if (page == 42) {
    pageFourtyTwo ();
  }
  else if (page == 43) {
    pageFourtyThree ();
  }
  else if (page == 44) {
    pageFourtyFour ();
  }
  else if (page == 45) {
    pageFourtyFive ();
  }
  else if (page == 46) {
    pageFourtySix ();
  }
  else if (page == 47) {
    pageFourtySeven ();
  }
  else if (page == 48) {
    pageFourtyEight ();
  }
  else if (page == 49) {
    pageFourtyNine ();
  }
  else if (page == 50) {
    pageFifty ();
  }
  else if (page == 51) {
    pageFiftyOne ();
  }
  else if (page == 52) {
    pageFiftyTwo ();
  }
  else if (page == 53) {
    pageFiftyThree ();
  }
}

//  Button Connections-------------------------------------
void mousePressed () {
  if (page == 0) {
    if ((mouseX >= 320) && (mouseX <= 565) && (mouseY >= 205) && (mouseY <= 290)) {
      page = 1;
    }
  } 

  else if (page == 1) {
    if ((mouseX >= 0) && (mouseX <= (width/4))) {
      if (mouse == 0) {
        page = 2;
      } 
      else if ((foxEncounter04 == 0) && (deadFox == 0)) {
        foxEncounter04 = 1;
        page = 8;
      } 
      else if ((mouse == 1) ||
        (mouse == 2)) {
        page = 2;
      } 
      else {
        page = 9;
      }
    }
    else if ((mouseX >= (width/4*3)) && (mouseX <= width)) {
      if ((foxEncounter01 == 0) && (deadFox == 0)) {
        foxEncounter01 = 1;
        page = 4;
      } 
      else {
        page = 10;
      }
    }
  }

  else if (page == 2) {
    if (overButton (b1ax,b1ay, b1aw, b1ah) == true) {
      if (mouse == 0) {
        page = 3;
      } 
      else {
        page = 5;
      }
    }
  }

  else if (page == 3) {
    if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {
      mouse = 1;
      page = 39;
    }
    else if (overButton (b3ax,b3ay, b3aw,b3ah) == true) {
      mouse = 2;
      page = 50;
    }
  }

  else if (page == 4) {
    if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {
      page = 23;
    }
    else if (overButton (b3ax,b3ay, b3aw,b3ah) == true) {
      fox ++;
      if (fox >= 3) {
        party ++;
        deadFox = 1;
        foxParty = 1;
        page = 24;
      } 
      else {
        page = 10;
      }
    }
  }

  else if (page == 5) {
    if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (mouse == 1)) {
      page = 6;
    }
    else if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (mouse == 2)) {
      page = 7;
    }
  }

  else if (page == 6) {
    if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
      party = 0;
      mouse = 0;
      fox = 0;
      boar = 0;
      dolphin = 0;
      foxEncounter01 = 0;
      foxEncounter02 = 0;
      foxEncounter03 = 0;
      deadFox = 0;
      foxParty = 0;
      boarEncounter = 0;
      dolphinEncounter = 0;
      humanEncounter = 0;
      damage = 0;
      page = 0;
    }
  }

  else if (page == 7) {
    if (overButton (b1ax,b1ay, b1aw, b1ah) == true) {
      mouse = 3;
      party ++;
      page = 1;
    }
  }

  else if (page == 8) {
    if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (deadFox == 0)) {
      page = 51;
    } 
    else {
      page = 1;
    }
  }

  else if (page == 9) {
    if (overButton (b1ax,b1ay, b1aw, b1ah) == true) {
      page = 1;
    }
  }

  else if (page == 10) {
    if ((mouseX >= 400) && (mouseX <= 530) && (mouseY >= 70) && (mouseY <= 170)) {
      page = 11;
    }
    else if ((mouseX >= 100) && (mouseX <= 240) && (mouseY >= 210) && (mouseY <= 300)) {
      if (dolphinEncounter == 0) {
        dolphinEncounter = 1;
        page = 21;
      } 
      else {
        page = 52;
      }
    }
    else if ((mouseX >= 380) && (mouseX <= 510) && (mouseY >= 280) && (mouseY <= 400)) {
      if (humanEncounter == 0) {
        humanEncounter = 1;
        page = 29;
      } 
      else {
        page = 32;
      }
    }
  }

  else if (page == 11) {
    if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (boarEncounter == 0)) {
      boarEncounter = 1;
      page = 13;
    }
    else if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (boarEncounter == 1)) {
      page = 14;
    }
  }

  else if (page == 12) {
    if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (dolphinEncounter == 0)) {
      dolphinEncounter = 1;
      page = 21;
    }
    else if ((overButton (b1ax,b1ay, b1aw, b1ah) == true) && (dolphinEncounter == 1)) {
      page = 52;
    }
  }

  else if (page == 13) {
    if ((overButton (b2ax,b2ay, b2aw, b2ah) == true) && (boar >= -3)) {
      page = 15;
    }
    if ((overButton (b2ax,b2ay, b2aw, b2ah) == true) && (boar < -3)) {
      page = 16;
    }
    else if ((overButton (b3ax,b3ay, b3aw,b3ah) == true) && (boar >= -2)) {
      page = 18;
    } 
    else if ((overButton (b3ax,b3ay, b3aw,b3ah) == true) && (boar < -2)) {
      page = 17;
    }
  }

  else if (page == 14) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if ((foxEncounter02 == 0) && (deadFox == 0)) {
        foxEncounter02 = 1;
        page = 19;
      }    
      else {
        page = 1;
      }
    }
  }

  else if (page == 15) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      boar --;
      page = 13;
    }
  }

  else if (page ==16) {
    if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
      party = 0;
      mouse = 0;
      fox = 0;
      boar = 0;
      dolphin = 0;
      foxEncounter01 = 0;
      foxEncounter02 = 0;
      foxEncounter03 = 0;
      deadFox = 0;
      foxParty = 0;
      boarEncounter = 0;
      dolphinEncounter = 0;
      humanEncounter = 0;
      damage = 0;
      page = 0;
    }
  }

  else if (page ==17) {
    if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
      party = 0;
      mouse = 0;
      fox = 0;
      boar = 0;
      dolphin = 0;
      foxEncounter01 = 0;
      foxEncounter02 = 0;
      foxEncounter03 = 0;
      deadFox = 0;
      foxParty = 0;
      boarEncounter = 0;
      dolphinEncounter = 0;
      humanEncounter = 0;
      damage = 0;
      page = 0;
    }
  }

  else if (page == 18) {
    if (overButton (b1ax,b1ay, b1aw, b1ah) == true) {
      boar = 1;
      party ++;
      page = 1;
    }
  }

  else if (page == 19) {
    if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {
      page = 23;
    }
    else if (overButton (b3ax,b3ay, b3aw,b3ah) == true) {
      fox ++;
      if (fox >= 3) {
        party ++;
        deadFox = 1;
        foxParty = 1;
        page = 24;
      } 
      else {
        page = 10;
      }
    }
  }

  else if (page == 20) {    
    if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
      party = 0;
      mouse = 0;
      fox = 0;
      boar = 0;
      dolphin = 0;
      foxEncounter01 = 0;
      foxEncounter02 = 0;
      foxEncounter03 = 0;
      deadFox = 0;
      foxParty = 0;
      boarEncounter = 0;
      dolphinEncounter = 0;
      humanEncounter = 0;
      damage = 0;
      page = 0;
    }
  }

  else if (page == 21) {
    dolphinEncounter = 1;
    if ((overButton (b2ax,b2ay, b2aw, b2ah) == true) && (dolphin >= -3)) {
      page = 22;
    }
    if ((overButton (b2ax,b2ay, b2aw, b2ah) == true) && (dolphin < -3)) {
      page = 20;
    }
    else if ((overButton (b3ax,b3ay, b3aw,b3ah) == true) && (dolphin >= -2)) {
      page = 26;
    } 
    else if ((overButton (b3ax,b3ay, b3aw,b3ah) == true) && (dolphin < -2)) {
      page = 25;
    }
  }

  else if (page == 22) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      dolphin --;
      page = 21;
    }
  }

  else if (page == 23) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      deadFox = 1;
      page = 1;
    }
  }

  else if (page == 24) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      party ++;
      deadFox = 1;
      foxParty = 1;
      page = 1;
    }
  }

  else if (page == 25) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      dolphin = 1;
      if ((foxEncounter03 == 0) && (deadFox == 0)) {
        foxEncounter03 = 1;
        page = 27;
      }
      else {
        page = 1;
      }
    }
  }

  else if (page == 26) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      dolphin = 2;
      party ++;
      if ((foxEncounter03 == 0) && (deadFox == 0)) {
        foxEncounter03 = 1;
        page = 27;
      } 
      else {
        page = 1;
      }
    }
  }

  else if (page == 27) {
    if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {
      page = 23;
    }
    else if (overButton (b3ax,b3ay, b3aw,b3ah) == true) {
      fox ++;
      if (fox >= 3) {
        party ++;
        deadFox = 1;
        foxParty = 1;
        page = 24;
      } 
      else {
        page = 1;
      }
    }
  } 

  else if (page == 29) {
    if ((mouseX >= 210) && (mouseX <= 290) && (mouseY >= 100) && (mouseY <= 415)) {
      page = 30;
    }
  }

  else if (page == 30) {
    if ((mouseX >= 455) && (mouseX <= 575) && (mouseY >= 60) && (mouseY <=170)) {
      page = 31;
    }
  }

  else if (page == 31) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 32;
    }
  }

  else if (page == 32) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 33;
    }
  }

  else if (page == 33) {
    if ((mouseX >= 290) && (mouseX <= 365) && (mouseY >= 130) && (mouseY <= 440)) {
      page = 34;
    }
    else if ((mouseX >= 485) && (mouseX <= 580) && (mouseY >= 220) && (mouseY <= 430)) {
      page = 53;
    }
    else if ((mouseX >= 35) && (mouseX <= 175) && (mouseY >= 120) && (mouseY <= 395)) {
      page = 1;
    }
  }

  else if (page == 34) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 35;
    }
  }

  else if (page == 35) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (mouse == 3) {
        damage ++;
        page = 36;
      } 
      else if (boar == 1) {
        damage ++;
        page = 37;
      } 
      else if (foxParty == 1) {
        damage ++;
        page = 38;
      } 
      else if (dolphin == 2) {
        page = 40;
      } 
      else {
        page = 48;
      }
    }
  }

  else if (page == 36) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (boar == 1) {
        damage ++;
        page = 37;
      } 
      else if (foxParty == 1) {
        damage ++;
        page = 38;
      }       
      else if (dolphin == 2) {
        page = 40;
      } 
      else {
        page = 48;
      }
    }
  }

  else if (page == 37) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (foxParty == 1) {
        damage ++;
        page = 38;
      } 
      else if (dolphin == 2) {
        page = 40;
      } 
      else {
        page = 48;
      }
    }
  }

  else if (page == 38) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (dolphin == 2) {
        page = 40;
      } 
      else {
        page = 48;
      }
    }
  }

  else if (page == 39) {
    if (overButton (b1ax,b1ay, b1aw, b1ah) == true) {
      page = 50;
    }
  }

  else if (page == 40) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 48;
    }
  }

  else if (page == 42) {  
    if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
      party = 0;
      mouse = 0;
      fox = 0;
      boar = 0;
      dolphin = 0;
      foxEncounter01 = 0;
      foxEncounter02 = 0;
      foxEncounter03 = 0;
      deadFox = 0;
      foxParty = 0;
      boarEncounter = 0;
      dolphinEncounter = 0;
      humanEncounter = 0;
      damage = 0;
      page = 0;
    }
  }

  else if (page == 43) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (dolphin == 2) {
        page = 44;
      } 
      else if (mouse == 3) {
        page = 45;
      } 
      else {
        page = 49;
      }
    }
  }

  else if (page == 44) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 46;
    }
  }

  else if (page == 45) {
    if ((mouseX >= 295) && (mouseX <= 470) && (mouseY >= 70) && (mouseY <= 280)) {
      page = 47;
    }
  }

  else if (page == 46) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (mouse == 3) {
        page = 45;
      } 
      else {
        page = 49;
      }
    }
  }

  else if (page == 47) {
    if ((mouseX >= 315) && (mouseX <= 380) && (mouseY >= 110) && (mouseY <= 430)) {
      page = 41;
    }
  }

  else if (page == 48) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      if (damage >= 3) {
        page = 41;
      } 
      else {
        page = 42;
      }
    }
  }

  else if (page == 49) {
    if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
      party = 0;
      mouse = 0;
      fox = 0;
      boar = 0;
      dolphin = 0;
      foxEncounter01 = 0;
      foxEncounter02 = 0;
      foxEncounter03 = 0;
      deadFox = 0;
      foxParty = 0;
      boarEncounter = 0;
      dolphinEncounter = 0;
      humanEncounter = 0;
      damage = 0;
      page = 0;
    }
  }

  else if (page == 50) {
    if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {
      page = 8;
    }
    else if (overButton (b3ax,b3ay, b3aw,b3ah) == true) {
      page = 5;
    }
  }


  else if (page == 51) {
    foxEncounter04 = 1;
    if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {
      page = 23;
    }
    else if (overButton (b3ax,b3ay, b3aw,b3ah) == true) {
      fox ++;
      if (fox >= 3) {
        party ++;
        deadFox = 1;
        foxParty = 1;
        page = 24;
      } 
      else {
        page = 1;
      }
    }
  }

  else if (page == 52) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 1;
    }
  }
  else if (page == 53) {
    if (overButton (b1ax,b1ay, b1aw,b1ah) == true) {
      page = 43;
    }
  }
}

//  Button Boolean----------------------------------------
boolean overButton (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } 
  else {
    return false;
  }
}

//  Page Functions----------------------------------------
void pageZero () {
  shape (backgroundCover, 0,0);
  if ((mouseX >= 320) && (mouseX <= 565) && (mouseY >= 205) && (mouseY <= 290)) {
    noCursor ();
    fill (255);
    textSize (70);
    text ("Æsop's Fables", width/2-20,height/2);
    textSize (52);
    text ("- The Lion's Story -", width/2-5,280);
    image (lionMouse01, mouseX-50,mouseY-35);
  } 
  else {
    cursor (CROSS);
    fill (0);
    textSize (60);
    text ("Æsop's Fables", width/2,height/2);
    textSize (42);
    text ("- The Lion's Story -", width/2,280);
  }
}

void pageOne () {
  shape (backgroundScreen01, 0,0);
  noCursor ();
  fill (0);
  textSize (48);
  text ("What would you like to do today?", 20,40);
  textSize (30);
  if ((mouseX >= 0) && (mouseX <= (width/4))) {  //  Left Button
    text ("Go take a nap in the grass", 65,380, 230,75);  
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else if ((mouseX >= (width/4*3)) && (mouseX <= width)) {  //  Right Button 
    text ("Go wander around", 400,380, 230,75);
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else {
    image (lionMouse01, mouseX-50,mouseY-35);
  }
}

void pageTwo () {
  shape (backgroundGrass02, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You decide to take a nice, long nap in the grass...",20,30, 600,100);
  text ("...Until you are abruptly awakened by something...", 20,380, 640,100);
}

void pageThree () {
  shape (backgroundGrass, 0,0);
  cursor (CROSS);
  image (encounterMouse, 210,100);
  fill (0);
  textSize (48);
  text ("A wild MOUSE appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild MOUSE appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterMouse, 210,100);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (letGo, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (letGo, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (letGo, 370,345);
  }
}

void pageFour () {
  shape (backgroundGrass, 0,0);
  cursor (CROSS);
  image (encounterFox, 190,100);
  fill (0);
  textSize (48);
  text ("A wild FOX appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild FOX appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterFox, 190,100);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (letGo, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (letGo, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (letGo, 370,345);
  }
}

void pageFive () {
  shape (backgroundGrass02, 0,0);
  cursor (CROSS);
  image (lionLove, 175,75);
  for (int i = -490; i <= width; i += 45) {
    stroke (0);
    strokeWeight (3);
    line (i,0, i + 500,height);
    line (i + 500, 0,i,height);
  }
  fill (255);
  textSize (48);
  text ("You get caught in a hunter's trap!  Crap!", 20,30, 600,100);
}

void pageSix () {
  background (0);
  cursor (CROSS);
  image (lionGameOver, 155,145);
  fill (255);
  textSize (48);
  text ("The hunter comes to claim his kill.", 20,30);
  if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
    pushMatrix ();
    translate (100,340);
    scale (1.2);
    shape (gameOver, 0,0);
    popMatrix ();
  } 
  else {
    shape (gameOver, 150,350);
  }
}

void pageSeven () {
  shape (backgroundParty, 0,0);
  cursor (CROSS);
  image (encounterMouse, 260,140);
  image (mouseMoral, 20,280);
  fill (0);
  textSize (48);
  text ("The MOUSE you saved earlier comes to your rescue!", 20,30,600,100);
  text ("The MOUSE joins your party!", 230,450);
}

void pageEight () {
  shape (backgroundGrass02, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You decide to sleep longer", 20,30);
  if (deadFox == 0) {
    text ("But it wasn't long before your nap was interrupted a second time", 20,380,640,100);
  }
}

void pageNine () {
  shape (backgroundGrass02, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You slept in the grass", 20,30);
}

void pageTen () {
  shape (backgroundWhereToGo, 0,0);
  noCursor ();
  fill (0);
  textSize (48);
  text ("Hmm, where to go?", 20,40);
  if ((mouseX >= 400) && (mouseX <= 530) && (mouseY >= 70) && (mouseY <= 170)) {  //  RIVER Button
    shape (seashore, 100,210);
    shape (town, 380,280);
    pushMatrix ();
    translate (380,60);
    scale (1.4);
    shape (river,0,0);
    popMatrix ();
    shape (textRiver, 410,180);
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else if ((mouseX >= 100) && (mouseX <= 240) && (mouseY >= 210) && (mouseY <= 300)) {  //  SEASHORE Button   
    shape (town, 380,280);
    shape (river, 400,70);
    pushMatrix ();
    translate (80,200);
    scale (1.4);
    shape (seashore,0,0);
    popMatrix ();
    shape (textSeashore, 100,305);
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else if ((mouseX >= 380) && (mouseX <= 510) && (mouseY >= 280) && (mouseY <= 400)) {  //  TOWN Button   
    shape (river, 400,70);
    shape (seashore, 100,210);
    pushMatrix ();
    translate (360,270);
    scale (1.4);
    shape (town,0,0);
    popMatrix ();
    shape (textTown, 385,420);
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else {
    shape (river, 400,70);
    shape (seashore, 100,210);
    shape (town, 380,280);
    image (lionMouse01, mouseX-50,mouseY-35);
  }
}

void pageEleven () {
  shape (backgroundRiver, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You decide to go get a drink at the RIVER", 20,30);
  if (boarEncounter == 0) {
    text ("Just as you are about to drink, something comes and cuts you off", 20,380,640,100);
  }
}

void pageTwelve () {
  shape (backgroundSeashore02, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You decide to go take a walk on the SEASHORE", 20,30, 600,100);
  if (dolphinEncounter == 0) {
    text ("You hear a voice calling to you from the ocean, suggesting you and he form an alliance", 20,340,640,100);
  }
}

void pageThirteen () {
  shape (backgroundGrass, 0,0);
  cursor (CROSS);
  image (encounterBoar, 190,100);
  fill (0);
  textSize (48);
  text ("A wild BOAR appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild BOAR appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterBoar, 190,100);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (compromise, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (compromise, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (compromise, 370,345);
  }
}

void pageFourteen () {
  shape (backgroundRiver, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("No interceptors this time--", 20,30);
  if ((foxEncounter02 == 0) && (deadFox == 0)) {
    text ("Or so you thought...  You hear some rustling in the bushes", 20,380, 600,200);
  } 
  else {
    text ("you happily drink water from the RIVER", 20,380);
  }
}

void pageFifteen () {  
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  image (lionAttack02, 65,190);
  image (encounterBoar, 375,70);
  fill (0);
  textSize (48);
  text ("You attack the BOAR!", 20,30);
}

void pageSixteen () {
  background (0);
  cursor (CROSS);
  image (lionGameOver, 200,145);
  fill (255);
  textSize (48);
  text ("You both dehydrate get eaten by nearby vultures!", 20,30, 600,100);
  image (boarMoral, 20,240);
  if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
    pushMatrix ();
    translate (100,340);
    scale (1.2);
    shape (gameOver, 0,0);
    popMatrix ();
  } 
  else {
    shape (gameOver, 150,350);
  }
}

void pageSeventeen () {
  background (0);
  cursor (CROSS);
  image (lionGameOver, 155,145);
  fill (255);
  textSize (48);
  text ("Too late for compromise-- you are both too weak to fight off the vultures!", 20,30, 600,100);
  image (boarMoral, 20,280);
  if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
    pushMatrix ();
    translate (100,340);
    scale (1.2);
    shape (gameOver, 0,0);
    popMatrix ();
  } 
  else {
    shape (gameOver, 150,350);
  }
}

void pageEighteen () {
  shape (backgroundParty, 0,0);
  cursor (CROSS);
  image (encounterBoar, 350,150);
  image (compromiseMoral, 20,280);
  fill (0);
  textSize (48);
  text ("You compromise with the BOAR to take turns and drink", 20,30, 600,100);
  text ("Now that's what I call a civil animal!", 20,120, 600,100);
  text ("The BOAR joins your party!", 250,450);
}

void pageNineteen () {
  shape (backgroundGrass, 0,0);
  cursor (CROSS);
  image (encounterFox, 190,100);
  fill (0);
  textSize (48);
  text ("A wild FOX appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild FOX appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterFox, 190,100);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (letGo, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (letGo, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (letGo, 370,345);
  }
}

void pageTwenty () {  
  background (0);
  cursor (CROSS);
  image (lionGameOver, 220,145);
  fill (255);
  textSize (48);
  text ("You miss the DOLPHIN and jump straight into the ocean and drown!", 20,30, 600,100);
  image (dolphinMoral, 20,200);
  if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
    pushMatrix ();
    translate (100,340);
    scale (1.2);
    shape (gameOver, 0,0);
    popMatrix ();
  } 
  else {
    shape (gameOver, 150,350);
  }
}

void pageTwentyOne () {
  shape (backgroundSeashore, 0,0);
  cursor (CROSS);
  image (encounterDolphin, 180,130);
  fill (0);
  textSize (48);
  text ("A wild DOLPHIN appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild DOLPHIN appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterDolphin, 180,130);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (formPact, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (formPact, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (formPact, 370,345);
  }
}


void pageTwentyTwo () {  
  background (colorRed);  
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  image (lionAttack02, 65,190);
  image (encounterDolphin, 300,70);
  fill (0);
  textSize (48);
  text ("You attack the DOLPHIN!", 20,30);
}

void pageTwentyThree () {  
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  pushMatrix ();
  translate (50,75);
  scale (1.5);
  image (lionAttack01, 0,0);
  popMatrix ();
  fill (0);
  textSize (48);
  text ("You attack the FOX!", 20,30);
}

void pageTwentyFour () {
  shape (backgroundParty, 0,0);
  cursor (CROSS);
  image (encounterFox, 260,140);
  image (foxMoral, 20,240);
  fill (0);
  textSize (48);
  text ("After several encounters, the FOX grew fond of you!", 20,30, 600,100);
  text ("The FOX joins your party!", 180,450);
}

void pageTwentyFive () {  
shape (backgroundSeashore02, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("Too late for compromise-- the DOLPHIN is fed up with you and swims away!", 20,30, 600,100);
}

void pageTwentySix () {
  shape (backgroundParty, 0,0);
  cursor (CROSS);
  image (encounterDolphin, 260,140);
  image (compromiseMoral, 20,240);
  fill (0);
  textSize (48);
  text ("You agree to ally the DOLPHIN", 20,30, 600,100);
  text ("The DOLPHIN joins your party!", 180,450);
}

void pageTwentySeven() {
  shape (backgroundGrass, 0,0);
  cursor (CROSS);
  image (encounterFox, 190,100);
  fill (0);
  textSize (48);
  text ("A wild FOX appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild FOX appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterFox, 190,100);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (letGo, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (letGo, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (letGo, 370,345);
  }
}

void pageTwentyNine () {    
  shape (backgroundTown, 0,0);
  cursor (CROSS);
  if ((mouseX >= 210) && (mouseX <= 290) && (mouseY >= 100) && (mouseY <= 415)) {
    pushMatrix ();
    translate (200,90);
    scale (1.2);
    image (encounterHuman, 0,0);
    popMatrix ();
  }
  else {
    image (encounterHuman, 210,100);
  }
}

void pageThirty () {
  cursor (CROSS);
  shape (backgroundPink, 0,0);
  pushMatrix ();
  translate (75,75);
  scale (1.75);
  image (lionLove, 0,0);
  popMatrix ();
  if ((mouseX >= 455) && (mouseX <= 575) && (mouseY >= 60) && (mouseY <=170)) {
    shape (heart, 405,15, 200,200);
  } 
  else {
    shape (heart, 450,50);
  }
}

void pageThirtyOne () {
  shape (backgroundHouse, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You follow her back to her house, and ask the WOODCUTTER for her hand in marriage", 20,30, 600,300);
}

void pageThirtyTwo () {
  background (0);
  cursor (CROSS);
  fill (255);
  pushMatrix ();
  translate (20,80);
  scale (1.5);
  image (woodcutter, 0,0);
  popMatrix ();
  textSize (48);
  text ("He agrees to let you marry her under the condition of him clipping your claws and extracting your teeth", 290,30, 340,height);
}

void pageThirtyThree () {  
  shape (backgroundHouse, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("What to do?", 20,40);
  textSize (30);
  if ((mouseX >= 290) && (mouseX <= 365) && (mouseY >= 130) && (mouseY <= 440)) {  //  Agree to terms
    pushMatrix ();
    translate (270,100);
    scale (1.2);
    image (encounterHuman, 0,0);
    popMatrix ();
    image (woodcutter, 460,190);
    shape (doorClosed, 20,115);
    text ("Agree to TERMS", 310,45);
  } 
  else if ((mouseX >= 485) && (mouseX <= 580) && (mouseY >= 220) && (mouseY <= 430)) {  //  Attack WOODCUTTER
    pushMatrix ();
    translate (440,170);
    scale (1.2);
    image (woodcutter, 0,0);
    popMatrix ();
    image (encounterHuman, 275,120);
    shape (doorClosed, 20,115);
    text ("Attack WOODCUTTER", 405,95);
  } 
  else if ((mouseX >= 35) && (mouseX <= 175) && (mouseY >= 120) && (mouseY <= 395)) {  //  Back
    shape (doorOpen, 20,120);
    image (woodcutter, 460,190);
    image (encounterHuman, 275,120);
    text ("Come back later", 20,430);
  } 
  else {
    image (woodcutter, 460,190);
    image (encounterHuman, 275,120);
    shape (doorClosed, 20,115);
  }
}

void pageThirtyFour () {
  shape (backgroundHouse, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You swallow the terms the WOODCUTTER gives you", 20,30, 600,100);
  text ("Your claws are cut, your teeth extracted", 20,400);
}

void pageThirtyFive () {
  background (0);
  image (woodcutterGrin, 0,60);
  fill (255);
  textSize (48);
  text ("The WOODCUTTER tricked you!  He comes running towards you with scissors!", 320,60, 340,400);
}

void pageThirtySix () {  
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  image (encounterMouse, 65,190);
  image (woodcutter, 375,70);
  fill (0);
  textSize (48);
  text ("MOUSE ATTACKS!", 20,30);
}

void pageThirtySeven () {
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  image (encounterBoar, 65,190);
  image (woodcutter, 375,70);
  fill (0);
  textSize (48);
  text ("BOAR ATTACKS!", 20,30);
}


void pageThirtyEight () {
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  image (encounterFox, 65,190);
  image (woodcutter, 375,70);
  fill (0);
  textSize (48);
  text ("FOX ATTACKS!", 20,30);
}

void pageThirtyNine () {
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  pushMatrix ();
  translate (50,75);
  scale (1.5);
  image (lionAttack01, 0,0);
  popMatrix ();
  fill (0);
  textSize (48);
  text ("You attack the  MOUSE!", 20,30);
}

void pageFourty () {
  shape (backgroundSeashore, 0,0);
  cursor (CROSS);
  image (encounterDolphin, 180,130);
  image (dolphinMoral, 20,240);
  fill (0);
  textSize (48);
  text ("DOLPHIN can't attack on land!", 20,30);
}

void pageFourtyOne () {
  int randomHeartX = int (random (-40, width-100));
  int randomHeartY = int (random (-40, height-100));
  if (randomHeartX % 4 == 0) {
    float randomHeartScale = random (50,200);
    shape (heart, randomHeartX,randomHeartY, randomHeartScale,randomHeartScale);
  }
  image (lionLove02, -180,230);
  image (humanBig, 400,100);
  fill (255);
  textSize (60);
  text ("Happy End :)", 180,400);
}

void pageFourtyTwo () {  
  background (0);
  cursor (CROSS);
  image (lionGameOver, 155,85);
  fill (255);
  textSize (48);
  text ("The WOODCUTTER kills you!", 20,30);
  text ("Maybe if you had made some allies?", 20,370);
  if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
    pushMatrix ();
    translate (100,340);
    scale (1.2);
    shape (gameOver, 0,0);
    popMatrix ();
  } 
  else {
    shape (gameOver, 150,350);
  }
}

void pageFourtyThree () {
  background (0);
  cursor (CROSS);
  image (humanSad, 110,120);
  fill (255);
  textSize (48);
  text (". . .", 360,180);
}

void pageFourtyFour () {
  background (0);
  cursor (CROSS);
  image (lionLove02, -180,230);
  fill (255);
  textSize (48);
  text ("...Shit", 40,50);
  text ("You call to the DOLPHIN for help", 150,190);
}

void pageFourtyFive () {
  background (255);
  cursor (CROSS);
  if ((mouseX >= 295) && (mouseX <= 470) && (mouseY >= 70) && (mouseY <= 280)) {
    shape (flower, 180,0, 370,450);
  } 
  else {
    shape (flower, 210,45);
  }
  image (encounterMouse, 60,200);
}

void pageFourtySix () {
  shape (backgroundSeashore, 0,0);
  cursor (CROSS);
  image (encounterDolphin, 180,130);
  image (dolphinMoral, 20,240);
  fill (0);
  textSize (48);
  text ("DOLPHIN can't attack on land!", 20,30);
}

void pageFourtySeven () {
  shape (backgroundPink, 0,0);
  noCursor ();
  shape (flower, mouseX - 50, mouseY - 50, 90,100);
  if ((mouseX >= 315) && (mouseX <= 380) && (mouseY >= 110) && (mouseY <= 430)) {
    image (encounterHuman, 290,85, 110, 410);
  } 
  else {
    image (encounterHuman, 300,100);
  }
}

void pageFourtyEight () {
  background (0);
  cursor (CROSS);
  image (woodcutter, 175,100,300,600);
  fill (255);
  textSize (48);
  text (". . .", 75,175);
}

void pageFourtyNine () {  
  background (0);
  cursor (CROSS);
  image (lionGameOver, 155,145);
  fill (255);
  textSize (48);
  text ("The HUMAN hates you!  You die of a broken heart :(", 20,30, 600,100);
  if ((mouseX >= 160) && (mouseX <= 635) && (mouseY >= 375) && (mouseY <= 440)) {
    pushMatrix ();
    translate (100,340);
    scale (1.2);
    shape (gameOver, 0,0);
    popMatrix ();
  } 
  else {
    shape (gameOver, 150,350);
  }
}

void pageFifty () {    
  shape (backgroundGrass02, 0,0);
  noCursor ();
  fill (0);
  textSize (48);
  text ("Continue to sleep?", 20,30);
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button (yes)
    shape (walkAround, 370,350);
    pushMatrix ();
    translate (90,340);
    scale (1.2);
    shape (yes,0,0);
    popMatrix ();
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button (walkAround)
    shape (yes,100,350);
    pushMatrix ();
    translate (340,340);
    scale (1.2);
    shape (walkAround,0,0);
    popMatrix ();
    image (lionMouse02, mouseX-50,mouseY-35);
  } 
  else {
    shape (yes,100,350);
    shape (walkAround, 370,350);
    image (lionMouse01, mouseX-50,mouseY-35);
  }
}

void pageFiftyOne () {
  shape (backgroundGrass, 0,0);
  cursor (CROSS);
  image (encounterFox, 190,100);
  fill (0);
  textSize (48);
  text ("A wild FOX appeared!", 460,40, 160,200); 
  if (overButton (b2ax,b2ay, b2aw, b2ah) == true) {  //  Left Button
    background (colorRed);
    fill (0);
    textSize (48);
    text ("A wild FOX appeared!", 460,40, 160,200); 
    shape (encounterFlash, 0,0);
    image (encounterFox, 190,100);
    pushMatrix ();
    translate (50,310);
    scale (1.2);
    shape (attack,0,0);
    popMatrix ();
    shape (letGo, 370,345);
  } 
  else if (overButton (b3ax,b3ay, b3aw, b3ah) == true) {  //  Right Button
    shape (peace, 410,330);
    shape (letGo, 370,345);
    shape (attack,60,320);
  }  
  else {
    shape (attack,60,320);
    shape (letGo, 370,345);
  }
}

void pageFiftyTwo () {
  shape (backgroundSeashore02, 0,0);
  cursor (CROSS);
  fill (0);
  textSize (48);
  text ("You take a walk on the SEASHORE", 20,30);
}

void pageFiftyThree () {
  background (colorRed);
  cursor (CROSS);
  shape (encounterFlash, 0,0);
  image (lionAttack02, 65,190);
  image (woodcutter, 375,70);
  fill (0);
  textSize (48);
  text ("You attack the WOODCUTTER!", 20,40);
}



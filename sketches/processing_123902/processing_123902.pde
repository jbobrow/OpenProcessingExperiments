
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/34042*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
import fingertracker.*;
import SimpleOpenNI.*;
int userscore=0;
int computerscore=0;
int gamenum=0;
int fcount;
float bx;
float by;
float bxm;
float bym;
float my;
float ky;
float ranx;
float rany;
float br=0;
float bg=0;
float bb=0;
float bra=0;
float bga=0;
float bba=0;
float ba=255;
float bottomb;
float topb;
float ty=0;
float tym=5;
float g=.2;
float rg=.2;
float lg=.2;
float cpy=0;
float difficulty=8;
float timer=0;
float endtimer=0;
float gameon=0;
FingerTracker fingers;
SimpleOpenNI kinect;
int threshold = 625;

void setup() {
  size(640, 480);
  frameRate(30);

  PFont font;
  font=loadFont("VisitorTT1BRK-48.vlw");
  textFont(font, 75);
  textAlign(CENTER);

  //    orientation(LANDSCAPE);
  bxm=random(5, 7);
  bym=random(0, 2);
  bx=width/2;
  by=height/2;
  noStroke();
  topb=0;
  bottomb=height;
  //kinect setup
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.setMirror(true);
  fingers = new FingerTracker(this, 640, 480);
  fingers.setMeltFactor(120);
}



void draw() {
  if (gameon==0) {
    difficulty=1;
    my=my+(by-my)/difficulty;
  }
  if (gameon==2) {
    difficulty=1;
    my=my+(by-my)/difficulty;
  }

  textSize(50);

  //variable workings
  bx=bx+bxm;
  by=by+bym;




  ranx=random(0, 2);
  rany=random(0, 2);
  br=br+bra;
  bg=bg+bga;
  bb=bb+bba;
  cpy=cpy+(by-cpy)/difficulty;//HEre IS WHERE THE DIFFICULTY IS




  //background
  fill(br, bg, bb, ba);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);
  fill(255);
  if (gameon==1) {
    //fetch kinect fingers and update my
    kinect.update();
    PImage depthImage = kinect.depthImage();
    fingers.setThreshold(threshold);
    int[] depthMap = kinect.depthMap();
    fingers.update(depthMap);
    fcount = fingers.getNumFingers();
    if (fcount > 3 && fcount < 6) {
      ky = 0;
      for (int i = 0; i < fcount; i++) {
        PVector position = fingers.getFinger(i);
        ellipse(position.x - 5, position.y -5, 10, 10);
        ky += position.array()[1];
      }
      my = ((ky/fcount)+(2*my))/3;
    }
  }


  //rules screen
  if (gameon==2) {
    fill(0);
    textSize(18);
    rect(width/2, height/2, width, height);
    fill(255);
    stroke(255);
    text("Control the left paddle with your mouse", width/2, height*.2);
    text("every time you score the enemy's paddle gets quicker", width/2, height*.4);
    text("every time you win a game a new variable is added", width/2, height*.6);
    text("these variables can range from extra paddles to gravity", width/2, height*.8);
    textSize(50);
    stroke(255);
    line(50, 50, 120, 50);
    line(50, 50, 75, 40);
    line(50, 50, 75, 60);
    if (mouseX>45) {
      if (mouseX<125) {
        if (mouseY>35) {
          if (mouseY<65) {
            if (mousePressed) {      //COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  
              gameon=0;
            }
          }
        }
      }
    }
  }




  //Menu words
  if (gameon==0) {
    text("Play", width/2-150, height/2);
    text("Rules", width/2+165, height/2);
  }

  //"play" button
  if (mouseX<width/2-150+75) {
    if (mouseX>width/2-150-75) {
      if (mouseY<height/2+10) {   
        if (mouseY>height/2-35) { 
          if (mousePressed) {//COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE   
            gameon=1;
            difficulty=8;
            bx=width/2;
            by=height/2;
            bxm=random(5, 7);
            bym=random(0, 2);
          }
        }
      }
    }
  }


  //"rules" button
  if (mouseX<width/2+165+80) {
    if (mouseX>width/2+165-80) {
      if (mouseY<height/2+10) {   
        if (mouseY>height/2-35) { 
          if (mousePressed) {//COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  COMPATIBILITY CHANGE HERE  
            gameon=2;
          }
        }
      }
    }
  }



  //score board
  text(userscore, width/2-40, 70);
  text(computerscore, width/2+50, 70);

  //net decoration
  if (gameon<2) {
    for (int nety=0;nety<height+50;nety=nety+20) {
      rect(width/2, nety, 10, 10);
    }
  }

  //when computer scores
  if (bx<0) {
    computerscore++;
    if (gamenum<3) {
      bx=width/2;
      by=height/2;
      bxm=random(5, 7);
      bym=random(0, 2);
    }
    if (gamenum>3) {
      bx=width/2;
      by=height/2;
      bxm=random(5, 7);
      bym=random(0, 2);
    }
    if (gamenum==3) {
      bx=width/2;
      by=height/2;
      bxm=random(5, 7);
      bym=-4;
    }
  }
  //when user new way scores
  if (bx>width) {
    userscore++;
    difficulty=difficulty-.4;
    if (gamenum<3) {
      bx=width/2;
      by=height/2;
      bxm=random(5, 7);
      bym=random(0, 2);
    }
    if (gamenum>3) {
      bx=width/2;
      by=height/2;
      bxm=random(5, 7);
      bym=random(0, 2);
    }
    if (gamenum==3) {
      bx=width/2;
      by=height/2;
      bxm=random(5, 7);
      bym=-4;
    }
  }
  //when user fake scores
  /*
  if (bx>width-30-7.5) {
   if (bx<width-30+7.5) {
   if (by<by+36) {
   if (by>by-36) {
   if (bxm+bym>25) {
   userscore++;
   bx=width/2;
   by=height/2;
   bxm=random(5, 7);
   bym=random(0, 2);
   }
   }
   }
   }
   }
   */

  //ball
  rect(bx, by, 12, 12);


  //paddles
  rect(30, my, 15, 60);
  rect(width-30, cpy, 15, 60);

  //user paddle bounces
  //top sweet spot
  if (bx<37.5) {
    if (bx>22.5) {
      if (by<my-15) {
        if (by>my-36) {
          bxm=-bxm;
          bym=bym-7;
          bxm=bxm+3;
        }
      }
    }
  }
  //middle spot
  if (bx<37.5) {
    if (bx>22.5) {
      if (by>my-15) {
        if (by<my+15) {
          bxm=-bxm;
        }
      }
    }
  }
  //bottom sweet spot
  if (bx<37.5) {
    if (bx>22.5) {
      if (by>my+15) {
        if (by<my+36) {
          bxm=-bxm;
          bym=bym+7;
          bxm=bxm+3;
        }
      }
    }
  }

  //right computer bounces
  if (bx>width-30-7.5) {
    if (bx<width-30+7.5) {
      if (by<cpy+36) {
        if (by>cpy-36) {
          bxm=-bxm;
          bxm=bxm-ranx;
          bym=bym+rany;
        }
      }
    }
  } 


  //game rules
  if (userscore<4) {
    br=0;
    bg=0;
    bb=0;
    ba=255;
  }
  //alpha
  if (userscore>3) {
    if (userscore<7) {
      br=0;
      bg=0;
      bb=0;
      ba=25;
    }
  }
  //strobe
  if (userscore<10) {
    if (userscore>6) {
      bra=8;
      bga=10;
      bba=12;
    }
  }
  //end game rules

  //begin mode changes
  //game 1
  if (gamenum>0) {
    rect(bx, height-30, 60, 15);
    rect(bx, 30, 60, 15);
    bottomb=height-36;
    topb=36;
  }
  /*
  // second regular
   if (userscore==3) {
   br=0;
   bg=0;
   bb=0;
   ba=255;
   }
   //second alpha
   if (userscore==4) {
   br=0;
   bg=0;
   bb=0;
   ba=25;
   }
   //second strobe
   if (userscore==5) {
   bra=8;
   bga=10;
   bba=12; 
   }
   */

  //setting up trains for game 2+
  if (gamenum>1) {
    ty=ty+tym;
    //train reset
    if (ty>height) {
      tym=-tym;
    }
    if (ty<0) {
      tym=-tym;
    }

    fill(255);

    //train bounces
    if (bx>width/2-30-7.5) {
      if (bx<width/2-30+7.5) {
        if (by<ty+36) {
          if (by>ty-36) {
            bxm=-bxm;
          }
        }
      }
    }
    if (bx>width/2+30-7.5) {
      if (bx<width/2+30+7.5) {
        if (by<ty+36) {
          if (by>ty-36) {
            bxm=-bxm;
          }
        }
      }
    }
    rect(width/2-30, ty, 15, 60);
    rect(width/2+30, ty, 15, 60);
  }
  /*
    //third regular
   if (userscore==6) {
   br=0;
   bg=0;
   bb=0;
   ba=255;
   }
   //third alpha
   if (userscore==7) {
   br=0;
   bg=0;
   bb=0;
   ba=25;
   }
   //third strobe
   if (userscore==8) {
   bra=8;
   bga=10;
   bba=12; 
   }
   */
  //setting up first gravity for game 3
  if (gamenum==3) {
    if (userscore<12) {
      bym=bym+g;
    }
  }
  /*
      //fourth regular
   if (userscore==9) {
   br=0;
   bg=0;
   bb=0;
   ba=255;
   }
   //fourth alpha
   if (userscore==10) {
   br=0;
   bg=0;
   bb=0;
   ba=25;
   }
   //fourth strobe
   if (userscore==11) {
   bra=8;
   bga=10;
   bba=12; 
   }
   */
  //setting up second gravity for game 4
  if (gamenum==4) {
    if (bx<width/2) {
      bxm=bxm-lg;
    }
  }
  if (gamenum==4) {
    if (bx>width/2) {
      bxm=bxm+rg;
    }
  }
  /*
        //fifth regular
   if (userscore==12) {
   br=0;
   bg=0;
   bb=0;
   ba=255;
   }
   //fifth alpha
   if (userscore==13) {
   br=0;
   bg=0;
   bb=0;
   ba=25;
   }
   //fifth strobe
   if (userscore==14) {
   bra=8;
   bga=10;
   bba=12; 
   }
   */
  //when user wins game
  if (userscore>9) {
    if (gamenum<5) {
      timer++;
      if (timer<100) {
        textSize(45);
        text("Winner!", width*.25, height/2-30);
        text("(you)", width*.25, height/2+30);
        textSize(50);
      }
      if (timer>100) {
        gamenum++;
        userscore=0;
        computerscore=0;
        difficulty=8;
        bx=width/2;
        by=height/2;
        bxm=random(5, 7);
        bym=random(0, 2);
        timer=0;
      }
    }
  }
  //when computer wins game
  if (computerscore>9) {
    textSize(45);
    text("Winner!", width*.75, height/2-30);
    text("(not you)", width*.75, height/2+30);
    textSize(50);
    noLoop();
  }
  //end fade
  if (gamenum==4) {
    if (userscore>9) {
      gamenum=5;
    }
  }
  if (gamenum==5) {
    endtimer++;
    noStroke();
    fill(0);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(50);
    text("Winner!", width/2, height*.3);
    text("(you)", width/2, height*.6);
  }

  println(gamenum);



  //color resets
  if (br>255) {
    br=0;
  }
  if (bg>255) {
    bg=0;
  }
  if (bb>255) {
    bb=0;
  }
  //top and bottom bounces
  if (by>bottomb) {
    bym=-bym;
  }
  if (by<topb) {
    bym=-bym;
  }
}


//cheats
void keyReleased() {
  if (key==CODED) {
    if (keyCode==UP) {
      userscore=userscore+1;
    }
  }
}




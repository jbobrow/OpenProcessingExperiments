
PGraphics bg;

PImage mouth1;
PImage mouth2;
PImage mouth3;
PImage baby;
PImage hair1;
PImage hair2;
PImage hair3;
PImage hair4;
PImage eyelashL;
PImage eyelashR;
PImage pencil;
PImage eyeblue;
PImage eyegreen;
PImage eyeorange;
PImage eyered;
PImage eyepurple;
PImage cowhat;
PImage mic;
PImage tiara;
PImage skin0;
PImage skin1;
PImage skin2;
PImage skin3;
PImage skin4;
PImage open;
PImage intro;

int count = 100;
int stamp;
int MOUTH1 = 1;
int HAIR1 = 2;
int EYEL = 3;
int EYER = 4;
int MOUTH2 = 5;
int MOUTH3 = 6;
int PENCIL = 7;
int EYEBLUE = 8;
int EYEGREEN = 9;
int EYEORANGE = 10;
int EYERED = 11;
int EYEPURPLE = 12;
int HAIR2 = 13;
int HAIR3 = 14;
int HAIR4 = 15;
int COWHAT = 16;
int MIC = 17;
int TIARA = 18;
int SKIN0 = 19;
int SKIN1 = 20;
int SKIN2 = 21;
int SKIN3 = 22;
int SKIN4 = 23;
int REDO = 24;

void setup() { 
  size(1024, 768);

  skin0 = loadImage("skin0.png");
  skin1 = loadImage("skin1.png");
  skin2 = loadImage("skin2.png");
  skin3 = loadImage("skin3.png"); 
  skin4 = loadImage("skin4.png");  
  mouth1 = loadImage("mouth1.png");
  mouth2 = loadImage("mouth2.png");
  mouth3 = loadImage("mouth3.png");
  baby = loadImage("babyback2.png");
  hair1 = loadImage("hair1.png");
  hair2 = loadImage("hair2.png");
  hair3 = loadImage("hair3.png");
  hair4 = loadImage("hair4.png");
  eyelashL = loadImage("eyelashl.png");
  eyelashR = loadImage("eyelashr.png");
  pencil = loadImage("pencil.png");
  eyeblue = loadImage("eyeblue.png");
  eyegreen = loadImage("eyegreen.png");
  eyeorange = loadImage("eyeorange.png");
  eyered = loadImage("eyered.png");
  eyepurple = loadImage("eyepurple.png");
  cowhat = loadImage("cowhat.png");
  mic = loadImage("mic.png");
  tiara = loadImage("tiara.png");
  open = loadImage("open.png");
  intro = loadImage("intro.png");

  imageMode(CENTER);

  bg = createGraphics(width, height);
  bg.beginDraw();
  //bg.image(skin1, -5, 100);
  bg.image(skin0, -82, 0);
  bg.imageMode(CENTER);
  bg.endDraw();
}

void draw() { 
  if (count == 100) {
    image(open, 512, 384);
  }

  if (count == 101) {
    image(intro, 512 - 35, 384);
  }

  if (count == 102) {
    background(bg);

    //Pick up material
    if (mouseX > 40 && mouseX < 85 && mouseY > 40 && mouseY < 85) {
      stamp = REDO;
    }
    if (mouseX > 783 && mouseX < 863 && mouseY > 302 && mouseY < 322) {
      stamp = EYEL;
    }
    if (mouseX > 918 && mouseX < 984 && mouseY > 276 && mouseY < 302) {
      stamp = EYER;
    }
    if (mouseX > 700 && mouseX < 724 && mouseY > 64 && mouseY < 111) {
      stamp = MOUTH1;
    }
    if (mouseX > 739 && mouseX < 768 && mouseY > 93 && mouseY < 140) {
      stamp = MOUTH2;
    }
    if (mouseX > 769 && mouseX < 798 && mouseY > 51 && mouseY < 95) {
      stamp = MOUTH3;
    }
    if (mouseX > 610 && mouseX < 640 && mouseY > 40 && mouseY < 90) {
      stamp = PENCIL;
    }
    if (mouseX > 921 && mouseX < 980 && mouseY > 166 && mouseY < 188) {
      stamp = EYEBLUE;
    }
    if (mouseX > 913 && mouseX < 971 && mouseY > 137 && mouseY < 159) {
      stamp = EYEGREEN;
    }
    if (mouseX > 907 && mouseX < 965 && mouseY > 107 && mouseY < 129) {
      stamp = EYEORANGE;
    }
    if (mouseX > 898 && mouseX < 958 && mouseY > 78 && mouseY < 100) {
      stamp = EYERED;
    }
    if (mouseX > 891 && mouseX < 951 && mouseY > 48 && mouseY < 70) {
      stamp = EYEPURPLE;
    }
    if (mouseX > 884 && mouseX < 944 && mouseY > 408 && mouseY < 478) {
      stamp = HAIR1;
    }
    if (mouseX > 692 && mouseX < 772 && mouseY > 446 && mouseY < 536) {
      stamp = HAIR2;
    }
    if (mouseX > 797 && mouseX < 857 && mouseY > 431 && mouseY < 542) {
      stamp = HAIR3;
    }
    if (mouseX > 975 && mouseX < 1028 && mouseY > 388 && mouseY < 475) {
      stamp = HAIR4;
    }
    if (mouseX > 810 && mouseX < 945 && mouseY > 621 && mouseY < 690) {
      stamp = COWHAT;
    }
    if (mouseX > 947 && mouseX < 1001 && mouseY > 551 && mouseY < 659) {
      stamp = MIC;
    }
    if (mouseX > 913 && mouseX < 1020 && mouseY > 707 && mouseY < 757) {
      stamp = TIARA;
    }
    if (mouseX > 35 && mouseX < 100 && mouseY > 80 && mouseY < 145) {
      stamp = SKIN1;
    }
    if (mouseX > 35 && mouseX < 100 && mouseY > 145 && mouseY < 190) {
      stamp = SKIN2;
    }
    if (mouseX > 35 && mouseX < 100 && mouseY > 200 && mouseY < 245) {
      stamp = SKIN3;
    }
    if (mouseX > 35 && mouseX < 100 && mouseY > 245 && mouseY < 290) {
      stamp = SKIN4;
    }

    //Show object
    if (mouseX < 512) {
      if (stamp == MOUTH1) {
        image(mouth1, mouseX, mouseY);
      }
      if (stamp == MOUTH2) {
        image(mouth2, mouseX, mouseY);
      }
      if (stamp == MOUTH3) {
        image(mouth3, mouseX, mouseY);
      }
      if (stamp == HAIR1) {
        image(hair1, mouseX, mouseY);
      }
      if (stamp == HAIR2) {
        image(hair2, mouseX, mouseY);
      }
      if (stamp == HAIR3) {
        image(hair3, mouseX, mouseY);
      }
      if (stamp == HAIR4) {
        image(hair4, mouseX, mouseY);
      }
      if (stamp == EYEL) {
        image(eyelashL, mouseX, mouseY);
      }
      if (stamp == EYER) {
        image(eyelashR, mouseX, mouseY);
      }
      if (stamp == PENCIL) {
        image(pencil, mouseX, mouseY);
      }
      if (stamp == EYEBLUE) {
        image(eyeblue, mouseX, mouseY);
      }
      if (stamp == EYEGREEN) {
        image(eyegreen, mouseX, mouseY);
      }
      if (stamp == EYEORANGE) {
        image(eyeorange, mouseX, mouseY);
      }
      if (stamp == EYERED) {
        image(eyered, mouseX, mouseY);
      }
      if (stamp == EYEPURPLE) {
        image(eyepurple, mouseX, mouseY);
      }
      if (stamp == COWHAT) {
        image(cowhat, mouseX, mouseY);
      }
      if (stamp == MIC) {
        image(mic, mouseX, mouseY + 200);
      }
      if (stamp == TIARA) {
        image(tiara, mouseX, mouseY);
      }
      if (stamp == REDO) {
        image(skin0, 512 - 35, 384);
      }
      if (stamp == SKIN1) {
        image(skin1, 512 - 35, 384);
      }
      if (stamp == SKIN2) {
        image(skin2, 512 - 35, 384);
      }
      if (stamp == SKIN3) {
        image(skin3, 512 - 35, 384);
      }
      if (stamp == SKIN4) {
        image(skin4, 512 - 35, 384);
      }
    }

    if (mouseX > 512) {
      if (stamp == MOUTH1) {
        image(mouth1, mouseX, mouseY);
      }
      if (stamp == MOUTH2) {
        image(mouth2, mouseX, mouseY);
      }
      if (stamp == MOUTH3) {
        image(mouth3, mouseX, mouseY);
      }
      if (stamp == HAIR1) {
        image(hair1, mouseX, mouseY, 92, 100);
      }
      if (stamp == HAIR2) {
        image(hair2, mouseX, mouseY, 130, 182);
      }
      if (stamp == HAIR3) {
        image(hair3, mouseX, mouseY, 83, 120);
      }
      if (stamp == HAIR4) {
        image(hair4, mouseX, mouseY, 76, 97);
      }
      if (stamp == EYEL) {
        image(eyelashL, mouseX, mouseY);
      }
      if (stamp == EYER) {
        image(eyelashR, mouseX, mouseY);
      }
      if (stamp == PENCIL) {
        image(pencil, mouseX, mouseY);
      }
      if (stamp == EYEBLUE) {
        image(eyeblue, mouseX, mouseY);
      }
      if (stamp == EYEGREEN) {
        image(eyegreen, mouseX, mouseY);
      }
      if (stamp == EYEORANGE) {
        image(eyeorange, mouseX, mouseY);
      }
      if (stamp == EYERED) {
        image(eyered, mouseX, mouseY);
      }
      if (stamp == EYEPURPLE) {
        image(eyepurple, mouseX, mouseY);
      }
      if (stamp == COWHAT) {
        image(cowhat, mouseX, mouseY, 245, 140);
      }
      if (stamp == MIC) {
        image(mic, mouseX, mouseY + 200, 160, 650);
      }
      if (stamp == TIARA) {
        image(tiara, mouseX, mouseY, 165, 128);
      }
    }
  }

  //Drawing tool
  if (mouseX < 512) {
    if (mousePressed) {
      if (stamp == PENCIL) {
        bg.beginDraw();
        bg.fill(0);
        bg.ellipse(mouseX - 60, mouseY + 52, 4, 4);
        bg.endDraw();
      }

      if (mousePressed) {
        if (stamp == EYEBLUE) {
          bg.beginDraw();
          bg.noStroke();
          bg.fill(57, 82, 164);
          bg.ellipse(mouseX - 40, mouseY + 25, 10, 10);
          bg.endDraw();
        }
      }
      if (mousePressed) {
        if (stamp == EYEGREEN) {
          bg.beginDraw();
          bg.noStroke();
          bg.fill(39, 137, 66);
          bg.ellipse(mouseX - 40, mouseY + 25, 10, 10);
          bg.endDraw();
        }
      }
      if (mousePressed) {
        if (stamp == EYEORANGE) {
          bg.beginDraw();
          bg.noStroke();
          bg.fill(208, 136, 56);
          bg.ellipse(mouseX - 40, mouseY + 25, 10, 10);
          bg.endDraw();
        }
      }
      if (mousePressed) {
        if (stamp == EYERED) {
          bg.beginDraw();
          bg.noStroke();
          bg.fill(220, 31, 38);
          bg.ellipse(mouseX - 40, mouseY + 25, 10, 10);
          bg.endDraw();
        }
      }
      if (mousePressed) {
        if (stamp == EYEPURPLE) {
          bg.beginDraw();
          bg.noStroke();
          bg.fill(127, 41, 134);
          bg.ellipse(mouseX - 40, mouseY + 25, 10, 10);
          bg.endDraw();
        }
      }
    }
  }
}

void mousePressed() {

  if (mouseX < 512) {
    if (stamp == REDO) {
      bg.beginDraw();
      bg.image(skin0, 512 - 35, 384);
      bg.endDraw();
    }

    if (stamp == MOUTH1) {
      bg.beginDraw();
      bg.image(mouth1, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == MOUTH2) {
      bg.beginDraw();
      bg.image(mouth2, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == MOUTH3) {
      bg.beginDraw();
      bg.image(mouth3, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == HAIR1) {
      bg.beginDraw();
      bg.image(hair1, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == HAIR2) {
      bg.beginDraw();
      bg.image(hair2, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == HAIR3) {
      bg.beginDraw();
      bg.image(hair3, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == HAIR4) {
      bg.beginDraw();
      bg.image(hair4, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == EYEL) {
      bg.beginDraw();
      bg.image(eyelashL, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == EYER) {
      bg.beginDraw();
      bg.image(eyelashR, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == COWHAT) {
      bg.beginDraw();
      bg.image(cowhat, mouseX, mouseY);
      bg.endDraw();
    }

    if (stamp == MIC) {
      bg.beginDraw();
      bg.image(mic, mouseX, mouseY + 200);
      bg.endDraw();
    }

    if (stamp == TIARA) {
      bg.beginDraw();
      bg.image(tiara, mouseX, mouseY);
      bg.endDraw();
    }
    if (stamp == SKIN1) {
      bg.beginDraw();
      bg.image(skin1, 512 - 35, 384);
      bg.endDraw();
    }
    if (stamp == SKIN2) {
      bg.beginDraw();
      bg.image(skin2, 512 - 35, 384);
      bg.endDraw();
    }
    if (stamp == SKIN3) {
      bg.beginDraw();
      bg.image(skin3, 512 - 35, 384);
      bg.endDraw();
    }
    if (stamp == SKIN4) {
      bg.beginDraw();
      bg.image(skin4, 512 - 35, 384);
      bg.endDraw();
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    if (count == 100) {
      count++;
    }
  }
  if (key == 's') {
    if (count == 101) {
      count++;
    }
  }
}




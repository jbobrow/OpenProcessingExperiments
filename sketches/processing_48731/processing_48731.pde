
PFont font;
boolean encrypt=false;
int prx=30;
int pry;
int drx=30;
int dry;
int f=0;
int counter=0;
boolean b=false;
int en=-5;//-5 is an arbitrary # that won't be used as a keyCode
int men=-6;//-6 is also arbitrary
String fr="n/a";

void setup() {
  size(500, 500);
  background(250);
  textAlign(CENTER);
  font = loadFont("Calibri-48.vlw");
  pry=height/5+30;
  dry=height/5+30;
}

void keyReleased() {
  if (encrypt==true) {
    if (encrypt==true && keyCode!=BACKSPACE) {
      f=keyCode;
    }
    if (keyCode != BACKSPACE && encrypt==true) {
      prx+=30;
      if (prx>width-30) {
        prx=30;
        pry+=30;
      }
    }
    if (keyCode==BACKSPACE) {
      int brx=prx;
      int bry=pry;
      if (brx<30) {
        brx=width-50;
        bry-=30;
      }
      b=true;


      prx-=30;
      if (prx<30) {
        prx=width-50;
        pry-=30;
      }

      fill(250);
      noStroke();
      rectMode(CENTER);
      rect(brx, bry, 20, 20);
      rectMode(CORNER);
    }  
    else {
      b=false;
    }
  }


  if (encrypt==false) {
    if (keyCode==48) {
      en=0;
    }
    if (keyCode==49) {
      en=1;
    }
    if (keyCode==50) {
      en=2;
    }
    if (keyCode==51) {
      en=3;
    }
    if (keyCode==52) {
      en=4;
    }
    if (keyCode==53) {
      en=5;
    }
    if (keyCode==54) {
      en=6;
    }
    if (keyCode==55) {
      en=7;
    }
    if (keyCode==56) {
      en=8;
    }
    if (keyCode==57) {
      en=9;
    }


    if (keyCode>48 || keyCode<57) {
      if (men<10) {
        if (en>0) {
          if (en>0) {
            if (men!=-6) {
              men*=10;
              men+=en;
            }
            if (men==-6) {
              men=en;
            }
          }
          println(men);
        }
      }
    }
    if (keyCode==CONTROL) {
      char c1 = (char) men;//float
      fr = new String(new char[] { c1});
      println(fr);
      en=-5;
      men=-6;
    }
    if (keyCode==CONTROL) {
      drx+=30;
      if (drx>width-30) {
        drx=30;
        dry+=30;
      }
    }
  }
}


void draw() {
  if (encrypt==true && b==false) {
    fill(250);
    noStroke();
    rectMode(CENTER);
    rect(prx, pry, 20, 20);
    fill(50);
    text(int(f), prx, pry);
    rectMode(CORNER);
  }
  if(encrypt==false){
    fill(250);
    noStroke();
    rectMode(CENTER);
    rect(drx, dry, 20, 20);
    fill(50);
    text(fr,drx,dry);
    rectMode(CORNER);
  }

  if (mousePressed) {
    if (mouseX>width/2 && mouseY<height/5 && encrypt==true) {
      encrypt=false;
      prx=30;
      pry=height/5+30;
      background(250);
      f=0;
    }
    if (mouseX<width/2 && mouseY<height/5 && encrypt==false) {
      encrypt=true;
      drx=30;
      dry=height/5+30;
      background(250);
    }
  }

  if (encrypt==true) {
    fill(100, 150, 255, 200);
    rect(0, 0, width/2, height/5);
    fill(255);
    rect(width/2, 0, width/2, height/5);
  }
  if (encrypt==false) {
    fill(100, 150, 255, 200);
    rect(width/2, 0, width/2, height/5);
    fill(255);
    rect(0, 0, width/2, height/5);
  }

  noStroke();
  fill(50);
  text("ENCRYPT", width/4, height/10);
  text("DECRYPT", width*.75, height/10);
  stroke(0);
}




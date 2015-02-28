
PFont f;
String typing="";
String saved="";
int paperWidth;
int paperHeight;
int mode=0;
boolean go;
int turn;
float randomTip=random(4);
float randomBase=random(10);
float randomEdge=random(3);
int up;
int out;
boolean sides=true;
int dimension;
float scale=1.00;




void setup() {
  size(600, 600);
  f=createFont("Arial", 16, true);
  background(255);
  smooth();
  color(255);
}

void draw() {
  textFont(f);
  fill(0);
  if (go=false) {
  }
  if (go=true) {
    if (mode==0) {
      background(255);
      text("How wide is your piece of paper? Put size in inches. Whole numbers only!", 40, 40);
      text(typing, 40, 80);
      if (key=='\n') {
        paperWidth=parseInt(saved);
        go=false;
        text("Press the m key to continue", 40, 60);
        text(typing, 40, 80);
      }
    }

    if (mode==1) {
            println(mode);

      background(255);
      text("How tall is your piece of paper?", 40, 40);
      text(typing, 40, 80);

      if (key=='\n') {
        paperHeight=parseInt(saved);

        text("Press the m key to continue", 40, 60);
        text(typing, 40, 80);
        go=false;
      }
    }
    if (mode==2) {
            println(mode);

      background(255);
      text("Your paper is "+paperWidth+" by "+paperHeight, 40, 40);

      size(paperWidth/2*100, paperHeight/2*100);
      
      text("Press the m key to continue", 40, 60);
      println(":)");
    }
    if (mode==3) {
      println(mode);
      if (paperWidth>=paperHeight) {
        size(paperHeight/2*100, paperHeight/2*100);
        dimension=paperHeight/4*100;
        println("hi");
      }
      else {
        size(paperWidth/2*100, paperWidth/2*100);
        dimension=paperWidth/4*-100;
        println("bye!");
      }
      scale=(-1*dimension/250.0);
      float test=(200.0/250.0);
      println(scale);
      scale(scale);
      drawSnowflake();
    }
  }
}


//gets height from user
void keyPressed() {
  if (key == SHIFT) {
    typing=typing;
  }
  else if (key == '\n' ) {
    saved = typing;
    typing = "";
  } 
  else if (keyCode == BACKSPACE) {
    typing = typing.substring(0, typing.length() - 1);
    background(255);
  } 
  else if (key=='m') {
    go=true;
    mode=mode+1;
    saved="";
    background (255);
  }
  else {
    typing = typing + key;
  }
}

void drawSnowflake() {
  translate(250, 250);
  if (turn==0) {
    rotate(HALF_PI);
    turn=turn+1;
  }
  else if (turn==1) {
    rotate(HALF_PI+QUARTER_PI);
    turn=turn+1;
  }
  else if (turn==2) {
    rotate(PI);
    turn=turn+1;
  }
  else if (turn==3) {
    rotate(PI+QUARTER_PI);
    turn=turn+1;
  }
  else if (turn==4) {
    rotate(PI+HALF_PI);
    turn=turn+1;
  }
  else if (turn==5) {
    rotate(PI+HALF_PI+QUARTER_PI);
    turn=turn+1;
  }
  else if (turn==6) {
    rotate(QUARTER_PI);
    turn=turn+1;
  }
  leg();
}

void leg() {
  lineBase();
  int rTip=int(randomTip);
  if (rTip==0) {
    diamondTip();
  }
  else if (rTip==1) {
    plainTip();
  }
  else if (rTip==2) {
    triangleTip();
  }
  else if (rTip==3) {
    splitTip();
  }


  int rBase=int(randomBase);
  if (rBase!=9) {
    lineBase();
    sides=true;
  } 
  else if (rBase==9) {
    plainBase();
    sides=false;
  }

  int rEdge=int(randomEdge);
  if (sides) {
    if (rEdge==0) {
      circleEdge();
    }
    else if (rEdge==1) {
      diagonalEdge();
    }
    else if (rEdge==2) {
      straightEdge();
    }
  }
}

//bases
void plainBase() {
  line(-5, -12, -5, -220);
  line(5, -12, 5, -220);
}

void lineBase() {
  line(-5, -12, -5, -32);
  line(5, -12, 5, -32);
  for (up=-32; up>-200;up=up-30) {
    line(-5, up, -5, up-20);
    line(5, up, 5, up-20);
    line(-5, -212, -5, -220);
    line(5, -212, 5, -220);
  }
}

//edges

void diagonalEdge() {
  out=20;
  for (up=-32; up>-210;up=up-30) {
    line(-5, up-20, out*-1, up-30);
    line(5, up-20, out, up-30);
    line(out*-1, up-30, out*-1, up-40);
    line(out, up-30, out, up-40);
    line(-5, up-30, out*-1, up-40);
    line(5, up-30, out, up-40);
    out=out+2;
  }
}

void straightEdge() {
  out=20;
  for (up=-32; up>-210;up=up-30) {
    line(-5, up-20, out*-1, up-20);
    line(5, up-20, out, up-20);

    line(out*-1, up-30, out*-1, up-20);
    line(out, up-30, out, up-20);

    line(-5, up-30, out*-1, up-30);
    line(5, up-30, out, up-30);
    out=out+2;
  }
}

void circleEdge() {
  noFill();
  for (up=52; up<210;up=up+60) {

    arc(0, 0, up*2, up*2, 4.74, 5.47);
    arc(0, 0, up*2+20, up*2+20, 4.74, 5.47);
    line(5, up+30, 20, up+30);
    line(-5, up+30, -20, up+30);
    line(5, up+40, 20, up+40);
    line(-5, up+40, -20, up+40);
    line(20, up+40, 20, up+30);
    line(-20, up+30, -20, up+40);
  }
}

//tips

void plainTip() {
  line(-5, -220, 0, -230);
  line(5, -220, 0, -230);
}

void triangleTip() {
  line(-5, -220, -15, -220);
  line(5, -220, 15, -220);
  line(-15, -220, 0, -240);
  line(15, -220, 0, -240);
}

void diamondTip() {
  line(-5, -220, -10, -230);
  line(5, -220, 10, -230);
  line(-10, -230, 0, -245);
  line(10, -230, 0, -245);
}

void splitTip() {
  line(-5, -220, -30, -240);
  line(5, -220, 30, -240);
  line(-5, -230, -30, -250);
  line(5, -230, 30, -250);
  line(-5, -230, -5, -250);
  line(5, -230, 5, -250);
  line(5, -250, -5, -250);
  line(-30, -240, -30, -250);
  line(30, -240, 30, -250);
}


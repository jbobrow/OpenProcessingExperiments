
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer player;
boolean isPlaying  = true;

boolean test = false;

int[] lyricsPos = {
  63000, 86400, 195000, 235300, 246700
};

Button b1, b2, b3, b4, b5;

void setup() {
  size(800, 500);
  b1 = new Button(140, 370, 30, color(100), color(200), color(255, 0, 0));
  b2 = new Button(260, 400, 30, color(100), color(200), color(255, 0, 0)); 
  b3 = new Button(380, 370, 30, color(100), color(200), color(255, 0, 0));
  b4 = new Button(500, 400, 30, color(100), color(200), color(255, 0, 0));
  b5 = new Button(620, 370, 30, color(100), color(200), color(255, 0, 0));
  minim= new Minim(this);
  player = minim.loadFile("33.mp3");
  player.play();
  PImage i;
  i = loadImage("2.png");
  image(i,0,0,800,500);
  PImage a;
  a = loadImage("1.png");
  image(a,110,370,100,100);
  PImage b;
  b = loadImage("22.png");
  image(b,230,400,100,100); 
  PImage c;
  c = loadImage("3.png");
  image(c,350,370,100,100);
 PImage d;
  d = loadImage("4.png");
  image(d,470,400,100,100);
  PImage e;
  e = loadImage("5.png");
  image(e,590,370,100,100);
}
void draw() {


  //minim.stop();
  b1.display();
  b2.display();
  b3.display();
  b4.display();
  b5.display();

  //println(player.position());
  
  if (b1.isPressed()) {
    
    press(0);
   
  }
  if (b2.isPressed()) press(1);
  if (b3.isPressed()) press(2);
  if (b4.isPressed()) press(3);
  if (b5.isPressed()) press(4);
  

}



class Button 
{

  int x, y;
  int size;
  color baseCol;
  color overCol;
  color pressCol; 
  boolean over = false; 
  boolean pressed = false;
  boolean isPressed() {
    return pressed;
  }
  Button(int xp, int yp, int sz, color b, color o, color p) { 

    x=xp;
    y=yp;
    size = sz; 
    baseCol = b; 
    overCol = o; 
    pressCol = p;
  }
  void over() {
    if ((mouseX >=x ) && (mouseX <= x+size) &&
      (mouseY >= y) && (mouseY <= y+size)) {
      over = true;
    } else {
      over = false;
    }
  }
  void press() { 
    if (over) {
      pressed = true;
      test = !test;
      //println(test);
    }
  }
  void release() {
    pressed = false;
  }
  void display() { 
    if (pressed) {
      fill(pressCol);
    } else if (over) { 
      fill(overCol);
    } else {
      fill(baseCol);
    }
    noStroke();
    noFill();
    ellipse(x, y, size, size);
  }
}





void mousePressed() {

  b1.press(); 
  b2.press(); 
  b3.press();
  b4.press(); 
  b5.press();
  
/*
//make pause
  isPlaying = ! isPlaying;
  if (isPlaying) {
    player.pause();
  }
  */
}

void press(int btnNum) {
  
  /*
  int loopEnd = player.position();
  int loopBegin = lyricsPos[btnNum];
  player.setLoopPoints(loopBegin, loopEnd);
  */
  
  int pos = lyricsPos[btnNum];
 println( pos + " ,"+btnNum); 
  //player.cue(pos);
  player.play(pos);
}

void mouseReleased() {
  b1.release(); 
  b2.release(); 
  b3.release(); 
  b4.release(); 
  b5.release();
}

void mouseMoved() { 
  b1.over(); 
  b2.over(); 
  b3.over();
  b4.over();
  b5.over();
}


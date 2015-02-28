
//import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;

//boolian
//you play as julian the ghost
//it's a pun, see?

//credits
//created by kim lister
//music is Creepy Haunted Atmosphere by Akashic Records on Jamendo
//lantern ghost image from Clipart Pal

//state 1 = title screen, 2 = playing, 3 = end
int state;

//Minim minim;
//AudioPlayer music;


PImage guard_image;

//these are the characters; player and NPCs
ghost julian;
ghost stranger;
guardian guard1; //humility vs. pride
guardian guard2; //diligence vs. sloth
guardian guard3; //kindness vs. envy
guardian guard4; //charity vs. greed
guardian guard5; //temperance vs. gluttony
guardian guard6; //chastity vs. lust
guardian guard7; //patience vs. wrath

//we need a textbox for dialog
textBox dialog;

//this is which gate the player is currently trying to pass through
int gate;

//records decisions throughout game
boolean[] morals;

//black or white transitions?
int fadecolor;

//currently fading out?
boolean fadeout;

//are you listening to an NPC?
boolean talk;

//what is the NPC saying?
String message;

//guards administer Tests of Character. is there one in progress?
boolean testing;

//this is a timer used for transitions/fadetoblack/fadetowhite
int timer;

void setup() {
  
  frameRate(30);
  
  size (500,300);
  
  //minim = new Minim(this);
  
  //music = minim.loadFile("Ambience.mp3");
  
  guard_image = loadImage("guardian.png");
  
  //place characters
  julian = new ghost(width/2, height/2, 255, 4);
  stranger = new ghost(width-10, height/2, 0, 1);
  
  timer = 0; //being timing
  
  morals = new boolean[7];
  
  //place the guardians at their respective gates
  guard1= new guardian(1);
  guard2= new guardian(2);
  guard3= new guardian(3);
  guard4= new guardian(4);
  guard5= new guardian(5);
  guard6= new guardian(6);
  guard7= new guardian(7);
  
  //music.loop();
  
  state = 1; //start at title screen
}

void draw() {
  
  background(0);
  
  timer++; //keeping time
  
  switch(state) {
    
    case 1: //title screen; reset everything to start a new game!
    
    gate = 1; //start at the first gate
    
    fadeout = false; //title screen doesn't fade out
    
    testing = false;
    
    //reset moral choices
    for(int iter=0; iter<7; iter++) {
      morals[iter] = false;
    }
    
    //words
    textAlign(CENTER);
    fill(255, timer*4);
    textSize(18);
    text("boolian", width/2, height/2-22); //title is slightly above center
    textSize(14);
    text("by kim lister", width/2, height-50);
    text("use arrow keys to move", width/2, height-30);
    text("press any key to begin", width/2, height-10);
    
    if(timer>=100 && keyPressed) {
      
      //players in starting positions
      julian.setX(width/2);
      julian.setY(height/2);
      stranger.setX(width-10);
      stranger.setY(height/2);
      
      //fade in from black
      fadecolor = 0;
  
      timer = 0;
      state = 2;
    }
    
    break;
    
    /************************************************/
    
    case 2:
    
    background(127);
    
    //play the level you're on
    playgate(gate);
    
    //draw julian in
    julian.display();
    
    //the other ghost will chase julian.
    //julian must find the next guard.
    if(testing && timer>127) {
      
      stranger.display();
      
      int diffX = stranger.getX() - julian.getX();
      int diffY = stranger.getY() - julian.getY();
      if(diffX < 0) stranger.moveR(width);
      if(diffX > 0) stranger.moveL(0);
      if(diffY < 0) stranger.moveD(height);
      if(diffY > 0) stranger.moveU(0);
      
      if(julian.getX() == 10) {
        morals[gate-1] = false;
        fadeout = true;
        fadecolor = 0;
        timer = 0;
        testing = false;
      }
      if(julian.getX() == width-10) {
        morals[gate-1] = true;
        fadeout = true;
        fadecolor = 255;
        timer = 0;
        testing = false;
      }
    }
    
    if(talk) {
      dialog = new textBox(message);
      dialog.display();
    }
    
    if(timer>60) {
      if(keyPressed && key == CODED) {
        if(keyCode == UP && keyCode != DOWN) {
          julian.moveU(0);
        }
        if(keyCode == DOWN && keyCode != UP) {
          julian.moveD(height);
        }
        if(keyCode == LEFT && keyCode != RIGHT) {
          julian.moveL(0);
        }
        if(keyCode == RIGHT && keyCode != LEFT) {
          julian.moveR(width);
        }
      }
    } else if(fadeout) {
      
      //draws a fadecolor rectangle across whole screen, with more
      //opacity the larger timer is
      
      noStroke();
      fill(fadecolor,fadecolor,fadecolor,4*timer);
      rectMode(CENTER);
      rect(width/2,height/2,width,height);
      if(timer==60) {
        fadeout = false;
        timer=0;
        if(gate<7) {
          gate++;
          julian.setX(width/2);
          julian.setY(height/2);
          stranger.setX(width-10);
          stranger.setY(height/2);
        } else if(gate==7) {
          state=1;
        }
      }
      
    } else { //fading in
    
      //draws a fadecolor rectangle across whole screen, with less
      //opacity the larger timer is
      
      noStroke();
      fill(fadecolor,fadecolor,fadecolor,255-4*timer);
      rectMode(CENTER);
      rect(width/2,height/2,width,height);
      
    }
    
    break;
    
    /************************************************/
    
    case 3:
    background(0);
    //displayResults();
    if(timer>60 && keyPressed)
    {
      timer=0;
      state=4;
    }
    break;
    
    case 4:
    //show credits
    background(255);
    if(timer>60 && keyPressed)
    {
      timer=0;
      state=0;
    }
    break;
  }
}



void playgate(int level) {
  
  switch(level) {
    case 1:
    
    talk = near(julian.getX(), julian.getY(), guard1.getX(), guard1.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard1.getMessage();
    }
    
    guard1.display(guard_image);
    //
    break;
    
    /*****************************************************/
    
    case 2:
    
    talk = near(julian.getX(), julian.getY(), guard2.getX(), guard2.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard2.getMessage();
    }
    
    guard2.display(guard_image);
    //
    break;
    
    /*****************************************************/
    
    case 3:
    
    talk = near(julian.getX(), julian.getY(), guard3.getX(), guard3.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard3.getMessage();
    }
    
    guard3.display(guard_image);
    //
    break;
    
    /*****************************************************/
    
    case 4:
    
    talk = near(julian.getX(), julian.getY(), guard4.getX(), guard4.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard4.getMessage();
    }
    
    guard4.display(guard_image);
    //
    break;
    
    /*****************************************************/
    
    case 5:
    
    talk = near(julian.getX(), julian.getY(), guard5.getX(), guard5.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard5.getMessage();
    }
    
    guard5.display(guard_image);
    //
    break;
    
    /*****************************************************/
    
    case 6:
    
    talk = near(julian.getX(), julian.getY(), guard6.getX(), guard6.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard6.getMessage();
    }
    
    guard6.display(guard_image);
    //
    break;
    
    /*****************************************************/
    
    case 7:
    
    talk = near(julian.getX(), julian.getY(), guard7.getX(), guard7.getY());
    if(!testing) {
      testing = talk;
    }
    if(talk) {
      message = guard7.getMessage();
    }
    
    guard7.display(guard_image);
    //
    break;
  }
  
}

boolean near(int x1, int y1, int x2, int y2) {
  float fx1 = parseFloat(x1);
  float fy1 = parseFloat(y1);
  float fx2 = parseFloat(x2);
  float fy2 = parseFloat(y2);
  
  float distance = sqrt( (x2-x1) * (x2-x1) + (y2-y1) * (y2-y1) );
  
  return distance<30;
}




    
    
    
  
  
  
class ghost {
  
  int xco;
  int yco;
  
  int speed;
  
  int shade;
  
  ghost(int xval, int yval, int col, int sp) {
    xco = xval;
    yco = yval;
    shade = col;
    speed = sp;
  }
  
  int getX() {
    return xco;
  }
  
  int getY() {
    return yco;
  }
  
  void setX(int newX) {
    xco = newX;
  }
  
  void setY(int newY) {
    yco = newY;
  }
  
  void display() {
    //draw the ghost in their color
    fill(shade, shade, shade, 175);
    rectMode(CENTER);
    rect(xco, yco, 20, 30);
    fill(255-shade, 255-shade, 255-shade, 175);
    rect(xco-5, yco-5, 5, 5);
    rect(xco+5, yco-5, 5, 5);
  }
  
  void moveR(int bound) {
    if(xco+speed < bound-10) xco+=speed;
    else xco = bound-10;
  }
  
  void moveL(int bound) {
    if(xco-speed > bound+10) xco-=speed;
    else xco = bound+10;
  }
  
  void moveU(int bound) {
    if(yco-speed > bound+10) yco-=speed;
    else yco = bound+15;
  }
 
  void moveD(int bound) {
    if(yco+speed < bound-10) yco+=speed;
    else yco = bound-15;
  }
  
}
class guardian {
  
  int xco;
  int yco;
  
  boolean vice;
  
  String message;
  
  guardian(int gate) {
    
    xco = round(random(50, width-50));
    yco = round(random(50, height-50));
    
    switch(gate) {
      case 1:
      message = "Do you know where you are?";
      break;
      
      case 2:
      message = "Do you know WHAT you are?";
      break;
      
      case 3:
      message = "...or do you remember what you were?";
      break;
      
      case 4:
      message = "Do you remember your name, Julian?";
      break;
      
      case 5:
      message = "...and the meaning of good and evil?";
      break;
      
      case 6:
      message = "Two paths... which is the right one?";
      break;
      
      case 7:
      message = "But after all, what do you have to fear from yourself?";
      break;
      
      default:
      message = "invalid guardian";
      break;
    }
    
  }
  
  int getX() {
    return xco;
  }
  
  int getY() {
    return yco;
  }
  
  String getMessage() {
    return message;
  }
  
  void display(PImage vision) {
    imageMode(CENTER);
    image(vision, xco, yco);
  }
  
}
class textBox {
  
  String content;
  
  textBox(String txt) {
    content = txt;
  }
  
  void display() {
    noStroke();
    
    rectMode(CENTER);
    fill(0, 0, 0, 150);
    rect(width/2, 30, width-20, 40);
    
    textAlign(CENTER);
    fill(255);
    textSize(14);
    text(content, width/2, 30);
  }
}



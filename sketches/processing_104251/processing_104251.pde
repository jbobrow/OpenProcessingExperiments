
//* gezi invader by can uzun
//based on a true story


Poma myPoma;
ArrayList karanfils;
ArrayList sus;

float distance_toma;
int trees;
int cols = 9;
int rows = 4;
int cols_select;
int rows_select;
int startLoop=0;

Toma[][] tomas = new Toma[cols][rows];

Timer timer;

boolean gameOn=true;
int deadTomas=0;
int lastGuy=0;
PFont myFont;
void setup() {
  size(550, 550);
  smooth();
  newStart();
}
void newStart() {
  startLoop=millis();

  trees = 6;
  myFont=createFont("space_invaders.ttf", 10);

  
  karanfils = new ArrayList();
  sus = new ArrayList();

  myPoma = new Poma(200, 200, 200, 500, 700);

  
  for (int i=0; i< cols; i++) {
    for (int j=0; j<rows; j++) {
      tomas[i][j] = new Toma(140, 300, 300, 360, i*50, j*50, 1);
    }
  }



  timer = new Timer(350);
  timer.start();
}

void draw() {

  fill(150);
  rect(0, 0, width, height);

  fill(255);
  textAlign(LEFT);

  textFont(myFont);
  text("Gezi Invaders (c)2013-Can Uzun", 10, 20);




  myPoma.display();
  myPoma.move();





  for (int i=0; i< cols; i++) {
    for (int j=0; j<rows; j++) {
      tomas[i][j].display();
      tomas[i][j].move();
      tomas[i][j].exitStageLeft();
    }
  }



  for (int i=0; i < karanfils.size(); i++) {

    Karanfil b = (Karanfil) karanfils.get(i);
    b.display();
    b.fire();

    if (b.finished()) {
      karanfils.remove(b);
    }
    for (int k=0; k< cols; k++) {
      for (int j=0; j<rows; j++) {
        if (b.intersect(tomas[k][j])) {
          karanfils.remove(b);
          tomas[k][j].destroyed();
          deadTomas=deadTomas+1;
        }
      }
    }
  }

  for (int i=0; i < sus.size(); i++) {

    Su b = (Su) sus.get(i);
    b.display();
    b.fire();

    if ( b.intersect() ) { // If this su has hit the space ship...
      if ( trees > 0 ) { // If you have a tree to lose...
        trees--; // You now have one less tree.
        sus.remove(b); // And this su "explodes"
      }
    }

    if (b.finished()) {
      sus.remove(b);
    }
  }


  for (int i=0; i< cols; i++) {
    for (int j=0; j<rows; j++) {
      int cols_select=int(random(9));
      int rows_select=int(random(4));   
      if (timer.isFinished() && tomas[cols_select][rows_select].imaDeadToma==false) {
        sus.add(new Su(140, 300, 300, tomas[cols_select][rows_select].true_xpos, tomas[cols_select][rows_select].true_ypos, -10));
        timer.start();
      }
    }
  }

  fill(255);
  textSize(10);
  textAlign(RIGHT);
  textFont(myFont);
  text ("Trees = " + trees, width-10, 20);
  //you lose
  if (trees< 1 ) {

    fill(150);
    rect (0, 0, width, height);
    fill(255);
    textFont(myFont);
    textSize(40);
    text("Game Over", 405, 250, 225);
    textSize(10);
    text("press S to start", 325, 275, 225);
    if (keyPressed) {
      if ( key=='s' || key =='S') {
        newStart();
      }
    }
  }
  // you win
  if (deadTomas >=36) {
    fill(150);
    rect (0, 0, width, height);
    fill(255);
    textFont(myFont);
    textSize(40);
    text("You Marauder!", 450, 250, 225);
    textSize(10);
    text("press S to start", 325, 275, 225);
    if (keyPressed) {
      if ( key=='s' || key =='S') {
        newStart();
      }
    }
  }
  //restart
  if (keyPressed) {
    if ( key=='r' || key =='R') {
      newStart();
    }
  }
}
float xpos;
float ypos;





void mousePressed() 
{
  karanfils.add(new Karanfil(int(random(180, 220)), 200, 200, myPoma.xpos, 500, 10));
}




class Toma {
  color h;
  color s;
  color b;
  float a;
  float xpos;
  float true_xpos;
  float true_ypos;
  float ypos;
  float xspeed; 
  float d;
  float r;
  boolean imaDeadToma=false;



  Toma(color h_, color s_, color b_, float a_, float xpos_, float ypos_, float xspeed_) {
    h= h_;
    s= s_;
    b= b_;
    a=a_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  } 

  void display() {
    stroke(150);

    true_xpos=xpos+60;
    true_ypos=ypos+60;
    //boru
    rect(true_xpos +3, true_ypos-2.5, 2.5, 2.5);
    rect(true_xpos +3, true_ypos-5, 2.5, 2.5);
    rect(true_xpos+0.5, true_ypos-5, 2.5, 2.5);
   
    fill(h, s, b);
    h = 25;
    s = 25;
    b = 112;

    rect(true_xpos, true_ypos, 6, 6);
    rect(true_xpos +6, true_ypos, 6, 6);
    rect(true_xpos +12, true_ypos, 6, 6);
    rect(true_xpos +18, true_ypos, 6, 6);
    
    fill(255);
    rect(true_xpos-6, true_ypos+6, 6, 6);
    rect(true_xpos, true_ypos+6, 6, 6);
    rect(true_xpos +6, true_ypos+6, 6, 6);
    rect(true_xpos +12, true_ypos+6, 6, 6);
    rect(true_xpos +18, true_ypos+6, 6, 6);
    rect(true_xpos +3, true_ypos+12, 3, 3);  
    rect(true_xpos +16, true_ypos+12, 3, 3);
  }




  void move() {
    ypos = ypos + 0.1;
  } 


  void destroyed() {
    imaDeadToma=true;
  }

  void exitStageLeft() {
    if (imaDeadToma==true) {
      xpos=-2000;
      xspeed=0;
    }
  }
}

class Su {
  int h;
  int s;
  int b;
  float xpos;
  float ypos;
  float yspeed;


  Su(int temp_h, int temp_s, int temp_b, float temp_xpos, float temp_ypos, float temp_yspeed) {
    h= temp_h;
    s= temp_s;
    b= temp_b;
    xpos = temp_xpos;
    ypos = temp_ypos;
    yspeed = temp_yspeed;
  } 

  void display() {
    fill(h, s, b);
    rect(xpos, ypos, 4, 10);
  }




  void fire() {
    ypos=ypos-yspeed;
  }

  boolean finished() {

    if (ypos-yspeed < 50 || ypos-yspeed > 950) return true;
    else return false;
  }

  boolean intersect() { 
    float distance = dist(xpos, ypos, myPoma.xpos, myPoma.ypos);
    if (distance < 25) {
      return true;
    } 
    else {
      return false;
    }
  }
}


class Karanfil {
  int h;
  int s;
  int b;
  float xpos;
  float ypos;
  float yspeed;


  Karanfil(int temp_h, int temp_s, int temp_b, float temp_xpos, float temp_ypos, float temp_yspeed) {
    h= temp_h;
    s= temp_s;
    b= temp_b;
    xpos = temp_xpos;
    ypos = temp_ypos;
    yspeed = temp_yspeed;
  } 

  void display() {
    fill(h, s, b);
    rect(xpos, ypos, 4, 10);
  }




  void fire() {
    ypos=ypos-yspeed;
  }

  boolean finished() {

    if (ypos-yspeed < 50 || ypos-yspeed > 950) return true;
    else return false;
  }

  boolean intersect(Toma a) {
    float distance = dist(xpos, ypos, a.true_xpos, a.true_ypos);
    if (distance < 20) {
      return true;
    } 
    else {
      return false;
    }
  }
}





class Poma {
  
  int h;
  int s;
  int b;
  float xpos;
  float ypos;

  
  Poma(int temp_h, int temp_s, int temp_b, float temp_xpos, float temp_ypos) {
    h=temp_h;
    s=temp_s;
    b=temp_b;
    xpos=temp_xpos;
    ypos=temp_ypos;
  }

  void display() {
    stroke(150);
    fill(h, s, b);
    h =255;
    s=255;
    b=0;
    

    rect(xpos, ypos-200, 6, 6);
    rect(xpos+6, ypos-200, 6, 6);
    rect(xpos+12, ypos-200, 6, 6);
    

    rect(xpos+12, ypos+6-200, 6, 6);
    rect(xpos+6, ypos+6-200, 6, 6);
    rect(xpos, ypos+6-200, 6, 6);
    rect(xpos-3, ypos+6-200, 3, 6);

    
    rect(xpos-2-0.5, ypos+6-200-2-0.5, 2.5, 2.5); 
    rect(xpos-4-0.5-0.5, ypos+6-200-4-0.5-0.5, 2.5, 2.5);
    rect(xpos-6-0.5-0.5-0.5, ypos+6-200-6-0.5-0.5-0.5, 2.5, 2.5);    
    rect(xpos-8-0.5-0.5-0.5-0.5, ypos+6-200-8-0.5-0.5-0.5-0.5, 2.5, 2.5);
    rect(xpos-10-0.5-0.5-0.5-0.5-0.5, ypos+6-200-6-0.5-0.5-0.5, 2.5, 2.5);
    rect(xpos-12-0.5-0.5-0.5-0.5-0.5-0.5, ypos+6-200-4-0.5-0.5, 2.5, 2.5);
    rect(xpos-14-0.5-0.5-0.5-0.5-0.5-0.5-0.5, ypos+6-200-2-0.5, 2.5, 2.5);
    fill(0);
    rect(xpos-15, ypos+6-200-2.5, 5, 5); 
    
    ellipse(xpos+14, ypos+13-200, 9, 9);
    ellipse(xpos+2, ypos+14-200, 6, 6);
    fill(150);
    ellipse(xpos+14, ypos+13-200, 5, 5);
    ellipse(xpos+2, ypos+14-200, 2, 2);
  }

  void move() {
    if (keyPressed) {
      switch (keyCode) {
      case LEFT:
        xpos -= 5;
        break;
      case RIGHT:
        xpos += 5;
        break;
      }
    }       
    xpos= constrain(xpos, 0+6, width-6);
  }
}
class Timer {
  int savedTime;
  int totalTime;


  Timer(int tempTotalTime) {
    totalTime=tempTotalTime;
  } 

  void start() {
    savedTime= millis();
  }

  boolean isFinished() {
    int passedTime = millis()-savedTime-(lastGuy);

    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
} 




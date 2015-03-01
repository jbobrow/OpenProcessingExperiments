
 
//import controlP5.*;
PFont Archer;
PFont Avant;
PImage teeth;
PImage title;
PImage clock;
PImage arrow;
PImage plaque;
PImage brush;
PImage home;
PImage start;
PImage instructions;
PImage info;
PImage restart;
PImage congrats;
PImage win;
 
String time = "010";
int t;
int interval = 120;
int myState = 0;
int startMillis ;
int minutes ;
int seconds ;
int counter = 100;  // max number of plaques
ArrayList<Plaque> myPlaques;
PVector randomMotion ;
 
// to spawn along an ellipse
float ellipseCenterX = 146 ;
float ellipseCenterY = 276 ;
float ellipseWidth = 135 ;
float ellipseHeight = 180 ;
float angle ;
 
void setup() {
  size(320, 568);
 
  home = loadImage("homescreen.png");
  info = loadImage("info.png");
  instructions = loadImage("instructions.png");
  teeth=loadImage("teeth.png");
  clock=loadImage("clock.png");
  plaque=loadImage("plaque.png");
  brush=loadImage("brush.png");
  start = loadImage("start.png");
  restart = loadImage("restart.png");
  win = loadImage("win.png");
   Avant= createFont("ITC_Avant_Garde_Gothic_LT_Condensed-Bold.ttf", 400);
 
  myPlaques = new ArrayList();
 
  // spawn the plaques!!!
  for (int i = 0; i < 10; i++) {  // only adding a bit at the beginning
    myPlaques.add(new Plaque());
  }
}
 
void draw() {
 
  noStroke();
  smooth();
 
  switch(myState) {
  case 0:
    background(#ECE9E0);
    //title=loadImage("brushTimeTitle.png");
 
    //image(title, 0, 0);
    image(home, 0, 0);
 
    
    textFont(Avant, 30);
    textAlign(CENTER);
    fill(#1B374C);
    //text("Time to Brush!", width/2, height/2, 80);
 
 
 
 
    break;
 
  case 1:
    //info screen
    background(#F7E300);
 
 
    //fill(#332D31);
 
 
    image(info, 0, 0);
    textAlign(CENTER);
    textSize(32);
    //text("You should brush your teeth for at least 2 minutes every time!", 60, 40, 200, 300);
 
    break;
 
  case 2:
 
    //background(#FFF5D1);
 
    image(instructions, 0, 0);
    fill(#332D31);
    textAlign(CENTER);
    textSize(32);
    //text("You should brush three times a day, after every meal.", 60, 40, 200, 300);
 
 
 
    break;
 
 
  case 3:
    background(#1C97D2);
    image(start, 0, 0);
    fill(255);
    textAlign(CENTER);
    textSize(60);
    textLeading(65);
    text("READY TO BEGIN?", 70, 120, 200, 300);
 
 
 
    break;
 
  case 4:
    background(#FF4344);
    noCursor();
 
    image(teeth, 0, 0);
    image(clock, 0, 0);
 
    fill(#F7E300);
    textAlign(CENTER);
    textSize(55);
    text("GO!", 10, 30, 125, 200);
 
    //image(plaque, 200, 120 );
    image(brush, mouseX-60, mouseY-18);
    t = interval-int(millis()/1000);
    time = nf(t, 3);
    if (t == 0) {
      interval+=10;
    }
 
    minutes = int((millis()-startMillis % (1000*60*60)) / (1000*60)) ;
    seconds = int(((millis()-startMillis % (1000*60*60)) % (1000*60)) / 1000) ;
    String fixedSeconds ;
    if (seconds < 10) {
      fixedSeconds = "0"+seconds ;
    } else {
      fixedSeconds= ""+seconds ;
    }
 
    fill(#1B374C);
    // text(time, 260, 70);
    textSize(25);
    text(minutes+":"+fixedSeconds, 258, 83) ;
 
    //run game
    game();
 
 
    if ((minutes>=2) && (myPlaques.size() == 0)) {
      myState = 6;
    }
    //    text(myPlaques.size(), 30, 30) ;
    break;
 
 
 
  case 5:
    background(#1C97D2);
 
    image(restart, 0, 0);
    fill(255);
    textAlign(CENTER);
    textSize(60);
    textLeading(65);
    text("WANT TO TRY AGAIN?", 70, 120, 200, 350);
 
 
    break;
 
  case 6:
    background(#1C97D2);
    cursor();
    //fill(255);
 
    image(win, 0, 0);
    textAlign(CENTER);
    textSize(32);
    //text("Good Job!", width/2, height/2);
  }
}
 
void mouseReleased() {
 
  cursor();
  switch(myState) {
  case 0 :
  case 1 :
  case 2 :
    myState = myState + 1;
    break ;
 
  case 3 :
    myState = myState + 1;
    startMillis = millis() ;
    break ;
 
  case 4:
 
 
    myState = myState + 1 ;
    break ;
 
  case 5:
 
 
  case 6:
    myState = 0;
    myPlaques.clear();
 
    for (int i = 0; i < 10; i++) {  // only adding a bit at the beginning
      myPlaques.add(new Plaque());
    }
    break ;
  }
 
 
  /* if (myState == 4) {
   startMillis = millis() ;
   noCursor();
   // spawn
   }
    
    
   if ((myState == 5) || (myState == 6)) {
   myState = 0;
   myPlaques.clear();
   for (int i = 0; i < counter; i++) {
   myPlaques.add(new Plaque());
   }
   }
   */
}
 
/*void mouseClicked() {
 if ((myState==0 ) && (mouseX > 150) && (mouseX < 230) && (mouseY > 350) && (mouseY < 410)) {
 myState=1;
 }
  
 if ((myState==0 ) && (mouseX > 300) && (mouseX < 380) && (mouseY > 350) && (mouseY < 410)) {
 myState=2;
 }
  
 if ((myState!=0 ) && (mouseX > 200) && (mouseX < 280) && (mouseY > 350) && (mouseY < 410)) {
 myState=0;
 }
  
 //myState= (myState+1) % 3;
 }*/
class Plaque {
 
  //attributes
  PVector location;
  PVector velocity;
  //color myColor;
  float wide ;
  boolean alive;
 
 
  //constructors
  Plaque() {
    location = new PVector() ;
 
    angle = random(TWO_PI);
    location.x = ellipseCenterX+cos(angle) * random(ellipseWidth-40, ellipseWidth);
    location.y = ellipseCenterY+sin(angle) * random(ellipseHeight-40, ellipseHeight);
 
    velocity = new PVector (random(-2, 2), random(-2, 2));
    //myColor = color(random(255), random(255), random(255));
    wide = random(20, 40);
    alive = true;
  }
 
  //methods
  void display() {  //how it looks
    //fill(myColor);
    image(plaque, location.x, location.y, wide, 25);
  }
 
  void respawn() {
    // respawn
    angle = random(TWO_PI);
    location.x = ellipseCenterX+cos(angle) * random(ellipseWidth-40, ellipseWidth);
    location.y = ellipseCenterY+sin(angle) * random(ellipseHeight-40, ellipseHeight);
 
    alive=true;
  }
 
  void drive() {
    //location.add(velocity);
    randomMotion = new PVector(random(-2, 2), random(-2, 2)) ;
    location.add(randomMotion) ;
 
    // if the plaque is not over the circle, we want it to be back in the circle
    if ((overCircle(location.x, location.y, ellipseWidth, ellipseHeight) ) && (!(overCircle(location.x, location.y, ellipseWidth-40, ellipseHeight-40)))) {
 
      // do nothing, we're ok
    } else {
 
      // respawn
      angle = random(TWO_PI);
      location.x = ellipseCenterX+cos(angle) * random(ellipseWidth-40, ellipseWidth);
      location.y = ellipseCenterY+sin(angle) * random(ellipseHeight-40, ellipseHeight); // random(ellipseHeight);//random 'lengths' vertically
    }
  }
}
 
 
 
boolean overCircle(float x, float y, float rx, float ry) {  // should be called overEllipse...
 
  //center of donut
  float disX = ellipseCenterX - x;
  float disY = ellipseCenterY - y;
 
  //ellipse equation
 
  if (sqrt((sq(disX))/(sq(rx)) + (sq(disY))/(sq(ry))) < 1 ) {
 
    return true;
  } else {
    return false;
  }
}
 
void game() {
   
  // decide if we want to add more plaques
  if ((myPlaques.size() < counter) && (random(80)>1) && (minutes < 2)) {
    // add a new plaque
    myPlaques.add(new Plaque());
  }
 
  //iterate thru Plaque array
  for (Plaque myPlaque : myPlaques) {
    myPlaque.display();
    myPlaque.drive();
 
    //test distance of Plaque to frog
    PVector brushlocation=new PVector(mouseX-60,mouseY);
    float d = (myPlaque.location).dist(brushlocation);
 
    if (d < 20) {
     // println("boom!");
      //score++;
      myPlaque.alive = false;
    }
  }
 
  //iterate thru Plaque array and delete dead Plaques
 
  for (int i = 0; i < myPlaques.size (); i++) {
    Plaque thisPlaque = (Plaque)myPlaques.get(i);
    if (thisPlaque.alive==false) {
       
    if (minutes >= 2) {
      myPlaques.remove(i);
   } else {
     thisPlaque.respawn() ;
   }
       
    }
  }
   
   
}


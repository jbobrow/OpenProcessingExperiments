
/*
* Processing
 * Created by Micaelee Hanson
 * mhanson@ecuad.ca
 * February 3rd 2014
 
Write a program that allows a user to add new objects to 
 the environment using the mouse. You should create at 
 least  two different types of objects, which look and 
 move in unique ways. Use ArrayList to add objects to, 
 and remove objects when the following conditions are met. 
 One condition is when an object exits the screen, 
 the other is when a timer runs out.
 
 Ship vector: http://thenounproject.com/term/ship/24065/ by Pham Thi Dieu Linh
 */
// store ship data in strings
String[] name = {
  "Bell Bay", "Comet Ace", "Daiwan Wisdom", "Ken Mei", "Indiana Highway"
};

String[] shipName = {
  "JS Comet", "Achilleus", "Yasa Ozcan", "Nikiland", "Navios Harmony"
};

String[] shipType = {
  "Bulk Carrier", "Bulk Carrier", "Bulk Carrier", "Bulk Carrier", "Bulk Carrier"
};
String[] boatType = {
  "Bulk Carrier", "Vehicles Carrier", "Bulk Carrier", "Bulk Carrier", "Vehicles Carrier"
};

String[] boatCountry = {
  "Hongkong", "Panama", "Panama", "Panama", "Japan"
};

String[] shipCountry = {
  "Korea", "Malta", "Marshall Is", "Marshall Is", "Panama"
};


int n=0;
int m=0;

PFont font;
PFont font2;

ArrayList ship;
ArrayList boat;

boolean display;
boolean show;
boolean button1 = false;
float mousePressedx;
float mousePressedy;

//timer variables
String time = "20";
int t;
int interval = 20;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  font =loadFont("BookmanOldStyle-BoldItalic-48.vlw");
  font2 = createFont("BookmanOldStyle", 400);

  display = false;
  show =false;
  ship = new ArrayList();
  boat = new ArrayList();
}

void draw() {
  background(255);

  //countdown timer
  t = interval-int(millis()/1000);
  time = nf(t, 2); //nf formats numbers to strings
  // once the timer reaches 0, reset it to 20
  if (t==0) {
    interval+=20;
  }

  // place timer text
  fill(245);
  textFont(font2);
  text(time, width/2, height/3);

  //Button 1 - w/ switch text
  fill(255, 0, 0, 240);
  rect(width/2, height-50, 140, 60);

  fill(255, 200);
  textFont(font, 30);
  text("switch!", width/2, height-50);

  for ( int i=0; i<boat.size(); i++) {
    fill(0);

    //write boat data
    if (button1==false) {
      textSize(30);
      text(name[n], width/2, (height/2)-50);
      textSize(20);
      text(boatType[n], width/2, (height/2));
      text(boatCountry[n], width/2, (height/2)+30);
    }

    // ship data
    if (button1==true) {
      textSize(30);
      text(shipName[m], width/2, (height/2)-50);
      textSize(20);
      text(shipType[m], width/2, (height/2));
      text(shipCountry[m], width/2, (height/2)+30);
    }

    // Add up to 5 boats to the screen, erase the first once >5
    Boat thisBoat = (Boat) boat.get(i);
    thisBoat.show();
    thisBoat.move();
    //println("boat size",boat.size());
    if (boat.size()>5) {
      boat.remove(0);
    }
    // remove all boats when the timers reaches zero 
    if (t==0) {
      boat.clear();
    }
  }// close for


    for ( int i=0; i<ship.size(); i++) {

    // Add up to 5 ships to the screen, erase the first once >5
    Ship thisShip = (Ship) ship.get(i);
    thisShip.display();
    thisShip.move();
   // println("ship Size", ship.size());
    if (ship.size()>5) {
      ship.remove(0);
    }// close if

    // remove all ships when the timers reaches zero 
    if (t==0) {
      ship.clear();
    }
  }// close for
} // close draw

// when mouse is released add either a ship/boat to the screen at the location of the mouse
void mouseReleased() {
  display = true;
  show = true;
  mousePressedx = mouseX;
  mousePressedy = mouseY;

  if (button1) {
    ship.add(new Ship(mousePressedx, mousePressedy));
  } 
  else {
    boat.add(new Boat(mousePressedx, mousePressedy));
  }
}// close mouseReleased



void mouseClicked() {

  // controls button constraints 
  if (mouseX>(width/2)-70 && mouseX<(width/2)+70 && mouseY>height-80 && mouseY<height-20) {
    button1 = !button1;
  }//close if

  n=n+1;
  if (n>4) {
    n=0;
  }

  m = m+1;
  if (m>4) {
    m=0;
  }
}// close mouse clicked

/*
* Processing
 * Created by Micaelee Hanson
 * mhanson@ecuad.ca
 * February 3rd 2014
 
Write a program that allows a user to add new objects to 
 the environment using the mouse. You should create at 
 least  two different types of objects, which look and 
 move in unique ways. Use ArrayList to add objects to, 
 and remove objects when the following conditions are met. 
 One condition is when an object exits the screen, 
 the other is when a timer runs out.
 
 Ship vector: http://thenounproject.com/term/ship/24065/ by Pham Thi Dieu Linh
 */

//import boat image
PImage img1;

class Boat {  

  float xpos;
  float ypos;
  float speed;


  Boat(float mousePressedx, float mousePressedy) {
    xpos = mousePressedx;
    ypos = mousePressedy;
    speed = random(3);
    //speed =0.2;
    img1 = loadImage("ship.png");
  }

// where to draw boat image
  void show() {
    imageMode(CENTER);
    image(img1, xpos, ypos);
    //text(name[i], 10, 50);
  }

// how to move boat 
  void move() {
    ypos = ypos -speed;

    // if the ship moves off the screen, loop it back from the bottom
    if (ypos<= -50) {
      ypos = height+50;
      ;
    }
  }
}//close ship class

/*
* Processing
 * Created by Micaelee Hanson
 * mhanson@ecuad.ca
 * February 3rd 2014
 
Write a program that allows a user to add new objects to 
 the environment using the mouse. You should create at 
 least  two different types of objects, which look and 
 move in unique ways. Use ArrayList to add objects to, 
 and remove objects when the following conditions are met. 
 One condition is when an object exits the screen, 
 the other is when a timer runs out.
 
 Ship vector: http://thenounproject.com/term/ship/24065/ by Pham Thi Dieu Linh
 */


PImage img;

class Ship {

  float xpos;
  float ypos;
  float speed;
  float rad;

  Ship(float mousePressedx, float mousePressedy) {
    xpos = mousePressedx;
    ypos = mousePressedy;
    speed = random(3);
    img = loadImage("ship1.png");
  }

  void display() {
    rad=50;
    imageMode(CENTER);
    // use cosine so it looks like there're waves
    image(img, xpos, ypos + (cos(frameCount *0.1)*20));
  }


  void move() {    
    xpos = xpos +speed;    

    // if the ship moves off the screen, move it back to the other side
    if (xpos>= width+80) {
      xpos = -80;
    }
  }
}//close ship class




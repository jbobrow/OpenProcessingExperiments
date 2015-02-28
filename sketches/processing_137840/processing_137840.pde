
/////
// Homework 7 : Make a race with 5 objects
// Edit... include pause and space and winner text
// Patrick O'Donnel
// Mar 4, 2014
/////
 
 
 
// Setup Class
 
class Person {
   
  //declare variables for class
  color c;
  float xpos;
  float ypos;
  float xspeed;
   
  //specify the object template
  Person () {
    c = color (random(100,250), random(30), random(70,230));
    xpos = 20;
    ypos = 20;
    xspeed = .75;
  }
   
  //make some functions for the object!
  void display () {
    fill (c);
    rect (xpos,ypos,20,10);
    fill (0);
    rect (xpos, ypos-2, 7,4,3,3,3,3);
    rect (xpos, ypos+8, 7,4,3,3,3,3);
    rect (xpos+13, ypos-2, 7,4,3,3,3,3);
    rect (xpos+13, ypos+8, 7,4,3,3,3,3);
  }
   
  void drive () {
    xpos = xpos + xspeed;
    if (xpos > width-20) {
      fill(c);
      textSize(28);
      text("WINNER!! --->", width/2, ypos+5);
      noLoop();
    }
  }
   
  void speedch () {
    xpos = xpos + random(2)*xspeed;
  }
   
  void revers () {
    xpos = xpos - xspeed*.5;
  }
  
  void resetx () {
    xpos = 20;
  }
     
}
 
//globally declare the class followed by the name of the object   
Person Cindy;
Person Bill;
Person Rachel;
Person Evan;
Person Guy;
 
//set up frameRate and declare object to be a "new" object from a certain class   
void setup() {
  size(600, 170);
  Cindy = new Person ();
  Bill = new Person ();
  Rachel = new Person ();
  Evan = new Person ();
  Guy = new Person ();
  frameRate(45);
  noStroke();
}
 
//void draw the background and call functions to the objects
void draw() {
  background(1,142,14);
   
  int x = 0;
  int y = 0;
  int h = height;
   
  for (int j = 0; j < height; j+=30) {
     
     
    for (int i = 0; i < width; i+=20) {
      fill(0,123,12,70);
      rect(x,y,20,h);
          x = x + 30;
          y = y + 5;
      rect(x,y,25,h);
          x = x+15;
          y = y-5;
    }
     
  }
  resetMatrix();
   
  Cindy.display();
  Cindy.drive();
  if (random (5) > random(4)) {
  Cindy.speedch ();
  } else if (random (5) > random(4)) {
  Cindy.revers ();
  }
   
   
   
  translate (0,30);
  Bill.display ();
  Bill.drive ();
  if (random (5) > random(4)) {
  Bill.speedch ();
  }else if (random (5) > random(4)) {
  Bill.revers ();
  }
   
  translate (0,30);
  Rachel.display ();
  Rachel.drive ();
  if (random (5) > random(4)) {
  Rachel.speedch();
  } else if (random (5) > random(4)) {
  Rachel.revers ();
  }
   
  translate (0,30);
  Evan.display ();
  Evan.drive ();
  if (random (5) > random(4)) {
  Evan.speedch ();
  }else if (random (5) > random(4)) {
  Evan.revers ();
  }
   
  translate (0,30);
  Guy.display ();
  Guy.drive ();
  if (random (5) > random(4)) {
  Guy.speedch ();
  } else if (random (5) > random(4)) {
  Guy.revers ();
  }
   
  resetMatrix();
}

void mousePressed () {
  Cindy.resetx();
  Bill.resetx();
  Rachel.resetx();
  Evan.resetx();
  Guy.resetx();
  loop();
}

void keyPressed () {
  noLoop();
  fill(0,123,12,200);
  rect(0,0,width,height);
  fill(0);
  textSize(30);
  text("THIS RACE IS PAUSED", width-400, height-100);
}

void keyReleased () {
  loop();
}

  

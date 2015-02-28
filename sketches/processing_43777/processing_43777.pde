
//Zena Koo
//Intro to Computational Media
//Week 6 assignment: arrays with loops, objects
//ITP NYU


Comet[] comets = new Comet[50]; // array of 50 comets/objects

void setup() {
  size(600, 600);
  smooth();
    frameRate(30);
  for (int i = 0; i <comets.length; i ++) {  //initializing each comet with for loop
    comets[i]=new Comet(color(#FFD603,60),0,i*2,i/10.0,i/50.0);  //yellow comets
  }
}

void draw() {
  background(#0D2A50); //midnight blue background color
  for (int i=0; i<comets.length; i++){
    comets[i].move();
    comets[i].display();
  }
}

class Comet { // only need one class. 
  color c;
  float xpos;
  float ypos;
  float xspeed;
 float yspeed;
 float gravity=0.05;;

  Comet(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos+gravity;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
   
  }

  void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 200, 280);
    if (mouseX>width/2 && mouseY<height/2){  //if mouse in top right corner
   
     c=color(#FF8503,50); //orange ellipses
     
    }
    else if (mousePressed==true){
     c=color(#11F274,50); //mint color ellipses
    }
    else{
      c=color(#FFD603,60); //back to yellow
    }
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
      c=color(#EB00FC,50); //occasional magenta ellipse (why is it so seldom drawn when if-else
      //back to yellow statement in display is called?)
    }
    else {
      ypos=random(0,height/0.5);
    }
  }
}



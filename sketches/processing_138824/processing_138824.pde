
//Mike Elmo
//Graphic Programming Midterm
//October 21
//V02

Box[] boxes = new Box[20];
Dot[] dots = new Dot[55];
int hitcount= 0;

import ddf.minim.*;
Minim minim;

void setup() { 
   background(33,0,12);
   size(1280, 720); 
   smooth();
   frameRate(30); 
   rectMode(CENTER);
   
noStroke();
fill(24);
rect(0, 470, 2560, 300);
 
fill(34);
rect(0, 475, 2560, 300);
 
fill(44);
rect(0, 480, 2560, 300);

fill(54);
rect(0, 490, 2560, 300);
 
fill(64);
rect(0, 500, 2560, 300);

fill(74);
rect(0, 510, 2560, 300);

fill(84);
rect(0, 520, 2560, 300);

fill(94);
rect(0, 530, 2560, 300);

fill(104);
rect(0, 550, 2560, 300);

fill(114);
rect(0, 570, 2560, 300);

fill(124);
rect(0, 590, 2560, 300);

fill(134);
rect(0, 610, 2560, 300);
 
  
  minim =new Minim(this);
  
  for (int i = 0; i < boxes.length; i++ ) { 
    boxes[i] = new Box();
  }

  for (int i = 0; i < dots.length; i++ ) { 
    dots[i] = new Dot();
  }
} 

void draw() {
  fill(0,0,0,-10);
  rect(0,0,1280,720);
   
  for (int i = 0; i < dots.length; i++ ) { 
    dots[i].move();
  }

  for (int i = 0; i < boxes.length; i++ ) { 
    boxes[i].move();
    
    for (int d=0; d<dots.length; d++) {  
      if ( boxes[i].intersects( dots[d] ) ) {
        if (dots[d].caught() ) increaseScore();
      }
    }
}

  for (int i = 0; i < dots.length; i++ ) { 
    dots[i].display();
  }
  for (int i = 0; i < boxes.length; i++ ) { 
    boxes[i].display();
  }
} 

void increaseScore() {
  hitcount++;
  println("score: "+hitcount);
}

public void stop() {
  for (int i=0; i < dots.length; i++ ) {
    dots[i].shutdownSndPlayer();
  }
  minim.stop();
  super.stop();
}



class Box { 
  float x; 
  float y; 
  float z;
  float w;
  float a;
  float b;
  float aspeed, bspeed;
  float zspeed, wspeed;
  float xspeed, yspeed;
  int size;

  Box() { 
    size = (10);
    x = random(0,1300);    
    y = random(0,12); 
    z = random(0,1300); 
    w = random(0,12);
    a = random(0,1300);
    b = random(0,12);
    xspeed = random(0, 0);  
    yspeed = random(0, 10); 
    zspeed = random(0, 0);
    wspeed = random(0, 5);
    aspeed = random(0, 0);
    bspeed = random(0, 2);
  } 

  void display() { 
    noStroke(); 
    fill(random(0,250), random(0,250), random(0,250), 25); 
    rect(x, y, size, size);
    
    noStroke(); 
    fill(random(0,250), random(0,250), random(0,250), 75); 
    rect(z, w, size, size);
    
    noStroke(); 
    fill(random(0,250), random(0,250), random(0,250)); 
    rect(a, b, size, size);
  } 

  void move() { 
    x = x + xspeed;
    y = y + yspeed; 
    z = z + zspeed;
    w = w + wspeed;
    a = a + aspeed;
    b = b + bspeed;

    if ((x > width) || (x < 0)) { 
      x = 0;
    } 
    if ((y > 316)  || (y < 0)) { 
      y = 316;
    }
       if ((z > width) || (z < 0)) { 
      z = 0;
    } 
    if ((w > 453)  || (w < 0)) { 
      w = 453;
    }
         if ((a > width) || (a < 0)) { 
      a = 0;
    } 
    if ((b > height)  || (b < 0)) { 
      b = height;
    }
  } 

boolean intersects(Dot d) {
  float distance = dist(x, x, d.x, d.y);
  if (distance < 10) {
    return true;
  }
  else {
      return false;
  }
 }
}

class Dot { 

  float x, y; // location 
  float xspeed, yspeed; // speed 
  boolean isCaught=false;
  boolean isDead=false;
  int size;
  AudioPlayer cuePlayer;

  // Constructor 
  Dot() { 
    x = width-640;   
    y = 320; 
    xspeed = random(-3, 3); 
    yspeed = random(3, 3);
    size = 1;
    cuePlayer = minim.loadFile("Noise.mp3");
  } 

  void move() { 
    if (!isDead) {
      x += xspeed;
      y += yspeed; 

      if ((x > width) || (x < 0)) { 
        x = width;
      } 
      if ((y > height)  || (y < 0)) { 
        y = 0;
      }
   } 
}

  void display() {
    if(!isDead) {
      if(!isCaught) {
        noStroke(); 
        fill(255); 
        //fill(0);
        ellipse(x, y, size, size);
  }     else {
    size+=2;
    noStroke();
    fill(255,255,255,random(100,200));
    ellipse(x, y, size, size);
    
    if (size > 20) {
      isDead=true;
   }
  }
 }
}
boolean caught() {
  boolean b = false;
  if (! isCaught) {
    isCaught = true;
    
    cuePlayer.play(0);
    b=true;
  }
  return b;
}
void shutdownSndPlayer() {
  cuePlayer.close();
 }
}




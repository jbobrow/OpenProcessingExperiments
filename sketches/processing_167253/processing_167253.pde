
// Midterm Assignment
// Deena Khattab - IML404
// inspired by http://findtheinvisiblecow.com/
// voice recording courtesy of my good friend, Julie Paul

import ddf.minim.*;

Cat myCat1;
Cat myCat2;
Cat myCat3;
Cat myCat4;
Cat myCat5;
Cat myCat6;

Minim minim;

float x;
float y;


PFont font;
PImage orangeCat;
int foundCats;        // keeps score


void setup() {
  orangeCat = loadImage("orangeCat.png");
  font = loadFont("Aleo-Light-48.vlw"); 
  size(800,800);
  smooth();
  minim = new Minim(this);
  
  x = random(width);
  y = random(height);
  
// populate the scene with invisble cats
  myCat1 = new Cat(x, y, 50, "meow.wav");
  myCat2 = new Cat(x+400, y+100, 50, "meow.wav");
  myCat3 = new Cat(x+100, y+70, 50, "meow.wav");
  myCat4 = new Cat(x+350, y-20, 50, "meow.wav");
  myCat5 = new Cat(x-100, y-70, 50, "meow.wav");
  myCat6 = new Cat(x-400, y-100, 50, "meow.wav");
}


void draw() {
  background (255, 255, 255);
  fill(0);
  textFont(font, 20);
  text("F i n d  t h e  I n v i s i b l e  C a t", 10, 20);
  textFont(font, 12);
  text("C A T S  F O U N D : " + foundCats, 10, 42);

  myCat1.display(mouseX,mouseY);
  myCat2.display(mouseX,mouseY);
  myCat3.display(mouseX,mouseY);
  myCat4.display(mouseX,mouseY);
  myCat5.display(mouseX,mouseY);
  myCat6.display(mouseX,mouseY);

//  to hide the cursor and make it really frustrating
//  noCursor();
}

void mousePressed() { 
  // when the user finds the cat --> play audio, increase score, flash png
  image (orangeCat, mouseX-60,mouseY-30);
  
  if (myCat1.contains(mouseX,mouseY)) {
    myCat1.ring();
    foundCats ++;
//    image(orangeCat, mouseX-60, mouseY-30);
  }
  if (myCat2.contains(mouseX,mouseY)) {
    myCat2.ring();
    foundCats ++;
//    image(orangeCat, mouseX-60, mouseY-30);
  }
  if (myCat3.contains(mouseX,mouseY)) {
    myCat3.ring();
    foundCats ++;
//    image(orangeCat, mouseX-60, mouseY-30);
  }
  if (myCat4.contains(mouseX,mouseY)) {
    myCat4.ring();
    foundCats ++;
//    image(orangeCat, mouseX-60, mouseY-30);
  }
  if (myCat5.contains(mouseX,mouseY)) {
    myCat5.ring();
    foundCats ++;
//    image(orangeCat, mouseX-60, mouseY-30);
  }
  if (myCat6.contains(mouseX,mouseY)) {
    myCat6.ring();
    foundCats ++;
//    image(orangeCat, mouseX-60, mouseY-30);
  }
}

//close the sound files

public void stop(){
  // use the object to close the sound
  myCat1.close();
  super.stop();
}
class Cat {
  
  //location and size
  float x;
  float y;
  float r; 
  
  // need AudioPlayer object is used to store the sound
  AudioSnippet meow;
  
  // Define the cat
  
    Cat (float x_, float y_, float r_, String filename) {
//      x = random(width);
//      y = random(height);
//      r = random(20);
     
     x = x_;
     y = y_;
     r = r_;
     
     //load sound into new AudioPlayer
     meow = minim.loadSnippet("meow.wav");
   }
   
   
   void ring() {
     if (!meow.isPlaying()){
       //ring() function plays the sound as long as it is not already playing
       //rewind() starts from beginning
       meow.rewind();
       meow.play();
     }
   }
   
   // Is a point inside the cat (used for mouse rollover, etc.)
  boolean contains(float mx, float my) {
    if (dist(mx,my,x,y) < r) {
      return true;
    } else {
      return false;
    }
  }
  
  // makes the cat invisible
  void display(float mx, float my) {
    if (contains(mx,my)) {
      fill(255);
    } else {
      fill(255);
    }
    stroke(255);
    ellipse(x,y,r,r);
  }

  void close() {
    meow.close();
  }
}



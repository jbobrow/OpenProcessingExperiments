
// Project 3 - Bringing it all together.
//
// * External image
// * Original processing sketch
// * Original music score
//
// A simple odinary triangle can be a powerful artistic tool, 
// if you put it in motion and change its size in a loop.
// Here's one example, turn off the lights, put on your headphones and enjoy the show!
//
PImage bg;
import ddf.minim.*;
Minim minim;
AudioPlayer sound1;

int i = 0;
int mode = 2; 
int stop = 290;
float y = 0;
int step = 5;
float p = 0.07;
int fr_curr = 60;


void setup() {
  size(791, 792);
  //smooth();
  noLoop();
  colorMode(HSB, width, height, 100);
  //background(50);
  minim = new Minim(this);
  sound1 = minim.loadFile("Sound_assignment4.mp3");
  sound1.play();
  bg = loadImage("bg4.png");
  background(bg);
  println(mode);
  start(); 
}

void draw() {  
 if (i == stop){
    i = 0;
    fill(random(width), random(height), 100);
  }    
  if ( (y >= 161) || (y == 0) ){
    noLoop();
    background(0);
    textSize(40);
    text("the end..", 50, 90);
  }
  if (y == 1){
      //background(random(width), random(height), random(100) ); 
      //noLoop();      
  } else {
      translate(width/2, height/2);
      rotate(radians(i));
      triangle(0-y,0+y, 150-y,100+y, 0+y, 200+y);
      i += step;
      y += p;
  }
}

void mouseDragged() {
    fr_curr = int(mouseX / 6);    
    frameRate(fr_curr);
    //println(fr_curr);
}

void start() {
       y++;  
       colorMode(HSB, width, height, 100);
       fill(random(width), random(height), random(100));
       redraw();
       loop();
}

void keyPressed() {
    if (key=='p'){
      noLoop();
    }
    if (key == 'r'){
        loop();
    }
    if (key ==  ENTER){
        //mode = int(random(0, 6)); 
        println(mode);
        start(); 
    }
    if (key=='s' || key=='S') saveFrame("screenshot.png");
}


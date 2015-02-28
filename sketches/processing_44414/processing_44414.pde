

//  1          speed up rain
//  2          speed up rain more
//  3          slow down rain to initial speed
//  s          stop rain
//  r          start rain
//  mouse      lightning


Rain[] rain = new Rain[500];
boolean stopRain = false;
PImage img0; 
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  size(700, 525, P2D);
  smooth();
img0 = loadImage("2011_0914Interactivity0046.jpg");
 
  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(2, 5));
  }
}

void draw() {
  image(img0,0,0);
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
  }
}
 
class Rain {
  float x, y, s;
 
  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
 
void move() {
    y += s;
    if (y > height){
      if (stopRain == false)
        y = 0;
      else if (stopRain == true)
        y = height;
    }
  }

  void display() {
    
    stroke(#FAFBFC,random(100,255));
    line(x,y,x,y + random(20)); //amount of rain
    
    if(keyPressed){
   if(key == '1'){ //increase rain
     frameRate(110);
   }
 }
    if(keyPressed){
   if(key == '2'){ //increase rain
     frameRate(170);
   }
 }
     if(keyPressed){
      if(key == 's'){ //stop
      stopRain = true;
   }
 }
    if(keyPressed){
   if(key == 'r'){ //start
     stopRain = false;
   }
 }
 if(keyPressed){
   if(key == '3'){ //decrease rain
     frameRate(80);
   }
 }
  }
}

void mousePressed(){ 
  rect(0,0,width,height);
  fill(255,70);
  frameRate(50);
  loop();
     minim = new Minim (this); //load a file
  player = minim.loadFile("lightning_strike_01.mp3", 2048); //play the file
  player.play();
}

 void stop(){
  player.close();
  minim.stop();
  super.stop();
}



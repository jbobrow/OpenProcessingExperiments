
/* 
Chris Jung
Exercise IV: Creates a monster that responds to user input

 easing movement was inspired by: https://processing.org/examples/easing.html
 */

import ddf.minim.*;

Minim minim;
AudioPlayer yikes;
AudioPlayer rub;
AudioPlayer woah;
AudioPlayer laugh;
AudioPlayer hey;
AudioPlayer alright;

PImage img;
PImage img_poke;
PImage img_rub;
PImage img_tickle;

float xpos = 100;
float ypos = 200;
float easing = .01;
float moveEasing = .1;

float targetX,targetY;

int mwidth = 100;
int mheight = 100;

int xspeed = 0;
int yspeed = 1; //how fast monster is floating up and down

float dx = targetX - xpos; //initiate distance to target after being poked
float dy = targetY - ypos; 


void setup() {
  size(400, 400);
  
  //load sounds
  minim = new Minim(this);
  rub = minim.loadFile("oh_yeah.mp3");
  yikes = minim.loadFile("yikes (1).mp3");
  woah = minim.loadFile("woah.mp3");
  laugh = minim.loadFile("giggle.mp3");
  hey = minim.loadFile("hey.mp3");
  alright = minim.loadFile("alright.mp3");
  
  //load images
  img = loadImage("monster_chilling.png");
  img_poke = loadImage("poke.png");
  img_rub = loadImage("monster_rub.png");
  img_tickle = loadImage("monster_tickle.png");
  frameRate(20);
  targetX=xpos;
  targetY=ypos;
  
}

void draw() {
  background(200,234,177);

  image(img, xpos, ypos, mwidth, mheight);
   
  //calculate top and bottom of resting float motion
  float top = targetY - 10;
  float bottom = targetY + 10;
  
  float dx = targetX - xpos; //initiate distance to target after being poked
  float dy = targetY - ypos; 
   
   //poked: if he has not reached his next target, keep moving
   if ( abs(dx) >= 1 && abs(dy) >= 1 ){
     xpos += moveEasing*dx;
     dx = targetX-xpos;  
     ypos += moveEasing*dy;
     dy = targetY - ypos;
     background(200,234,177);
     image(img_poke, xpos, ypos, 100, 100); 
   }
 
   //rest if not moving
  if (abs(dx) < 4) {
    rest(top,bottom); //call rest, pass new rest range based on new position
  }
  //call MSpeed method, send previous and current mouse positions
  MSpeed(mouseX, mouseY, pmouseX, pmouseY);


}
    
  void mouseClicked() {    
    //check to see if monster was poked
    if (mouseY >= ypos && mouseY <= ypos + 100 &&
    mouseX >= xpos && mouseX <= xpos + 100) {
    
    //randomize which poke sound is played  
    int pick = int(random(0,3));
      
    if (pick == 1) {
    yikes.play(); //play poke sound when poked
    yikes.rewind();//rewind so can play again
    rub.pause();
    }
    else if (pick == 2) {
      woah.play();
      woah.rewind();
      rub.pause();
      alright.pause();
    }
    else {
      hey.play();
      hey.rewind();
      rub.pause();
      alright.pause();
    }
    
    background(200,234,177);
    image(img_poke, xpos, ypos, 100, 100);

    //choose a random new location to run to
    targetX = random(0,width-mwidth);
    targetY = random(0,height-mheight);
    
    
    float abs = targetY + 10;
    float bottom = targetY - 10;   
    }
  }

//REST
void rest(float top, float bottom) {
  dx = 0; //set x movement to zero
  ypos = ypos + yspeed; //initiate rest float motion
  
  //resting float motion
  if (ypos <= top) { //reverse motion at top of float
    yspeed = -yspeed;
  } 
  else if (ypos >= bottom) { //reverse motion at bottom of float
    yspeed = -yspeed;
  }
}

//calculate mouse speed and generate rub or tickle interaction based on
//the mouse speed
void MSpeed(int mx, int my, int prevMX, int prevMY) {
  float mouseSpeed = abs(mx - prevMX) + abs(my - prevMY);
  
  //check to see if mouse is on monster
    if (mouseY >= ypos && mouseY <= ypos + 100 &&
    mouseX >= xpos && mouseX <= xpos + 100) {
  
      //if mouse speed is slow, rub
  if (mousePressed && mouseSpeed <= 10) {
    background(200,234,177);
    image(img_rub, xpos, ypos, mwidth, mheight); 

  }
  
  // if mouse speed is fast, tickle
  if (mousePressed && mouseSpeed > 10) {
  background(200,234,177);
    for (int i = 0; i<1050; i++) {
    //laugh.play();
    //laugh.rewind();
    alright.pause(); //pause the other sounds
    rub.pause();
    image(img_tickle, xpos, ypos, mwidth, mheight);
    }
    
  }
    
}
}

//play sound during rub
void mousePressed() {
if (mouseY >= ypos && mouseY <= ypos + 100 &&
    mouseX >= xpos && mouseX <= xpos + 100) {
      if (random(0,1) >= 0.5) {  
        rub.play();
        rub.rewind();
    }
    else {
      alright.play();
      alright.rewind();
    }
    }
}

//play sound while monster is being tickled
void mouseDragged() {
  if (mouseY >= ypos && mouseY <= ypos + 100 &&
    mouseX >= xpos && mouseX <= xpos + 100) {
      float mouseSpeed = (mouseX - pmouseX) + (mouseY - pmouseY);
      if(mouseSpeed >10) {
        println("fast");
        laugh.play();
        laugh.rewind();
      }
    }
}
      
      
  
  
  







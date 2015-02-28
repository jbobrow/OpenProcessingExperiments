

//Thomas Greco
//May 10, 2012
//Final Project 
//Time: Approx. 10:00 hrs.
//Interactive Deadmau5 Experience

import ddf.minim.*; //Imports the Deadmau5 track, enabled by the Minim addon. 
Minim minim;


AudioPlayer songname; //"songname" is the variable used for the track title. 

PImage redmouse; // Each of the PImages are used for the objects in the sketch.
PImage mouse;  // redmouse and mouse are variables for the red and black heads. 
PImage glow;//"glow" is the variable for the green glow stick, which replaces the cursor
float rot; // The Float variables "rad" and "rot", as well as "pic=0" are for the rotation function.
float rad;
int pic=0;

PImage pic1; //"pic1" is the green and black image of the cube and lines.
PImage pic2; // "pic2" is the black and red image of the cube and lines.
color light; // The "light" color is for the changing lights on the cube. 

int pics = 0;
float xpos;

void setup() {
  size(820, 800);  //Size of the sketch, fit to the width of the cube. 
  glow=loadImage("glowstick.png"); //Replaces the cursor with a glow stick image
  mouse = loadImage("Deadmau5black.png"); //the variable the loads the black and green head.
  pic1 = loadImage("cube.png"); //Loads Deadmau5's green/blac kcube workstation.
  pic2 = loadImage("redcube.png"); //Loads the red/black cube.
  redmouse=loadImage("Deadmau5.png");//loads the red/white head.
  //frameRate(30);
  rad=100; //Radian positioning for the rotation
  rot=0;   //Rotational movement. 
  noCursor(); //Makes cursor invisible- to be replaced with the glow stick.
  minim = new Minim(this); //Utilizes the minim plugin, which enables music to be played
  songname=minim.loadFile("Alone With You.mp3");
  
  songname.play(1);
    //songname.pause();
    //songname.loop(3);
  
}

void draw() {
  xpos = cos(rot)*rad; // x positioin for the rotation
  background(light); //makes use of the light variable, which changes the colors on the cube.
  if (pics == 0) {
    image(pic1, 0, 0, width, height); //pic1 is positioned with the width and height variables.
    image(mouse, width/2+xpos-252, -12); //"mouse" is positioned in accordance to the xpos and s
    if (frameCount%5==0) { //Takes the place of the frameRate(30), commented out above.
                           //This slows the movement of the rotation and   down from
                           //the original setting.
      light=color(random(0, 50), random(155, 255), random(80, 150));
    }
    
  }
  else {
    image(pic2, 0, 0, width, height);
    image(redmouse, width/2+xpos-252,-12);
        if (frameCount%5==0) {
      light=color(random(155, 255), random(0, 55), random(10, 40));
    }
  }
  rot+=0.04; // The rate at which the rotation moves. 
  //float ypos=-sin(rot)*rad;
  //image(mouse, width/2+xpos-252,-12);
  cursor(glow, 16, 16);
  //image(glow, mouseX, mouseY);  //replaces the cursor with the image of the glow stick.
}

void mousePressed() { //Enables the images to be switched witht the click of the mouse
  pics+=1;
  if (pics > 1) {
    pics = 0;
  }
}

void stop() //Enables control of the music through the minim plugin. 
{
  songname.close();
  
  //minim.stop();

  super.stop();
}



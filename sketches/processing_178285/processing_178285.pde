
//Final Project - Bringing it all together 
//by Irene van der Valk
//
//For my final project of Introduction of Computational Arts I chose
//a pinwheel as a sequel of the Cherish our blue dot and Zen Projects.
//
//What can you do? 
//You can spin the pinwheel flower by moving the mouse over the sketch.
//You can play music by pressing key 1. 
//This music you can play over and over again just by pressing key 1.
//
//Enjoy!

//Minim library files
import ddf.minim.*;

//---------GLOBAL VARIABLES--------------------

color[] pulse = {#554136, #5a611c, #FFFFFF};  //brown - green - white
color[] palette = pulse;

Minim minim;
AudioPlayer guitar;
PImage hills;

//---------SETUP--------------------
void setup(){
  size(800,600);
  rectMode(CENTER);
  smooth();
  stroke(30,40);
  
//---------FILES--------------------  
  //picture file
  hills = loadImage("hills.jpg");
  
  //sound file
  minim = new Minim(this);
  guitar = minim.loadFile("guitar.mp3"); 
}

//---------DRAW--------------------
void draw(){
  //background picture
  image(hills, 0,0);
  
  //flowerbed
  fill(palette[0]); 
  noStroke();
  ellipse(575, 500, 200, 30); 
  
  //stem
  stroke(palette[1]); 
  strokeWeight(6);
  line(590, 275, 590, 500); 
  
  //leave
  triangle(580,380,590,400,590,420);  

  //pinwheel
  stroke(palette[2]); 
  strokeWeight(1);
  translate(590,275); 
  for(int s = 100; s > 0; s = s - 10){
  fill(255, 200-s, 0-s);
  rotate((mouseX + mouseY)/100.0);
  rect(0,0,s,s);
  }
}

//---------MUSIC--------------------
void keyReleased(){
  if(key == '1') guitar.play();
  guitar.rewind();
}



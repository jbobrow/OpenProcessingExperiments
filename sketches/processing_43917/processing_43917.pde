

PImage body; //peacock
PFont font;


float x;
float y;

import ddf.minim.*;

AudioPlayer player;
Minim minim;




void setup()
{

 size(700,450);
background(191,239,255);
 smooth();
 frameRate(10);


minim = new Minim(this);
player = minim.loadFile("Peacock.mp3");
 player.play(); 
   

font = createFont("arial", 60);


body =loadImage("body.png");


}

void draw()
{

 image(body,X,Y, width, height);
  
 x=mouseX;
  y=mouseY;
 
  if(mousePressed){
  
  stroke(0,191,255,200);
  strokeWeight(4);   
  line(x,y,width/2,height/2);

  
  fill(255,105,180,150);
  ellipse(x,y,40,40);

  }

textFont(font);
fill(random(0,200),random(0,256),random(0,256));

 text("PEACOCK", 200, 430);
 




}


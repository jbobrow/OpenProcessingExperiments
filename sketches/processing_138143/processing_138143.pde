
//The Seasons project plays The Four Seasons music by Antonio Vivaldi and shows as sun, rain, flowers and grass change by seasons. 
//You can change seasons by pressing keys w,s,a and S onn the keyboard.


import ddf.minim.*;

//Define Color Palette
color[] growinggrass = {#FFFFFF, #E7E7E9, #F3F3F5, #A8A9AD};
color[] palette = growinggrass;


color flowerColor = #D31138;
color rainColor = #CBD8DB;
color grassColor = #6AD32F;
color sunColor = #FFE371;

Minim minim;
AudioPlayer spring;
AudioPlayer summer;
AudioPlayer autumn;
AudioPlayer winter;

//Define coordinates
 float x=25;
  float y=25;

   float b = 1;
  float c = 710;
 
//Create setup code block
void setup()
{
 
  //window size
 size(1280, 720);
 //select the first color from the selected palette
 background(palette[0]);
 frameRate(130);
 
 minim = new Minim(this);
 spring = minim.loadFile("01 Spring Concerto In E, Op. 8 No. 1 - I. Allegro (converted).wav");
 spring.play();
}

//Create the draw code block


void draw()
  {
  
  
  fill(#86505B);
  textSize(20);
  text("w is for Winter",80,110);
  text("a is for Autumn",80,130);
  text("s is for Spring",80,150);
  text("S is for Summer",80,170);

 //Set variable to palette
    stroke(rainColor);
   //Set stroke weight to raindrops
   strokeWeight(1);
   //Set fill color randomly from palette
   fill(rainColor);
   //set rect origin location x to random of screen width
   x = random(width);
   //set rect origin location x to random of screen height    
   y = random(height);
   //set rect height and width
   float d = 2;
   float s = 6;
   //draw rect
   ellipse(x, y, d, s);
 
   brightSun();
  //The loop draws the grass and flowers until they reach a certain amount of screen
  if(c>500){
  //Stroke and fill to raindrops
  stroke(grassColor);
  fill(grassColor);
  rect (b,c,1,10);
  if (c<600) {
     //Stroke and fill to flowers
   stroke(flowerColor);
   fill(flowerColor);
   ellipse(b,c,15,15);
   }
  if (b<width) {
    b+=20;
  }
  if (b>width) {
    c-=10;
    b = 1;
  }
 
}


 }
 
 void keyPressed()
  {
  if (key=='w') 
     {
     b = 1;
     c = 710;
      winter();
           
     }
      
  if (key=='a') 
     {
      b = 1;
       c = 710;
       autumn();
     }
     
 if    (key=='s') 
     {
      b = 1;
       c = 710;
       summer();
     }
     
  if   (key=='S') 
     {
       b = 1;
       c = 710;
       spring();
     }
     
    }
  
     void brightSun()
    {
      stroke(sunColor);
     //Set stroke weight to sun
     fill(sunColor); 
     ellipse(width/2,100,150,150);
    }
  
    void sun()
    {
      stroke(sunColor);
     //Set stroke weight to sun
     fill(sunColor); 
     ellipse(width/2,100,100,100);
    }
  
 
    void winter()
    {
    flowerColor = #A5A29E;
    rainColor = #EDFCFF;
    grassColor = #AF9B81;
    sunColor = #E0CCB1;
    background(#EAEAEA);
      draw();
    sun();
    }
  
  void summer()
    {
     background(#FAFAFA);
    flowerColor = #FA3030;
    rainColor = #CBD8DB;
    grassColor = #6AD32F;
    sunColor = #FFE371;
    brightSun();
      draw();
    }
  
  void spring()
  {
    background(#FAFAFA);
    flowerColor = #FA3030;
    rainColor = #CBD8DB;
    grassColor = #6AD32F;
    sunColor = #FFE371;
     brightSun();
   draw();
  }
  
  void autumn()
  {
    flowerColor = #A5A29E;
    rainColor = #CBD8DB;
    grassColor = #AF9B81;
    sunColor = #E0CCB1;
    background(#EAEAEA);
    sun();
     draw();
 }


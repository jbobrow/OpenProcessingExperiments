
/* @pjs preload="notonebrake.jpg", "awkr.jpg", "party3.mp3","ptp.mp3", "rtd.mp3"; */

import ddf.minim.*;
int Check = 0;
AudioPlayer player;
Minim minim;
void setup()
{
  size(435, 550); 
  PImage scary = loadImage("notonebrake.jpg");
  minim = new Minim(this);
  player = minim.loadFile("party3.mp3", 2048);
  player.play();
   image(scary, 0, 0);  
}

void draw() 
{
  stroke(random(255),random(255),random(255));
strokeWeight(random(5));
line(450,350,random(900),random(700));
point(random(300),random(300)); 

  if(Check == 0){
  stroke(random(255),random(255),random(255));
  strokeWeight(random(1));
  line(435,350,random(435),random(550));
  point(random(435),random(550)); 
   noStroke();
   fill(random(250), random(250), random(250));
   ellipse(random(mouseX - 90, mouseX + 90), mouseY, random(30), 45);}
   
 if(Check == 1){
  ellipseMode(CENTER);
    fill(random(255),0,0,80);
    ellipse(random(300),random(400),random(300),random(300));
    line(random(50),random(150),random(50),random(150));
    triangle(94, 109, random(100),random(70),random(100),random(70));}
  if(Check == 2){
    noStroke();
fill(0, random(255), random(25));
float radius = random(0, 50);
float angle = random(-PI,PI);
float x = radius * cos(angle) + 175;
float y = radius * sin(angle) + 350;
ellipse(x, y, random(50), random(50));

  }

}

void mouseClicked()

{Check = Check + 1;
  {
    if(Check==1){
    PImage scary = loadImage("notonebrake.jpg");
    image(scary, 0, 0);
    filter(INVERT);
    minim.stop();
    minim = new Minim(this);
    player = minim.loadFile("rtd.mp3", 2048);
    player.play();
    Minim minim;
    }

if(Check==2){
    {PImage wk = loadImage("awkr.jpg");
     minim.stop();
    minim = new Minim(this);
  player = minim.loadFile("ptp.mp3", 2048);
  player.play();
   image(wk, -95,90);
 
 

  }
  
}   
  }

  



}






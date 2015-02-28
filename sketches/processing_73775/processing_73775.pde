
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
import ddf.minim.*;
AudioPlayer Rocket;
AudioPlayer player;
Minim minim;

int X=0;
PImage Okami;
PImage Shield;
PImage HUD;
PImage Reticle;
PImage Hole;

float S;
float S2;
float g;
float b;
float $ize;
void setup(){
  frameRate(40);
  
  size (1000, 800);
  smooth();
  HUD=loadImage("HUD.png");
  strokeWeight(3);
Okami= loadImage("Okami.png");


Shield=loadImage("shield.png");
Reticle=loadImage ("Reticle.png");
Hole=loadImage ("Hole.png");
background(HUD);
if (key=='2')
image(Reticle, mouseX, mouseY);
}

void draw (){

  S=random(55);
  S2=random(80);
  g=random (255);
  b=random (255);
  
  
  image(Shield, 0, 0);
 
  translate(-180,-160);{
   if ((keyPressed == true) && (key == '1'))
    cursor(Okami, 8, 8);
  }
  
  if ((keyPressed ==true) && (key== '2')){
    translate(-600,-550);  
    cursor (Reticle, 8, 8);
  }
if ((keyPressed == true) && (key == '1')){
  if (mousePressed==true){
    translate(180,170); 
    noStroke();
    smooth();
    fill(255, g, b);
    ellipse(mouseX, mouseY, S, S2);}
}
if ((keyPressed=true) && (key=='2')){
 if (mousePressed==true){
  translate(0, 0);{
   image (Hole, mouseX, mouseY);}
}
}
if ((keyPressed = true) && (key == '3'))
  {
    if(mousePressed)
    {
      
      
        stroke (255, g, b);
        strokeWeight(.5);
        noFill();
        ellipse(mouseX, mouseY, $ize,$ize);
        $ize = $ize + 6;
        if($ize >= 1000)
        {
          $ize = 1;
      
         
      
     }
   }
 }
}//end of void draw


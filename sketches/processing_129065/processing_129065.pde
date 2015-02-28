
//Coded by Mia Rosado Photos taken by Mia Rosado. Subject is my cousin Avery 
/* @pjs preload="avery.JPG, flower3.JPG"; */


PImage avery;
PImage flower3;


void setup()
{
size(750,500);
strokeWeight(5);
frameRate(5);
avery = loadImage("avery.JPG");
flower3=loadImage("flower3.JPG");
//flower3.filter(255,155,233);
//avery.blend(flower3, 700,500,750,500, 0,0, 1600, 1500, OVERLAY);
}

void draw ()
{
  image(avery, 0, 0, width, height); 
  tint(255, 155, 233,130); 
  image(flower3, -200, 0);

    stroke(random(250), random(250), random(250), 50);
    noFill();
    ellipse(750,200,20,20);
    ellipse(750,200,55,55);
    ellipse(750,200,85,85);
    ellipse(750,200,105,105);
    ellipse(750,200,125,125);
    ellipse(750,200,155,155);
    ellipse(750,200,195,195);
    ellipse(750,200,220,220);
    
    ellipse(0,0,20,20);
    ellipse(0,0,55,55);
    ellipse(0,0,85,85);
    ellipse(0,0,105,105);
    ellipse(0,0,125,125);
    ellipse(0,0,155,155);
    ellipse(0,0,195,195);
    ellipse(0,0,220,220);
    
    ellipse(100,420,20,20);
    ellipse(100,420,55,55);
    ellipse(100,420,85,85);
    ellipse(100,420,105,105);
    ellipse(100,420,125,125);
  
    ellipse(460,-50,105,105);
    ellipse(460,-50,125,125);
    ellipse(460,-50,155,155);
    ellipse(460,-50,195,195);
    ellipse(460,-50,220,220);
  
    ellipse(600,500,20,20);
    ellipse(600,500,55,55);
    ellipse(600,500,85,85);
    ellipse(600,500,105,105);
    ellipse(600,500,125,125);

stroke(250,250,250,70);
noSmooth();
bezier(375, 135,  470, -25,  760, 80, 370, 480);
bezier(375, 135,  90, -25,  85, 270, 370, 480);  



}





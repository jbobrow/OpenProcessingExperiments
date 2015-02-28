
PFont f1;
String donotgo = "Do not go";
String where = "where the path";
String may = "may lead,";
String go = "go instead";
String there = "where there is";
String nopath = "no path";
String leave = "and leave";
String trail = "a trail.";
String Ralph = "Ralph Waldo Emerson";

float positionX = 0;
float positionY = 50;
float velX = 1;

void setup()
{
  size(800, 500);
  smooth();
  textAlign(CENTER);
  frameRate(40);
  f1 = loadFont("Copperplate-50.vlw");
}

void draw()
{
  //background(149, 203, 255);
  noStroke();
  fill(60, 0, 30, 18);
  rect(0, 0, width, height);
  textFont(f1, 45);
  fill(255);
  positionX = positionX+velX;
  
  if (positionX<width)
   {
    velX = .95;
   }
  
  if (positionX>310)
   {
    velX = 0;
   }
  
//  for(int i=0; i<donotgo.length(); i++)
//  {
  
  
    text(donotgo, positionX+100, positionY);
    
    if(frameCount >= 40)
    {
      text(where, positionX+135, positionY+50);
    }
    
   if(frameCount >= 80)
   {
    text(may, positionX+170, positionY+100);
   }
   
   if(frameCount >= 120)
   {
     text(go, positionX+205, positionY+150);
   }
   
   if(frameCount >= 160)
   {
     text(there, positionX+240, positionY+200);
   }
   
   if(frameCount >= 200)
   {
     text(nopath, positionX+205, positionY+250);
   }
   
   if(frameCount >= 240)
   {
     text(leave, positionX+170, positionY+300);
   }
   
   if(frameCount >= 280)
   {
     text(trail, positionX+135, positionY+350);
   }
   
   if(frameCount >= 350)
   {
     text(Ralph, positionX+100, positionY+400);
   }
   

//now big text
textSize(200);
fill(255, 255, 255, 4);
  
  
    text(donotgo, positionX+100, positionY+25);
    
    if(frameCount >= 40)
    {
      text(where, positionX+135, positionY+75);
    }
    
   if(frameCount >= 80)
   {
    text(may, positionX+170, positionY+125);
   }
   
   if(frameCount >= 120)
   {
     text(go, positionX+205, positionY+175);
   }
   
   if(frameCount >= 160)
   {
     text(there, positionX+240, positionY+225);
   }
   
   if(frameCount >= 200)
   {
     text(nopath, positionX+205, positionY+275);
   }
   
   if(frameCount >= 240)
   {
     text(leave, positionX+170, positionY+325);
   }
   
   if(frameCount >= 280)
   {
     text(trail, positionX+135, positionY+375);
   }
   
   if(frameCount >= 350)
   {
     text(Ralph, positionX+100, positionY+425);
   }
   




}


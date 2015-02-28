
/* @pjs preload="flyingthecoop.png, dacops.png,cluckyeah"; */


int dim;
float timer=0.0;
float daCops;
float center;
float bushmovementX;
float bushmovementY;
PImage flyingthecoop;
float chickenx = 0.0;
float chickeny= 0.0;
float SecondX=0.0;
float SecondY=0.0;
float timerScalar=20.0;
float endy=450;
float endx=450;
PImage dacops;
PImage cluckyeah;




void setup()
{
  size(500,500);
  colorMode(HSB, 200,200,200);
  background(#c7f9fb);
  frameRate(30);
  flyingthecoop = requestImage("Flyingthecoop.png");
  dacops = requestImage("dacops.png");
  cluckyeah= requestImage("cluckyeah.png");
  //taken from processing
  dim = width/2;
  noStroke();
  ellipseMode(RADIUS);
 timer=0.0;
 
 //trying to define variables for image placement
 SecondX= 150-(timer*10);
 SecondY= 150+(timer*10);
}

void draw()
{
  
    timer = timer + (1.0/30.0);
    println(timer);
    
  //background
  noStroke();
  fill(#e95e1b);
  ellipse(250,300-(timer*5),200,200);
  fill(#e9270d);
  triangle(250,300,80,150, 10,150);
  triangle(250,300,420,150, 490, 150);
  triangle(250,300,70,210,5,220);
  triangle(250,300,430,210,495,220);
  triangle(250,300,0,250,70,290);
  triangle(250,300,500,250,430,290);
  fill(#e9c90d);
  ellipse(250,300-(timer*5),175,160);
  fill(#FFFFFF);
  ellipse(250,320-(timer*5),150,155);
  fill(#683200);
  rect(0,300,500,200);
  
  //sides of road
  fill(#32241b);
  triangle(150,300,30-(timer*7),500,150,500);
  triangle(350,300,470+(timer*7),500,350,500);
  
  //road
  fill(#000000);
  triangle(150,300,45-(timer*5),500,150,500);
  rect(150,300,200,200);
  triangle(350,300,455+(timer*5),500,350,500);
  
  
  //cycling bushes
  //note it bows outwards and then back inwards
  //rightside
  fill(#1d4112);
  //front
  ellipse(0-(timer*10),500-(timer*10),100-(timer*10),100-(timer*10));
  //middle
  ellipse(40-(timer*10),350,40,40);
  //back
  ellipse(100-(timer*10),300,10,10);
  
  
  //leftside
  fill(#1d4112);
  //front
  ellipse(500+(timer*10),500,100,100);
  //middle
  ellipse(460+(timer*10),350,40,40);
  //back
  ellipse(400+(timer*10),300,10,10);
  
  //cops
  if (timer>0)
    {
       if (0<timer && timer<10)
         {
           image(dacops,150+(timer*5),250,70,70);
           image(dacops,230+(timer*10),250,80,80);
           image(dacops, 300-(timer*5),250,85,85);
           image(dacops, 220-(timer*5),250,80,80);
         }    
    }
  
  //chickens
  
if (timer>0)
  {
    if (0 < timer && timer < 10)
      { 
        image(flyingthecoop, mouseX-(timer*10),mouseY+(timer*10),250+(timer*20),250+(timer*20));
      }   
      
     if (10<=timer && timer <13)
       {
         image(cluckyeah,0,0,500,500);
       }
       
      // if(keyPressed == true)
         //{
           //for(int timer; timer>0;timer<5)
             //{
             // line(0,0,(timer*10),(timer*10));
             //}
           //for(int timer; timer>0;timer <5)
             //{
              // line(500,0,(timer/10),(timer*10));
            // }
        // }
  }
 
  
if (timer>=13)
  {
     fill(#c7f9fb);
     rect(0,0,500,500);
     timer=0.0;
     
     
  }


}






//import processing.pdf.*;

float x = 10;
float y = 10;
float diam = 20;
float h = random(10-255);
float density = 80;

//int counter = 0;

void setup()

{
 
 //size (600, 600, PDF, "final6.pdf");
 size (600, 600);
 background (255);
 smooth();
 frameRate(200);
 //noLoop();

}

void draw ()

{

 // while(counter < 1000)

  {

  noStroke();
  fill(0,0,0,density);
  ellipse (x, y, diam, diam);
//ellipse (650-x, 650-y, diam + 10 , diam + 10);
 // endRecord();

  diam = diam * random(0.8,0.99);
  
   x = x + 20;
   
   if(x > 600){
     y = y+20;
     x = 10;
     diam = 100;

   }
   

  density = random (25, 90);
  
  if (density == 25){
  density = density - 60;

}

//counter = counter + 1;   
   
}

//println("ALL DONE");
//exit();

}


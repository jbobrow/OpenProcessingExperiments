
//import processing.pdf.*;

float x = 10;
float y = 10;
float diam = 20;
float h = random(10-255);

//int counter = 0;

void setup()

{

 // size (600, 600, PDF, "final4.pdf");
 size(600, 600);
 background (255);
 smooth();
 frameRate(200);
 //noLoop();

}

void draw ()

{

  //while(counter < 1000)
  
  {
  
  noStroke();
  fill(0,0,0,80);
  ellipse (x, y, diam, diam);
  ellipse (x+x, y+y, diam, diam);
  endRecord();
  
  diam = diam + 1.7 * random(0.6,0.9);
  
   x = x + 20;
   
   if(x > 600){
     y = y+20;
     x = 10;
     diam = 20;
  
 }
   
 //  counter = counter + 1;

   }

//println("ALL DONE");
//exit();
   
}


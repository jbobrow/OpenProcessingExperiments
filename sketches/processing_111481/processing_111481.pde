
/* @pjs preload="Napping.jpg";*/

PImage b;
float T;
float X;
float Y;
float X2;
float Y2;
float X3;
float Y3;
float X4;
float Y4;
float X5;
float Y5;
float X6;
float Y6;
float noiseX;
float noiseY;
float noiseX2;
float noiseY2;


void setup()
{
  size(540,720);
  background(255);
  b= loadImage("Napping.jpg");
  T = 0; // Timer
  X = 360; // Line 1
  Y = 0;
  X2 = 540; // Line 2
  Y2 = 178;
  X3 = 0;  // Line 3
  Y3 = 540;
  X4 = 0;  // Line 4
  Y4 = 210;
  X5 = 275; // Line 5
  Y5 = 720;
  X6 = 540; // Line 6
  Y6 = 465;
}

void draw()
{ 
  
  T = T + 1;
   strokeCap(ROUND);
   strokeWeight(3);
  
  if (T < 35) // fade in background image
   { 
    frameRate(25);
    tint(255, 35);
    image (b,0,0);
   }
  if (T >= 20) // start drawing lines 1-6
   {
    
    if (X2 > 0) 
     {
      line(540,178,X2,Y2);
      X2 = X2 - 12;
      Y2 = Y2 - 3.8;
     }
    if (Y < 740) 
     { 
      line(360,0,X,Y);
      Y = Y + 15;
      X = X - .9;
     }
    if (X3 < 560) 
     {
      line(0,540,X3,Y3);
      X3 = X3 + 15;
      Y3 = Y3 + 2.8;
     }
    if (Y4 > -10) 
     {
      line(0,210,X4,Y4);
      Y4 = Y4 - 12;
      X4 = X4 + 9;
     }
    if (X5 < 550) 
     {
      line(275,720,X5,Y5);
      X5 = X5 + 9.2;
      Y5 = Y5 - 15;
     }
    if (X6 > -10) 
    {
      line(540,465,X6,Y6);
      X6 = X6 - 15;
      Y6 = Y6 - 2.8;
    }
   }
   
   if (T >= 90)
     {
      frameRate(25);
      filter(ERODE);
      image(b,0,0);
      stroke(0);
      line(360,0,X,Y);
      line(540,178,X2,Y2);
      line(0,540,X3,Y3);
      line(0,210,X4,Y4);
      line(275,720,X5,Y5);
      line(540,465,X6,Y6);
     }
  if (T >= 110) // start drawing the noise lines.  I used the code from                                                                http://processing.org/reference/randomGaussian_.html as a starting point for this effect.
    { float p = 360;
      float p2 = 465;
   
      
    for (float noiseY = 0; noiseY < 720; noiseY += 2)
      {
        
        float noiseX = random(-20,20)-random(-10,10);
        p -= .125;
        
        frameRate(50);
        stroke(random(50));
        strokeWeight(random(0,1.5));
        line(p,noiseY,p + noiseX,noiseY);       
      } 
    for (float noiseX2 = 540; noiseX2 > 0; noiseX2 -= 2)
      { 
        float noiseY2 = random(-20,20)-random(-10,10);
        p2 -= .38;
        
        frameRate(50);
        stroke(random(50));
        strokeWeight(random(0,1.5));
        line(noiseX2,p2,noiseX2,p2 + noiseY2);
      }
      
      
    }
  println(T);
}


   


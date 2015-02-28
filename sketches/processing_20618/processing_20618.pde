
float x = 0.0;
int timeCushion = 250;
int oneSecondCushion = 1000;
int halfSecondCushion = 550;
int quarterSecondCushion = 200;
int tinySecondCushion = 68;
int superTinyCushion = 26;
float prevTime1 = 0.0;
float prevTime2 = 0.0;
float prevTime3 = 0.0;
float prevTime4 = 0.0;
float prevTime5 = 0.0;
float prevTime6 = 0.0;
int wipeCounter = 0;


void setup()
{
  smooth();
  size(1024, 400);
  background(0);
  frameRate(60);
}

void draw()
{

  
  int s = second();
  int m = minute();
  int h = hour();
  
  if (millis() - prevTime1 >= timeCushion)
  {
   
    fill(0,0,0,5);
    noStroke();
    quad(0,0, width,0, width,height, 0,height);
   // stroke(255,255,255,10);
    stroke(64,64,64,20);
    strokeWeight(50);
    
   // line(x,0, x, height);  // quarter second lines
    x += 30;
      if( x >= width) { x = 0; /*wipeCounter ++;*/ }
      //if (wipeCounter == 15) { background(0); wipeCounter = 0;}
   }
   
   if (millis() - prevTime6 >= quarterSecondCushion)
   {
      stroke(255,255,255,50);
      strokeWeight(random(1));
      line(x ,0 , x, height);
      prevTime6 = millis();
   }
   
   if (millis() - prevTime1 >= oneSecondCushion)
   {
      fill(255,0,0);
      ellipse(x, height/2 + 100, 20, 20);
      prevTime1 = millis();
   }
   
   if (millis() - prevTime2 >= halfSecondCushion)
   {
      fill(84,109,255);
      ellipse(x+random(+-5), height/2, 50, 50);
      prevTime2 = millis();
   }
   
   if (millis() - prevTime3 >= quarterSecondCushion)
   {
      fill(98,255,74);
      ellipse(x+random(+-10), height/2 - 50, 5, 5);
      prevTime3 = millis();
   }
   
    if (millis() - prevTime4 >= tinySecondCushion)
   {
      fill(245,157,218);
      ellipse(x+random(+-15), height/2 - 100, 2,2);
      prevTime4 = millis();
   }
   
    if (millis() - prevTime5 >= superTinyCushion)
   {
      fill(252,204, 109);
      ellipse(x+random(+-3), height/2 + 150, 10,10);
      prevTime5 = millis();
   }
   
   
}
    
  


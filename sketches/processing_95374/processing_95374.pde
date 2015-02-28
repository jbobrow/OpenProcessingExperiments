
import ddf.minim.*;

Minim minim;
AudioSample step1;AudioSample step2;AudioSample exp1;AudioSample exp2;AudioSample exp4;AudioSample exp10;AudioSample exp20;AudioSample exp50;AudioSample exp100;
AudioSample alrightNow;AudioSample alright;AudioSample doingIt;AudioSample youCanDoIt;AudioSample littleFurther;
PImage backgroundImage;PImage img;PImage img2;PImage expp;PImage expp2;PImage expp4;PImage expp10;PImage expp20;PImage expp30;PImage expp50;PImage expp100;
PImage head1; PImage head2;
PImage[] heads = new PImage[2];

PFont font;


int startTime;
final int DISPLAY_DURATION = 2000;
int startHead1;
int startHead2;
final int DISPLAY_TIME = 500;

boolean bDisplayExpp;boolean bDisplayExpp2;boolean bDisplayExpp4;boolean bDisplayExpp10;boolean bDisplayExpp20;boolean bDisplayExpp30;boolean bDisplayExpp50;boolean bDisplayExpp100;

boolean bDisplayHead1;boolean bDisplayHead2;

boolean slide;
int pauseTime = 0;
final int pauseAllowed = 1000;

float xCor = 50; float yCor = 730;

int m =millis();

char lastKey;



float currentCount;
float increaseCount;



void setup()
{
  size(1008, 750);
lastKey = '0';

currentCount = 0;
increaseCount = 0.5;
backgroundImage = loadImage("background.png");
img = loadImage("sis.png");
img2 = loadImage("sis2.png");
expp = loadImage("exp1.png");
expp2 = loadImage("exp2.png");
expp4 = loadImage("exp4.png");
expp10 = loadImage("exp10.png");
expp20 = loadImage("exp20.png");
expp50 = loadImage("exp50.png");
expp100 = loadImage("exp100.png");
head1 = loadImage("head1.png");
head2 = loadImage("head2.png");

minim = new Minim(this);

step1 = minim.loadSample("step1.wav", 512);
step2 = minim.loadSample("step2.wav", 512);
exp1 = minim.loadSample("exp1.wav", 512);
exp2 = minim.loadSample("exp2.wav", 512);
exp4 = minim.loadSample("exp4.wav", 512);
exp10 = minim.loadSample("exp1.wav", 512);
exp20 = minim.loadSample("exp20.wav", 512);
exp50 = minim.loadSample("exp50.wav", 512);
exp100 = minim.loadSample("exp100.wav", 512);
alright = minim.loadSample("alright.wav", 512);
alrightNow = minim.loadSample("alrightNow.wav", 521);
doingIt = minim.loadSample("doingIt.wav", 512);
youCanDoIt = minim.loadSample("doingIt.wav", 512);
littleFurther = minim.loadSample("littleFurther.wav", 512); 

font=loadFont("CourierNew36.vlw");
textFont(font);
}

void draw()
{
  background(0, 0, 255);
  image(backgroundImage,0, 0,1008, 750 );
 textSize(28);
  stroke(100);
  fill(120);
  ellipse(xCor, yCor, 30, 30);
  fill(255, 0, 0);
  text(currentCount,800, 700);
  text("Experience Points",  600, 650);
  
  if (xCor >= 50 && xCor < 70){
    text("Press ONE then ZERO then repeat ad absurdum!", 100, 100);
  }
  

   if (xCor > 50 && millis() - pauseTime > pauseAllowed)
    {
        xCor = xCor - 4;
    yCor = yCor + 2.5;
      pauseTime = millis () - 1200;
    }
  
  
  if(bDisplayExpp)
  {
     image(expp, xCor, millis() - startTime );
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp = false;
     }
  }
  
  if(bDisplayExpp2)
  {
     image(expp2, xCor, millis() - startTime - 100);
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp2 = false;
     }
  }
  
  if(bDisplayExpp4)
  {
     image(expp4, xCor, millis() - startTime - 200);
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp4 = false;
     }
  }
  
  if(bDisplayExpp10)
  {
     image(expp10, xCor, millis() - startTime);
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp10 = false;
     }
  }
  
   if(bDisplayExpp20)
  {
     image(expp20, xCor, millis() - startTime);
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp20 = false;
     }
  }
  
  
   if(bDisplayExpp50)
  {
     image(expp50, xCor, millis() - startTime);
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp50 = false;
     }
  }
  
   if(bDisplayExpp100)
  {
     image(expp100, xCor, millis() - startTime);
     if (millis() - startTime > DISPLAY_DURATION)
     {
       bDisplayExpp100 = false;
     }
  }
  //GOD HEAD ANIMATION
   if(bDisplayHead1)
  {
    startHead1 = millis();
    
    if(startHead1 - millis() >= DISPLAY_TIME){
       image(head2, 50, 50);
       startHead1 = millis();
     }
     if(startHead1 - millis() >= DISPLAY_TIME){
       image(head1, 50, 50);
       startHead1 = millis();
     }
     }



  if(xCor >= 982)
  {
    bDisplayHead1 = true;
  }
  
      if(xCor >= 990)
  {
    for(int i = 0; i > 30; i = i - 1){
      xCor = i;
     
    }
    for(int i = 0; i < 30; i = i + 2){
      yCor = i;
     
    
    }
       
    xCor = 50;
    yCor = 730;
}
  
  if (lastKey == '1'){
         image(img2, -50, -50);
  image(img, xCor-27, yCor);
    }else{
    if(lastKey == '0'){
      image(img, -50, -50);
      image(img2, xCor-27, yCor);
}
  }
     }
     
void keyPressed(){
  if (keyPressed) {
    if (key == '1' || key == '1') {
      if (lastKey == '0') {
       step1.trigger(); 
        xCor = xCor + 4;
   lastKey = '1';
   
     
        pauseTime = millis();
 
    }
    }


    if (key == '0' || key == '0'){
      if (lastKey == '1') {
      step2.trigger();
        yCor = yCor - 2.5;
        lastKey = '0';
   
        
        pauseTime = millis();
      }
      
   
    }
    }
      println(xCor);
      println(yCor);


    if(xCor == 75){
      exp1.trigger();
     bDisplayExpp = true;
    startTime = millis();
 currentCount += increaseCount;
 
 
  }

if(xCor == 54){
alright.trigger();
}


  if(xCor == 122){
    exp1.trigger();
    bDisplayExpp = true;
    startTime = millis();
    currentCount += increaseCount;
  }
  
  if(xCor == 134){
    doingIt.trigger();
  }
  
  
  if(xCor == 138){
    exp2.trigger();
    bDisplayExpp2 = true;
    startTime = millis();
    currentCount += increaseCount;
    currentCount += increaseCount;
  }
  
  
  
  if(xCor == 158){
    exp4.trigger();
    bDisplayExpp4 = true;
    startTime = millis();
    currentCount += increaseCount*4;
    
  }
  
  
  if(xCor == 170){
    youCanDoIt.trigger();
  }
  
  
  
  if(xCor == 198){
    exp10.trigger();
    bDisplayExpp10 = true;
    startTime = millis();
    currentCount += increaseCount*10;
    
  }
  
  if(xCor == 258){
    youCanDoIt.trigger();
  }
    
    if(xCor == 242){
    exp20.trigger();
    bDisplayExpp20 = true;
    startTime = millis();
    currentCount += increaseCount*20;
    
  }
  
  if(xCor == 326){
    alrightNow.trigger();
  }
  
  if(xCor == 338){
    exp50.trigger();
    bDisplayExpp50 = true;
    startTime = millis();
    currentCount += increaseCount*50;
    
  }
  
  if(xCor == 434){
    exp100.trigger();
    bDisplayExpp100 = true;
    startTime = millis();
    currentCount += increaseCount*100;
    
    if(xCor == 550){
      doingIt.trigger();
    }
    
    if(xCor == 606){
      alright.trigger();
    }
    
    
  }
  
  if(xCor == 590){
    exp100.trigger();
    bDisplayExpp100 = true;
    startTime = millis();
    currentCount += increaseCount*100;
    
  }
  
  
  
  
  if(xCor == 638){
    exp100.trigger();
    bDisplayExpp100 = true;
    startTime = millis();
    currentCount += increaseCount*100;
    
  }
  
  
  if(xCor == 650){
    littleFurther.trigger();
  }
  
  
  
  if(xCor == 782){
    exp100.trigger();
    bDisplayExpp100 = true;
    startTime = millis();
    currentCount += increaseCount*100;
    
  }
  
  
  if(xCor == 842){
    exp100.trigger();
    bDisplayExpp100 = true;
    startTime = millis();
    currentCount += increaseCount*100;
    
  }
  
  if(xCor == 858){
    littleFurther.trigger();
    {
  
  

  }

    

  }}


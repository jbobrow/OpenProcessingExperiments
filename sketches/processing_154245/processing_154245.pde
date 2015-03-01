
float mouthSize;
float pacX;
float pacY;
boolean increasing;
int score;


void setup()
{
 size(750,750);
background(0);
mouthSize=PI/5;
pacX=100;
pacY=height/2;
increasing=true;



}


void draw()
{
  
 pacX+=7;
 background(0);
 fill(random(255),random(255),random(255));
 textSize(60);
 text(dist(pacX,pacY,mouseX,mouseY) + " Pixels Away\nPac Man",10,600);
 //detects if mouse is on pacman, then puts message
 if(dist(pacX,pacY,mouseX,mouseY)<100)
 {
 
 text("Hey Dood",10,200);

 }

 //opens and closes mouth, with boolean increasing or not increasing
 if(increasing)
 mouthSize= mouthSize+0.1;
 
  if(!increasing)
 mouthSize=mouthSize-0.1;
 
 if(mouthSize<=0)
 increasing=true;
 
 if(mouthSize>=PI/5)
 increasing=false;
 
 if(pacX>750)
 pacX=0;
 
 //sets up dots, only draws them if they are before pacman.  detects score based on pacman's distance
 for(int pac=100; pac<=750; pac+=100)
 {
   
   if(pacX<pac)
   {
   ellipse(pac,pacY,20,20);
   }
   score = (int)(pacX/100);
   text("Score: "+ score,10,50);
   
 }

 
 
  arc(pacX, pacY,200,200, mouthSize, 2*PI-mouthSize);
  
  
  
  
}

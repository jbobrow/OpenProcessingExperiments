
 ////////////////////assignment a4b
 ////////////////////Tori Zhao
 //////////////////////////////////
 boolean isMousePressed = false;
 boolean isOn = false;
 
 final int NUMLINES = 6;
 float [] ax = new float [NUMLINES];
 float [] ay = new float [NUMLINES];

 

 float movForce = 0.05;//movement force (setup as a % of dist)
 float targetX = random(640);//target pos
 float targetY = random(480);
 float dx = 0;//displacement of circle from target
 float dy = 0;
 float dct = 0;//distance from circle to target (as the crow flies)
 float threshDist = 5;//threshold min dist for movement of circle to target
 PFont font;
 PFont fontCurrent;
 
 int wltm = 0;//what line to move
 float x;
 float y;
 
 
 void setup()
 {
   size(1200,1000);
   background(255,255,255);
   textAlign(CENTER);
   noStroke();
   
   for(int i=0; i<NUMLINES;i++)
   {
     ax[i] = random (100,width-100);
     ay[i] = random (100,height-100);
   }
     
  
}


 
void draw()
{
   fill(#621D1D);
   font = createFont("Georgia", 48); 
   textFont(font,48);
   background(255,255,255);

   if (isOn == true)
   {
      drawPoemLines();
   } 
}


 
void mousePressed()
{
   if (mouseButton == LEFT  )
   {
     isOn = true;
   }
}
 

 
void drawPoemLines()
{ 
  moveLine();
  text("poem line#1...", ax[0],ay[0]);
  text("poem line#2...", ax[1],ay[1]);
  text("poem line#3...", ax[2],ay[2]);
  text("poem line#4...", ax[3],ay[3]);
  text("poem line#5...", ax[4],ay[4]);
  text("poem line#6...", ax[5],ay[5]);
  
 
 
 
 }
 
 void moveLine()
{
   println("moving line 1");
   
   //claculate distance between this line and target
   dx = targetX - ax[wltm];//horizontally
   dy = targetY - ay[wltm];//vertically
   
   if(abs(dx) > threshDist)
    ax[wltm] += dx * movForce;//horz movement
  
  if(abs(dy) > threshDist)
    ay[wltm] += dy * movForce;//vert movement
    
  if (abs(dx) < 10 && abs(dy) < 10)
  {
    targetX = random(0, 800);
    targetY = random(0, 800);
    wltm++;//change to the next line to move
    
    if(wltm == NUMLINES)
    {
      wltm = 0;//reset
    }
  }
}

 

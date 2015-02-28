
////////////////////assignment a4b
 ////////////////////Tori Zhao
 //////////////////////////////////
 boolean isMousePressed = false;
 boolean isOn = false;
  
 final int NUMLINES = 6;
 float [] ax = new float [NUMLINES];
 float [] ay = new float [NUMLINES];
 String [] pstr = {"P1", "P2", "P3", "P4", "P5", "P6"};
  
 
 float movForce = 0.05;//movement force (setup as a % of dist)
 float targetX = random(640);//target pos
 float targetY = random(480);
 float dx = 0;//displacement of circle from target
 float dy = 0;
 float dct = 0;//distance from circle to target (as the crow flies)
 float threshDist = 5;//threshold min dist for movement of circle to target
 PFont font;
 PFont font1;
 PFont fontCurrent;
  
 int wltm = 0;//what line to move
 float x;
 float y;
  
  
 void setup()
 {
   size(800, 600);
   background(255,255,255);
   textAlign(CENTER);
   noStroke();
    
   for(int i=0; i<NUMLINES;i++)
   {
     ax[i] = random (100,width-100);
     ay[i] = random (100,height-100);
   }
   font = createFont("Georgia", 48);
   font1 = createFont("Times New Roman", 36);
   fill(#621DFF);
   textFont(font);
}
 
 
  
void draw()
{
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
     isOn = !isOn;
   }
}
  
 
  
void drawPoemLines()
{

  
  for (int i = 0; i < NUMLINES; ++i) {
      if (wltm == i) {
          textFont(font1);
          fill(#00FF00);
      }
      text(pstr[i], ax[i],ay[i]);
      textFont(font);
      fill(#621DFF);
  }
  
  moveLine();
  
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
    targetX = random(0, 640);
    targetY = random(0, 480);
    wltm++;//change to the next line to move
     
    if(wltm == NUMLINES)
    {
      wltm = 0;//reset
    }
  }
 
}

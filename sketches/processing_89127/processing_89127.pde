
ArrayList eyes;
int[] mouseLocs = new int[1000];
int m = 0;

class pairOfEyes
{
  int locX;
  int locY;
  int pupilLx;
  int pupilLy;
  int pupilRx;
  int pupilRy;
  int lastTargetX;
  int lastTargetY;
  float irx = 0;
  float iry = 0;
  float ilx = 0;
  float ily = 0;
  int mouseLocIndex = 0;
  int timer = 0;
  
  pairOfEyes(int x, int y)
  {
    locX = x;
    locY = y;
    pupilLx =locX - width/6;
    pupilLy =locY;
    pupilRx =locX + width/6;
    pupilRy =locY;
    lastTargetX = mouseX;
    lastTargetY = mouseY;
    
  }
  
  void update()
  {
    noStroke();
    fill(255);
    ellipse(locX - width/6,locY,width/4,height/6);
    ellipse(locX + width/6,locY,width/4,height/6);
  }
  void updatePupils()
  {
    int targetX= mouseX;
    int targetY= mouseY;
    
    if(mouseX - pmouseX < 1 && mouseY - pmouseY < 1 && mouseLocIndex < 98 && timer > 120)
    {
      targetX = mouseLocs[mouseLocIndex];
      targetY = mouseLocs[mouseLocIndex + 1];
      mouseLocIndex = mouseLocIndex + 2;
     
      if(mouseLocIndex > 90)
      {
        timer = 0;
         m = 0;
        for(int k = 0; k <1000; k++)
        {
          mouseLocs[k] =mouseX;
          k++;
          mouseLocs[k] =mouseY;
        }
      }
    }else{
      mouseLocIndex = 0;

    }
    
    timer++;
    fill(0,0,255);
    float pupilLeftOffsetX = constrain(targetX,locX - width/6 - 15, locX - width/6 + 15);
    float pupilLeftOffsetY = constrain(targetY,locY - 15, locY + 15);
    
    
    ellipse(pupilLeftOffsetX,pupilLeftOffsetY, 40,40);
     float pupilRightOffsetX = constrain(targetX,locX + width/6 - 15, locX + width/6 + 15);
    float pupilRightOffsetY = constrain(targetY,locY - 15, locY + 15);
    ellipse(pupilRightOffsetX,pupilRightOffsetY, 40,40);
    
    lastTargetX = mouseX;
    lastTargetY = mouseY;
  }
}

void setup()
{
  size(640,480);
  eyes = new ArrayList();
  eyes.add(new pairOfEyes(width/2,height/2));
   for(int k = 0; k <1000; k++)
        {
          mouseLocs[k] =mouseX;
          k++;
          mouseLocs[k] =mouseY;
        }
}

void draw() {
  
  mouseLocs[m] = mouseX;
  mouseLocs[m+1] = mouseY;
  m = m + 2;
  m = m % 1000;
  background(0);
 
  for(int i = 0; i < eyes.size(); i++)
  {
   ((pairOfEyes) eyes.get(i)).update();
   ((pairOfEyes) eyes.get(i)).updatePupils();
  }
  
  
}



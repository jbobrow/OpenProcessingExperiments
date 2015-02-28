
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
float xDisplace=0;
float yDisplace=0;





void setup() 
{
  size(400, 400); 
  stroke(255);
  smooth();
  fill(255, 153);
}

int framecount = 0;
 // float mouseMovementAngle =0;  //have the mouth turn
  float mouthGape = 0;

void draw()
{
  update();
  background(sin((framecount%900/900)+1)*70);
   // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for(int i = 0; i < num; i++)
  {
    mx[i]+=mouthGape*xDisplace;
    my[i]+=mouthGape*yDisplace;
  }
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
   // ellipse(mx[index], my[index], i/2, i/2);
     line(mx[(index + 1)%num], my[(index + 1)%num ], mx[index], my[index] );
    line(400-mx[(index + 1)%num], 400-my[(index + 1)%num ], 400-mx[index], 400-my[index]); 
  }
  
  
 
}

void update()
{
  framecount++;

  if(!mousePressed)
  {
      if(mouthGape > 0)
      {
        mouthGape-=1;
      }
      
  }
  else
      {
        if(mouthGape < 30)
        {
           mouthGape+=1;
        }
      }


xDisplace = ((float)mouseX-200)/20;
yDisplace = ((float)mouseY-200)/20;


}





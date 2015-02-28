

float targetX, targetY, startX, startY;
float x,y;
float distance;

int cnt=0;
  
  float a; 

  color from = color(random(255),0,random(255));
  color to = color(0, random(255),random(255));
  

void setup()
{
  //size(screen.width,screen.height);
  size(800,600);
  
  background(255);
  smooth();
  
}



void draw()

{ 
  
  a = random(1); 


  color inter = lerpColor(from, to, a);
  
  //if((abs(targetX-x)+abs(targetY-y))>4)
  //if(distance>2)
  

  if (cnt<distance) 
  {
  
  cnt+=5;
  
  x=map(cnt,0,distance,startX,targetX);
  y=map(cnt,0,distance,startY,targetY);
  
   
  bezier(0, height/2, mouseX, mouseY, x, y, width, height/2);
  
  stroke(inter);
  fill(inter,12);
  a+=0.1;
  
   }
 
}

void keyPressed()
{
  background(255);
  
  from = color(random(255),0,random(255));
  to = color(0, random(255),random(255));
}


void mouseMoved()
{
  targetX=mouseX;
  targetY=mouseY;  
  
  startX=x;
  startY=y;
  
  distance=dist(startX,startY,targetX,targetY);  
  cnt=0;
}


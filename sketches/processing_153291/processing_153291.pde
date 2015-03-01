
// James Vaughn
// 6/30/2014


PImage img;
Boolean firstTime = true;
//Agent agent;
Agent[] agents;
/* @pjs preload="Maya_400x400.jpg"; */
void setup()
{
      img = loadImage("Maya_400x400.jpg");
      size(400, 400);
     
     
}

void draw()
{
               
        if(firstTime)
        {
          image(img, 0,0);      
          agents = new Agent[1600];
          //int j = 0;
          int k = 0;
          int m = 0;
          while(k < 400)
          {
              int j = 0;
              for(int i = 0; i < 400/10; i++)
              {
                PImage c = get(j,k,10,10);               
                agents[m] = new Agent(c, new PVector(j,k));
                j=j+10;
                m= m + 1;
                
              }   
              k = k + 10;
             
          }   
         
        }        
                
       firstTime = false; 
        
        for(int i = 0; i < agents.length;i++)
        {  
          agents[i].update();         
          agents[i].display();  
         
        } 
      
       
}
//James Vaughn
// 6/30/2014

class Agent
{
      PImage pixelBox;
      PVector pos;
  
      Agent ( PImage pixelBoxStart, PVector position)
      {
        pixelBox = pixelBoxStart;
        pos = position;
              }
  
 
    void update()
    {
      fill(0,0,0);
      rect(pos.x,pos.y,10,10);
      
      float xR = random(-.5,.5);
      float yR = random(-.5,.5);
      pos.x += xR;
      pos.y += yR;
     
    }
 
 
    void display()  
    {
        
      image(pixelBox,pos.x,pos.y);
     
    }    
    
}



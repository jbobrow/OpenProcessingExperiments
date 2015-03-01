
class flocker
{
    PVector pos;
    float ang = 0;
    float spd = 1.5;
    
    float spdLimit = 3;
    int id;
    
    
    float alignSpd = 0.015;
    float repulseDist = 10;
    
    float alignDist = 13;
    float attractDist = 200;
    
    
    public flocker(float x, float y, int ind)
    {
        pos = new PVector(x, y);
        id = ind;
        spd += random()/2;
        ang = random(10)/10;
    }
    
    
    void tick(flocker[] others)
    {
    
        if(spd > spdLimit) spd = spdLimit;
    
        float nx = sin(ang) * spd;
        float ny = cos(ang) * spd;
        
        pos.x += nx;
        pos.y += ny;
        
        
        float r = 0;
        float g = 0;
        float b = 0;
        
        for(flocker other : others)
        {
          if(other.id == id)
          {
            continue;
          }
          
          float dis = abs(pos.dist(other.pos));
          if(dis < repulseDist)
          {
            r += 10;
            //turn away
            
            if(ang < other.ang + 1.07)
            {
              ang+=alignSpd;
            }
            else
            {
              ang-=alignSpd;
            }
            
            //I WANNA GET AWAY
            spd-= 0.03;
            
            //lol nasty
            break;
            
            
          }
          
          if(dis < alignDist)
          {
            g += 10;
            //move to align
            if(ang < other.ang)
            {
              ang+=alignSpd;
            }
            else if (ang > other.ang)
            {
              ang-=alignSpd;
            }
            
            //try to match velocity
            
            if(spd < other.spd)
            {
                spd+= 0.01;
            }
            if(spd > other.spd)
            {
                spd -= 0.01;
            }
            
            continue;
          }
          
          if(dis < attractDist)
          {
            b += 10;
            
            //aim towards
            float abet = PVector.angleBetween(pos, other.pos);
            
            if(ang < abet)
            {
              ang += alignSpd;
            }
            
            if(ang > abet)
            {
              ang -= alignSpd;
            }
            
            //I WANNA GET TO MAH BUDDAHS
            spd+= 0.001;
            

            continue;
          }
        }
        
        //the whole color thing is just for debugging.
        fill(r*10, g*10, b*10);
        
        ellipse(pos.x, pos.y, 10, 10);
        
        if(pos.x > width)
        {
          pos.x = 0;
        }
        if(pos.x < 0)
        {
          pos.x = width;
        }
        if(pos.y < 0)
        {
          pos.y = height;
        }
        if(pos.y > height)
        {
          pos.y = 0;
        }
        
    }
    
}


flocker[] allflockers = new flocker[60];

void setup() 
{
  size(800,800);
  background(255);  //set background white
  
  for(int i=0; i<60; i++)
  {
      allflockers[i] = new flocker(random(width), random(height), i);
  }
  
}



void draw() 
{  
  background(255);
  for(flocker flo : allflockers)
  {
      flo.tick(allflockers);
  }
}

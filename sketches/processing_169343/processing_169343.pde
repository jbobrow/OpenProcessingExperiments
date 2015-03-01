
class flocker
{
    PVector pos;
    float ang = 0;
    float spd = 1.5;
    
    float spdLimit = 3;
    int id;

    
    float alignSpd = 0.2;
    float repulseDist = 13;
    
    float alignDist = 23;
    float attractDist = 400;
    
    
    public flocker(float x, float y, int ind)
    {
        pos = new PVector(x, y);
        id = ind;
        spd += random()/2;
        ang = random(10)/1000;
    }
    
    
    void tick(flocker[] others)
    {

        if(ang > TWO_PI) ang -= TWO_PI;
  
        for(flocker other : others)
        {
          if(other.id == id)
          {
            continue;
          }
          
          float dis = abs(pos.dist(other.pos));
          if(dis < repulseDist)
          {
            //turn away
            
            if(ang < other.ang + 0.07)
            {
              ang+=alignSpd / dis;
            }
            else
            {
              ang-=alignSpd / dis;
            }
            
            //lol nasty
            continue;
            
            
          }
          
          if(dis < alignDist)
          {
           
            //move to align
            if(ang < other.ang)
            {
              ang+= (alignSpd * abs(ang - other.ang)) / dis;
            }
            else if (ang > other.ang)
            {
              ang-= (alignSpd * abs(ang - other.ang)) / dis;
            }
            
            //try to match velocity?
            continue;
          }
          
          if(dis < attractDist)
          {
            //aim towards
            float abet = PVector.angleBetween(pos, other.pos);
            
            if(ang < abet)
            {
              ang += (alignSpd * abet)/(dis/4);
            }
            
            if(ang > abet)
            {
              ang -= (alignSpd * abet)/(dis/4);
            }
            continue;
          }
        }
        
        stroke(0,0,0,30);
        strokeWeight(2);
        
        point(pos.x, pos.y);
        
        if(pos.x > width)
        {
          pos.x = width;
          ang+=0.01;
        }
        if(pos.x < 0)
        {
          pos.x = 0;
          ang += 0.01;
        }
        if(pos.y < 0)
        {
          pos.y = 0;
          ang *=2;
        }
        if(pos.y > height)
        {
          pos.y = height;
          ang *=2;
        }
        
        if(spd > spdLimit) spd = spdLimit;
    
        float nx = sin(ang) * spd;
        float ny = cos(ang) * spd;
        
        pos.x += nx;
        pos.y += ny;
    }
    
}


flocker[] allflockers = new flocker[20];

void setup() 
{
  size(500, 500);
  background(255);  //set background white
  
  for(int i=0; i<30; i++)
  {
      allflockers[i] = new flocker(random(100), random(100), i);
  }
  
}



void draw() 
{  
  //background(255);
  for(flocker flo : allflockers)
  {
      flo.tick(allflockers);
  }
}

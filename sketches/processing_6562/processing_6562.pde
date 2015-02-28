
class Fleet {
  
  ArrayList ships;
  
  Fleet() {
    ships = new ArrayList();  // Initialize the arraylist
    }
    
    void run(Ordinance ord, Fleet self)
    {
      for(int i = 0; i < ships.size()-1; i++) {
      Ship b = (Ship) ships.get(i);  
      if(b.loc.x > width)
        {
          b.loc.x = b.loc.x-width;
        }
      else if(b.loc.x<0)
        {
          b.loc.x =b.loc.x+width;
        }
      if(b.loc.y <0)
      {
        b.loc.y = b.loc.y + height;
      }
      else if(b.loc.y >height)
      {
        b.loc.y = b.loc.y -height;
      }
      
      }
     for(int i = 0; i < ships.size()-1; i++) {
      Ship b = (Ship) ships.get(i);  
        //here we run through the ordinance to check for collisions
        for(int s = 0; s< ord.shots.size(); s++)
        {
          Shot c = (Shot) ord.shots.get(s); 
          if(PVector.dist(b.loc, c.loc) <15)
            {
              c.age = 0;
              b.age = b.age-1;
              b.acc.mult(0.1);
              score = score + 0.1;
            }
        }
        if(b.age > 0)
          {
            if (fl){b.flock(self);}
            else{ b.run(false);}  //
          }
        else
          {
            ships.remove(b);
          }
    }
    }
    void rand_shot()
    {
      Ship b = (Ship) ships.get(int(random(ships.size())));
      b.shooting=true;
    }
      
      
   void addShip(Ship b) {
    ships.add(b);
    }
   int fleetsize(){
      return ships.size();
    }
    void scatter()
    {
      for(int i = 0; i < ships.size()-1; i++) 
      {
        Ship b = (Ship) ships.get(i);  
        b.vel = new PVector(random(-5,5),random(-5,5));
      }
    }
    void halt()
    {
      for(int i = 0; i < ships.size()-1; i++) 
      {
        Ship b = (Ship) ships.get(i);  
        b.vel = new PVector(0,0);
        b.acc = new PVector(0,0);
      }
    }
    void advance()
    {
      for(int i = 0; i < ships.size()-1; i++) 
      {
        Ship b = (Ship) ships.get(i);  
        b.vel = new PVector(random(-1,1),random(0,1));
        b.acc = new PVector(0,0);
      }
    }
    void retreat()
    {
      for(int i = 0; i < ships.size()-1; i++) 
      {
        Ship b = (Ship) ships.get(i);  
        b.vel = new PVector(random(-1,1),random(-1,0));
        b.acc = new PVector(0,0);
      }
    }
    void steer(Ordinance incoming)
    {
      for(int i = 0; i < ships.size()-1; i++) 
        {
          Ship b = (Ship) ships.get(i);  
          b.acc = new PVector(0,0,0);
          b.vel = new PVector(0,0,0);
          if(heroright && !heroleft)
            {
              b.loc.x = b.loc.x+5;
              if(b.loc.x >width)
                {
                  b.loc.x = width;
                }
            }
          if(heroleft && !heroright)
            {
              b.loc.x = b.loc.x-5;
              if(b.loc.x <0)
              {
                b.loc.x = 0;
              }
            } 
        for(int s = 0; s< incoming.shots.size(); s++)
          {
            Shot c = (Shot) incoming.shots.get(s); 
            if(PVector.dist(b.loc, c.loc) <15)
              {
                  score = score-1;
                  c.age=0;
              }
          }
         b.run(true);
      }
    }
}


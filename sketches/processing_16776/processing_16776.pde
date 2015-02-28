
class Animal
{
  //See: detect()
  float xSpeedChangeA;
  float ySpeedChangeA;
  float xSpeedChangeB;
  float ySpeedChangeB;
  float xSpeedChangeC;
  float ySpeedChangeC;
  float xSpeedChangeD;
  float ySpeedChangeD;
  float setDetect;
  //Traits
  int ID;
  boolean live = false;
  boolean fertile = false;
  float xpos;
  float ypos;
  float xSpeed;
  float ySpeed;
  ///Diet
  boolean carnivore;
  boolean herbivore;
  float plantEff;
  float meatEff;
  ///Color
  float pigmentR;
  float pigmentG;
  float pigmentB;
  ///Speed
  float topSpeed;
  float restSpeed;
  ///Size
  float radius;
  ///Energy
  float maxEnergy;
  float energy;
  ///Stimuli
  float sightDist;
  float pigRUPA;
  float pigRUPB;
  float pigRUPC;
  float pigRUPD;
  float pigRDOWNA;
  float pigRDOWNB;
  float pigRDOWNC;
  float pigRDOWND;
  float pigGUPA;
  float pigGUPB;
  float pigGUPC;
  float pigGUPD;
  float pigGDOWNA;
  float pigGDOWNB;
  float pigGDOWNC;
  float pigGDOWND;
  float pigBUPA;
  float pigBUPB;
  float pigBUPC;
  float pigBUPD;
  float pigBDOWNA;
  float pigBDOWNB;
  float pigBDOWNC;
  float pigBDOWND;
  ///Instincts
  boolean pigDetectA;
  boolean pigDetectB;
  boolean pigDetectC;
  boolean pigDetectD;
  float courseChangeA;
  float courseChangeB;
  float courseChangeC;
  float courseChangeD;
  float speedChangeA;
  float speedChangeB;
  float speedChangeC;
  float speedChangeD;
  
  
  
  
  
  
  
  
  
  Animal()
  {
  } 
  
  void live()
  {
    ///Draw
    fill(pigmentR, pigmentG, pigmentB);
    noStroke();
    ellipseMode(CENTER);
    ellipse(xpos, ypos, radius, radius);
  }
  
  void move()
  {
   ///Move
    xpos = xpos + xSpeed;
    ypos = ypos + ySpeed;
    energy = energy - ((abs(xSpeed) + abs(ySpeed)) * (radius / 10));
  }
  
  void detect()
  {
    pigDetectA = false;
    pigDetectB = false;
    pigDetectC = false;
    pigDetectD = false;
    for(int i = 0; i < 2000; i++)
    {
      if(ID != animals[i].ID)
      {
        if(animals[i].live == true)
        {
          if(dist(xpos, ypos, animals[i].xpos, animals[i].ypos) < (sightDist + (radius / 2) + (animals[i].radius / 2)))
          {
            if((animals[i].pigmentR <= pigRUPA)&&(animals[i].pigmentR >= pigRDOWNA))
            {
              if((animals[i].pigmentG <= pigGUPA)&&(animals[i].pigmentG >= pigGDOWNA))
              {
                if((animals[i].pigmentB <= pigBUPA)&&(animals[i].pigmentB >= pigBDOWNA))
                {
                  pigDetectA = true;
                  xSpeedChangeA = ((animals[i].xpos - xpos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  ySpeedChangeA = ((animals[i].ypos - ypos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  if(speedChangeA < topSpeed)
                  {
                    xSpeedChangeA = xSpeedChangeA * speedChangeA;
                    ySpeedChangeA = ySpeedChangeA * speedChangeA;
                  }
                  else
                  {
                    xSpeedChangeA = xSpeedChangeA * topSpeed;
                    ySpeedChangeA = ySpeedChangeA * topSpeed;
                  }
                }
              }
            }
            if((animals[i].pigmentR <= pigRUPB)&&(animals[i].pigmentR >= pigRDOWNB))
            {
              if((animals[i].pigmentG <= pigGUPB)&&(animals[i].pigmentG >= pigGDOWNB))
              {
                if((animals[i].pigmentB <= pigBUPB)&&(animals[i].pigmentB >= pigBDOWNB))
                {
                  pigDetectB = true;
                  xSpeedChangeB = ((animals[i].xpos - xpos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  ySpeedChangeB = ((animals[i].ypos - ypos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  if(speedChangeB < topSpeed)
                  {
                    xSpeedChangeB = xSpeedChangeB * speedChangeB;
                    ySpeedChangeB = ySpeedChangeB * speedChangeB;
                  }
                  else
                  {
                    xSpeedChangeB = xSpeedChangeB * topSpeed;
                    ySpeedChangeB = ySpeedChangeB * topSpeed;
                  }
                }
              }
            }
            if((animals[i].pigmentR <= pigRUPC)&&(animals[i].pigmentR >= pigRDOWNC))
            {
              if((animals[i].pigmentG <= pigGUPC)&&(animals[i].pigmentG >= pigGDOWNC))
              {
                if((animals[i].pigmentB <= pigBUPC)&&(animals[i].pigmentB >= pigBDOWNC))
                {
                  pigDetectC = true;
                  xSpeedChangeC = ((animals[i].xpos - xpos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  ySpeedChangeC = ((animals[i].ypos - ypos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  if(speedChangeC < topSpeed)
                  {
                    xSpeedChangeC = xSpeedChangeC * speedChangeC;
                    ySpeedChangeC = ySpeedChangeC * speedChangeC;
                  }
                  else
                  {
                    xSpeedChangeC = xSpeedChangeC * topSpeed;
                    ySpeedChangeC = ySpeedChangeC * topSpeed;
                  }
                }
              }
            }
            if((animals[i].pigmentR <= pigRUPD)&&(animals[i].pigmentR >= pigRDOWND))
            {
              if((animals[i].pigmentG <= pigGUPD)&&(animals[i].pigmentG >= pigGDOWND))
              {
                if((animals[i].pigmentB <= pigBUPD)&&(animals[i].pigmentB >= pigBDOWND))
                {
                  pigDetectD = true;
                  xSpeedChangeD = ((animals[i].xpos - xpos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  ySpeedChangeD = ((animals[i].ypos - ypos) / (abs(animals[i].xpos - xpos) + abs(animals[i].ypos - ypos)));
                  if(speedChangeD < topSpeed)
                  {
                    xSpeedChangeD = xSpeedChangeD * speedChangeD;
                    ySpeedChangeD = ySpeedChangeD * speedChangeD;
                  }
                  else
                  {
                    xSpeedChangeD = xSpeedChangeD * topSpeed;
                    ySpeedChangeD = ySpeedChangeD * topSpeed;
                  }
                }
              }
            }
          }
        }
      }
      
      if(plants[i].live == true)
      {
        if(dist(xpos, ypos, plants[i].xpos, plants[i].ypos) < (sightDist + (radius / 2) + (2)))
        {
          if((pigRUPA >= 50)&&(pigRDOWNA <= 50))
          {
            if((200 <= pigGUPA)&&(200 >= pigGDOWNA))
            {
              if((50 <= pigBUPA)&&(50 >= pigBDOWNA))
              {
                pigDetectA = true;
                xSpeedChangeA = ((plants[i].xpos - xpos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                ySpeedChangeA = ((plants[i].ypos - ypos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                if(speedChangeA < topSpeed)
                {
                  xSpeedChangeA = xSpeedChangeA * speedChangeA;
                  ySpeedChangeA = ySpeedChangeA * speedChangeA;
                }
                else
                {
                  xSpeedChangeA = xSpeedChangeA * topSpeed;
                  ySpeedChangeA = ySpeedChangeA * topSpeed;
                }
              }
            }
          }
          if((50 <= pigRUPB)&&(50 >= pigRDOWNB))
          {
            if((200 <= pigGUPB)&&(200 >= pigGDOWNB))
            {
              if((50 <= pigBUPB)&&(50 >= pigBDOWNB))
              {
                pigDetectB = true;
                xSpeedChangeB = ((plants[i].xpos - xpos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                ySpeedChangeB = ((plants[i].ypos - ypos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                if(speedChangeB < topSpeed)
                {
                  xSpeedChangeB = xSpeedChangeB * speedChangeB;
                  ySpeedChangeB = ySpeedChangeB * speedChangeB;
                }
                else
                {
                  xSpeedChangeB = xSpeedChangeB * topSpeed;
                  ySpeedChangeB = ySpeedChangeB * topSpeed;
                }
              }
            }
          }
          if((50 <= pigRUPC)&&(50 >= pigRDOWNC))
          {
            if((200 <= pigGUPC)&&(200 >= pigGDOWNC))
            {
              if((50 <= pigBUPC)&&(50 >= pigBDOWNC))
              {
                pigDetectC = true;
                xSpeedChangeC = ((plants[i].xpos - xpos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                ySpeedChangeC = ((plants[i].ypos - ypos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                if(speedChangeC < topSpeed)
                {
                  xSpeedChangeC = xSpeedChangeC * speedChangeC;
                  ySpeedChangeC = ySpeedChangeC * speedChangeC;
                }
                else
                {
                  xSpeedChangeC = xSpeedChangeC * topSpeed;
                  ySpeedChangeC = ySpeedChangeC * topSpeed;
                }
              }
            }
          }
          if((50 <= pigRUPD)&&(50 >= pigRDOWND))
          {
            if((200 <= pigGUPD)&&(200 >= pigGDOWND))
            {
              if((50 <= pigBUPD)&&(50 >= pigBDOWND))
              {
                pigDetectD = true;
                xSpeedChangeD = ((plants[i].xpos - xpos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                ySpeedChangeD = ((plants[i].ypos - ypos) / (abs(plants[i].xpos - xpos) + abs(plants[i].ypos - ypos)));
                if(speedChangeD < topSpeed)
                {
                  xSpeedChangeD = xSpeedChangeD * speedChangeD;
                  ySpeedChangeD = ySpeedChangeD * speedChangeD;
                }
                else
                {
                  xSpeedChangeD = xSpeedChangeD * topSpeed;
                  ySpeedChangeD = ySpeedChangeD * topSpeed;
                }
              }
            }
          }
        } 
      }
    }
  }
  
  void metabolism()
  {
    if(live == true)
    {
      energy = energy - (radius / 100);
    }
  }
  
  void decide()
  {
    setDetect = 0;
    if((xpos + (radius / 2)) > width)
    {
      xSpeed = abs(xSpeed) * - 1;
    }
    if((xpos - (radius / 2)) < 0)
    {
      xSpeed = abs(xSpeed);
    }
    
    if((ypos + (radius / 2)) > height)
    {
      ySpeed = abs(ySpeed) * -1;
    }
    if((ypos - (radius / 2)) < 0)
    {
      ySpeed = abs(ySpeed);
    }
    
    if((pigDetectA == true)&&(courseChangeA != 0))
    {
      xSpeed = (xSpeedChangeA * courseChangeA);
      ySpeed = (ySpeedChangeA * courseChangeA);
    }
    else
    {
      setDetect = setDetect + 1;
    }
    
    if((pigDetectB == true)&&(courseChangeB != 0))
    {
      xSpeed = (xSpeedChangeB * courseChangeB);
      ySpeed = (ySpeedChangeB * courseChangeB);
    }
    else
    {
      setDetect = setDetect + 1;
    }
    
    if((pigDetectC == true)&&(courseChangeC != 0))
    {
      xSpeed = (xSpeedChangeC * courseChangeC);
      ySpeed = (ySpeedChangeC * courseChangeC);
    }
    else
    {
      setDetect = setDetect + 1;
    }
    
    if((pigDetectD == true)&&(courseChangeD != 0))
    {
      xSpeed = (xSpeedChangeD * courseChangeD);
      ySpeed = (ySpeedChangeD * courseChangeD);
    }
    else
    {
      setDetect = setDetect + 1;
    }
    
    if(setDetect == 4)
    {
      tempSpeed = abs(xSpeed);
      xSpeed = ((xSpeed / ((abs(xSpeed)) + (abs(ySpeed)))) * restSpeed);
      ySpeed = ((ySpeed / ((tempSpeed) + (abs(ySpeed)))) * restSpeed);
      tempSpeed = 0;
    } 
  }
    
    
  
  void eat()
  {
    if(live == true)
    {
      if(herbivore == true)
      {
        for(int i = 0; i < 2000; i++)
        {
          if(dist(xpos, ypos, plants[i].xpos, plants[i].ypos) < ((radius/2) + 4))
          {
            if(plants[i].live == true)
            {
              plants[i].live = false;
              flora = flora - 1;
              energy = energy + (75 * (plantEff / 100));
              if(energy > maxEnergy)
              {
                energy = maxEnergy;
              }
            }
          }
        }
      }
      
      if(carnivore == true)
      {
        for(int i = 0; i < 2000; i++)
        {
          if(dist(xpos, ypos, animals[i].xpos, animals[i].ypos) < ((radius/2) + (animals[i].radius / 2)))
          {
            if(animals[i].live == true)
            {
              if((xpos == animals[i].xpos)&&(ypos == animals[i].ypos)&&(xSpeed == animals[i].xSpeed)&&(ySpeed == animals[i].ySpeed))
              {
              }
              else
              {
                if(animals[i].carnivore == false)
                {
                  animals[i].live = false;
                  fauna = fauna - 1;
                  energy = energy + ((animals[i].energy / 4) * (meatEff / 100));
                }
                else
                {
                  if(animals[i].radius <= radius)
                  {
                    animals[i].live = false;
                    fauna = fauna - 1;
                    energy = energy + ((animals[i].energy / 4) * (meatEff / 100));
                  }
                }
                    
                if(energy > maxEnergy)
                {
                  energy = maxEnergy;
                }
              }
            }
          }
        }
      }
      
      if(energy < 1)
      {
        live = false;
        fauna = fauna - 1;
      }
    }
  }
  
}


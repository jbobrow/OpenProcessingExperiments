
class drop // a raindrop
{
  float x;
  float z;
  float y;
  float size;
  int times;
  int id;
  drop(int s, int i, float x_, float z_)
  {
    size = s;
    times = millis();
    id = i;
    x = x_;
    z = z_;
  }
  void move()
  {
    //move the raindrops. SPLASH (boom) IF APPROPRIATE
    y = -300 + 4.9*pow((float)(millis()-times)/50, 2);
    if (y>WATER_HEIGHT-100)
    {
      boom();
    }
  }
  void update_id(int i)
  {
    id = i;
  }
  void boom() //splash!
  {
    drops.remove(id);
    for (int i = 0; i < drops.size(); i++)
    {
      //update the ids. because. otherwise confusing.
      drop getty = (drop) drops.get(i);
      getty.update_id(i);
    }
    //key part here
    grid[int(map(x,width/2-XDIST/2,width/2+XDIST/2,0,XNUM-1))][int(map(z,-800-ZDIST/2,-800+ZDIST/2,0,ZNUM-1))][currentbuffer] += size*5;
  }
  void show()
  {
    translate(x,y,z);
    sphere(size/2);
    translate(-x,-y,-z);
  }
}

class dropdropper //raincloud
{
  float x;
  float z;
  dropdropper(float x_, float z_)
  {
    x = x_;
    z = z_;
  }
  void drop(int s)
  {
    //add a raindrop and then move the dropper a bit
    drops.add(new drop(s,drops.size(),x,z));
    x = constrain(x+random(-20,20),width/2-XDIST/2,width/2+XDIST/2);
    z = constrain(z+random(-20,20),-800-ZDIST/2,-800+ZDIST/2);
  }    
}

void addDrops(int s)
{
  //add a drop for each dropper
  for(int i = 0; i < dropdroppers.size(); ++i)
  {
    dropdropper d = (dropdropper) dropdroppers.get(i);
    d.drop(s);
  }
}

int sec = 0;
void doDrops() //do all the raindrops stuff
{
  while(dropdroppers.size()<minute())
  {
    dropdroppers.add(new dropdropper(width/2+random(-XDIST/2,XDIST/2),-800+random(-ZDIST/2,ZDIST/2)));
  }
  if(minute() == 0 && dropdroppers.size() != 0)
  {
    dropdroppers.clear();
  }
  int dep = second();
  if(dep!=sec)
  {
    sec = dep;
    if(sec == 0)
    {
      if(minute() == 0)
      {
        addDrops(200);
      }
      else
      {
        addDrops(75);
      }
    }
    else
    {
      addDrops(20);
    }
  }
   for (int i = 0; i < drops.size(); i++)
    {
      drop getty = (drop) drops.get(i);
      getty.move();
      //getty.show(); //i commented this out because sphere() is too laggy
    }
}


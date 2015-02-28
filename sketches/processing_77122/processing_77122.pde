
ArrayList circles;

void setup()
{
  size(600,600);
  //frameRate(1);
  circles = new ArrayList();
}

void draw()
{
  background(150);
  for (int i = 0; i<circles.size(); i++)
  {
    Circle c = (Circle) circles.get(i);
    c.display();
    c.update();
  }
}

void mousePressed()
{
  circles.add(new Circle(circles.size()));
}


class Circle
{
  PVector pos, vel, acc;
  float pulseFreq, diameter, posDist;
  color rgb;



  Circle(int i)
  {
    pos = new PVector (mouseX, mouseY);
    pulseFreq = map(random(1), 0, 1, .01, .06);
    rgb = color(random(255), random(255), random(255));
    diameter = 20;
    vel = new PVector (0,0);
    
  }

  void update()
  {
    
    for (int i = 0; i<circles.size(); i++)
    {
      Circle c = (Circle) circles.get(i);
      posDist = PVector.dist(pos, c.pos);
    
    
    
    //diameter = map(sin(frameCount*pulseFreq), 1, -1, 20, 40);
    //--------
    acc = new PVector (c.pos.x - pos.x, c.pos.y - pos.y);
    //acc.mult(posDist);
    acc.mult(.0005);
    
    collision();
    
    vel.add(acc);
    //--------
    
    speedCap();
    
    //---------
    pos.add(vel);
    //-----------

    border(); 
    }
    
    //-----------
  }

  void display()
  {
    
    
    //    ellipse(pos.x, pos.y, map(sin(frameCount*pulseFreq),0,1,20,40), map(sin(frameCount*pulseFreq),0,1,20,40));
    fill(rgb);
    ellipse(pos.x, pos.y, diameter, diameter);
    //fill(rgb);  placing here changes color of first circle each click while rest are independent
  }
  
  void border()
  {
    if (pos.x> width)
    {
      vel.x = -vel.x;
    }
    
    if (pos.x < 0)
    {
      vel.x = -vel.x;
    }
    
    if (pos.y > height)
    {
      vel.y = -vel.y;
    }
    
    if (pos.y < 0)
    {
      vel.y = -vel.y;
    }
  }
  
  void speedCap()
  {
      if ( vel.x > 5)
    {
      vel.x = 5;
    }
    
    if ( vel.x < -5)
    {
      vel.x = -5;
    }
    
    if (vel.y > 5)
    {
      vel.y = 5;
    }
    
    if (vel.y < -5)
    {
      vel.y = -5;
    }
  }
  
  void collision()
  {
    for (int i = 0; i<circles.size(); i++)
    {
      Circle c = (Circle) circles.get(i);
      
       if (PVector.dist(pos,c.pos) < diameter/2 && PVector.dist(pos,c.pos) > 0)  //or assign an id to ech individual to check agaisnt self
       {
         vel.mult(-1);
       }

      //if (PVector.dist(pos,c.pos) < diameter/2 )
    //  {
      //  vel.mult(-1);
     // }
    }
     
  }
}




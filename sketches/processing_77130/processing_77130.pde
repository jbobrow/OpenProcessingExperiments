
ArrayList circles;
float G;

void setup()
{
  size(200,200);
  circles = new ArrayList();
  G = 2;
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
  circles.add(new Circle(circles.size())); //(circles.size numbers)
}


class Circle
{
  PVector pos, vel, acc;
  float pulseFreq, diameter, posDist;
  color rgb;
  float m1, m2;
  int id;



  Circle(int number) //temp name
  {
    pos = new PVector (mouseX, mouseY);
    //posOut = new PVector (0,0);
    pulseFreq = map(random(1), 0, 1, .01, .06);
    rgb = color(random(255), random(255), random(255));
    diameter = 20;
    vel = new PVector (0,0);
    m1 = 1;
    id = number; //assigned to permanent
    
  }

  void update()
  {
    
    for (int i = 0; i<circles.size(); i++)
    {
     
      Circle c = (Circle) circles.get(i);
      
      if( i != id )
      {
      
        //posDist = PVector.dist(pos, c.pos); doesn't matter cause dist is same value
        posDist = PVector.dist(c.pos, pos);
        
        m2 = c.m1;
      
      
      
      //diameter = map(sin(frameCount*pulseFreq), 1, -1, 20, 40);
      //--------
      //acc = new PVector (c.pos.x - pos.x, c.pos.y - pos.y);
      
      //acc.mult(posDist);
      //acc = PVector.dist(pos, c.pos);   will not work because returns float
      //acc = PVector.sub(pos, c.pos);
      acc = PVector.sub(c.pos, pos);
      println(acc);
      acc.normalize();
      acc.mult((G*((m1*c.m2)/sq(posDist))));
      //acc.mult(1000);
      //}
      
      vel.add(acc);
      //--------
      
      border();
      
      speedCap();
      
      collision();
      
       
      
      //---------
      pos.add(vel);
      //-----------
  
      
      //println(acc);
      //println(pos);
    }
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
      
//      if (PVector.dist (pos, c.pos) < diameter/2 && PVector.dist(pos, c.pos) > 0) //testing against own location to ignore self
      if (PVector.dist (pos, c.pos) < diameter && i != id)
      {
        vel.mult(-1);
      }
    }
  }

}




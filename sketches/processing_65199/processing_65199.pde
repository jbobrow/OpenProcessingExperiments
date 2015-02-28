
// All organisms appearing in this work are fictitious.
// Any resemblance to actual biology is purely coincidental! ;-)

LinkedList<Virus> viruses;
Cell cell;
PGraphics backgroundGraphic;

void setup()
{
  size(900,600);
  smooth();

  viruses = new LinkedList<Virus>();
  cell = new Cell();
  cell.activate();

  for (int n = 0; n < 15; ++n)
  {
    Virus virus = new Virus(random(width/2) + (width/4), random(height/2) + (height/4));
    viruses.add(virus);
  }
  
  // A bit of noise beats a plain background
  final float step = 0.005;
  backgroundGraphic = createGraphics(width, height, JAVA2D);
  backgroundGraphic.beginDraw();
  for (int x = 0; x < width; ++x)
  {
    for (int y = 0; y < height; ++y)
    {
      backgroundGraphic.set(x,y,color(0,noise(x*step,y*step)*255,0));
    }
  }
  backgroundGraphic.endDraw();
}

void draw()
{
  image(backgroundGraphic, 0, 0);
  
  //
  // Draw viruses
  //
  ListIterator<Virus> itr = viruses.listIterator();
  while (itr.hasNext())
  {
    Virus virus = itr.next();
    virus.move();
    virus.draw();

    if (virus.position.x < -50 || virus.position.x > width + 50
    ||  virus.position.y < -50 || virus.position.y > height + 50)
    {
      itr.remove();
    }
  }

  //
  // Draw cell
  //
  if (cell.active == false && viruses.size() < 60)
  {
    cell.activate();
  }

  cell.move();
  cell.draw();
  cell.infect();
}

class Virus
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  float orientation;
  float rotation;

  Virus(float x, float y)
  {
    position.x = x;
    position.y = y;
    velocity.x = random(-0.2,0.2);
    velocity.y = random(-0.2,0.2);
    orientation = random(TWO_PI);
    rotation = random(-0.01, 0.01);
  }

  void draw()
  {
    strokeWeight(1);
    stroke(32,128);
    fill(32,128);
  
    pushMatrix();
    translate(position.x, position.y - 20);
    rotate(orientation);
    drawBacteriophage();
    popMatrix();
  }

  void move()
  {
    position.x += velocity.x;
    position.y += velocity.y;
    orientation += rotation;
  }
    
  void drawBacteriophage()
  {
    final float xCentre = 0;
    final float yHead   = -35;
    final float headRadius = 15;
    final float yBottom = 0;
    final float tailWidth = 5;
    final float yFibreStart = -7.5;
    final float xToFibreTop = 7.5;
    final float yFibreTop = -15;
    final float xToFibreEnd = 15;

    // Draw right tail fibre
    line(xCentre, yFibreStart, xCentre + xToFibreTop, yFibreTop);
    line(xCentre + xToFibreTop, yFibreTop, xCentre + xToFibreEnd, yBottom);
  
    // Draw left tail fibre
    line(xCentre, yFibreStart, xCentre - xToFibreTop, yFibreTop);
    line(xCentre - xToFibreTop, yFibreTop, xCentre - xToFibreEnd, yBottom);
  
    // Draw tail
    triangle(xCentre - (tailWidth/2), yHead, xCentre + (tailWidth/2), yHead, xCentre, yBottom);
    
    // Draw head
    ellipse(xCentre, yHead, headRadius, headRadius);
  }
};

class Cell
{
  int vertices = 15;
  PVector position[];
  PVector velocity[];
  PVector centre = new PVector();
  float area;

  float pressure = 500;
  final float hookesConstant = 0.00013;
  final float initialRadius = 200;
 
  boolean active = false;
  float infected = 0;
  boolean spawned = false;
    
  Cell()
  {
    position = new PVector[vertices];
    velocity = new PVector[vertices];

    for (int n = 0; n < vertices; ++n)
    {
      position[n] = new PVector();
      velocity[n] = new PVector();
    }
  }
  
  void activate()
  {
    active = true;
    infected = 0;
    spawned = false;
    pressure = 500;
    
    float angle = random(TWO_PI);
    float distance = dist(0,0,width,height) / 2;
    distance += initialRadius * 1.1;

    float basePositionX = (width * 0.5)  + (distance * cos(angle));
    float basePositionY = (height * 0.5) + (distance * sin(angle));

    float baseSpeed = 0.5;
    
    float baseVelocityX = baseSpeed * cos(angle + PI);
    float baseVelocityY = baseSpeed * sin(angle + PI);
    
    for (int n = 0; n < vertices; ++n)
    {
      position[n].x = basePositionX + (initialRadius * cos(TWO_PI * n / (vertices)));
      position[n].y = basePositionY + (initialRadius * sin(TWO_PI * n / (vertices)));
      velocity[n].x = baseVelocityX + random(-0.2,0.2);
      velocity[n].y = baseVelocityY + random(-0.2,0.2);
    }
  }

  void draw()
  {
    if (active == false)
      return;

    float cellAlpha = 255;
    if (infected > 50)
    {
      cellAlpha -= (infected - 50) * 6;
    }

    strokeWeight(5);
    stroke(255, cellAlpha);
    fill(128+infected, 128-infected, 128-infected, cellAlpha);
    
    beginShape();
    for (int n = 0; n < vertices; ++n)
    {
      curveVertex(position[n].x, position[n].y);
    }    
    curveVertex(position[0].x, position[0].y);
    curveVertex(position[1].x, position[1].y);
    curveVertex(position[2].x, position[2].y);
    endShape();
  }

  float twiceTriangleArea(float x1, float y1, float x2, float y2, float x3, float y3)
  {
    return abs( ((x1*(y2-y3)) + (x2*(y3-y1)) + (x3*(y1-y2))) );
  }

  void updateCentreAndArea()
  {
    centre.x = 0;
    centre.y = 0;
    area = 0;
    
    for (int n = 0; n < vertices; ++n)
    {
      centre.x += position[n].x;
      centre.y += position[n].y;
    }
  
    centre.x /= vertices;
    centre.y /= vertices;

    // Calculate area (assumes the cell wall stays reasonably well behaved)
    for (int n = 0; n < vertices; ++n)
    {
      int nNext = (n + 1) % vertices;
      area += twiceTriangleArea(centre.x,centre.y,position[n].x,position[n].y,position[nNext].x,position[nNext].y);
    }

    area /= 2;
  }

  void move()
  {
    if (active == false)
      return;
    
    updateCentreAndArea();
    
    for (int n = 0; n < vertices; ++n)
    {
      // Newton's first law of motion
      position[n].x += velocity[n].x;
      position[n].y += velocity[n].y;
      
      int nNext = (n + 1) % vertices;

      // Hooke's law
      float xForce = hookesConstant * (position[n].x - position[nNext].x);
      float yForce = hookesConstant * (position[n].y - position[nNext].y);
      
      velocity[n].x -= xForce;
      velocity[n].y -= yForce;
      velocity[nNext].x += xForce;
      velocity[nNext].y += yForce;
    }
    
    // Something a bit like pressure
    float force = pressure / area;
    for (int n = 0; n < vertices; ++n)
    {
      float distance = dist(centre.x, centre.y, position[n].x, position[n].y);
      velocity[n].x += (position[n].x - centre.x) * force / distance;
      velocity[n].y += (position[n].y - centre.y) * force / distance;
    }
    
    // And some sort of friction
    if (infected > 0)
    {
      for (int n = 0; n < vertices; ++n)
      {
        velocity[n].x *= 0.995;
        velocity[n].y *= 0.995;
      }
    }
  }
  
  void infect()
  {
    if (active == false)
      return;
    
    if (infected > 0)
    {
      infected += 0.1;
      if (infected > 50 && spawned == false)
      {
        for (int n = 0; n < 25; ++n)
        {
          Virus virus = new Virus(centre.x + random(50) - 25, centre.y + random(50) - 25);
          viruses.add(virus);
        }
        
        spawned = true;
      }

      if (infected > 40)
      {
        // Lysis (virus forces cell to burst)
        pressure += 2;
      }

      if (infected > 100)
      {
        active = false;
      }
    }
    else
    {
      ListIterator<Virus> itr = viruses.listIterator();
      while (itr.hasNext())
      {
        Virus virus = itr.next();
        if (dist(centre.x, centre.y, virus.position.x, virus.position.y) < 100)
        {
          infected = 1;
          itr.remove();
        }
      }
    }
  }
  
};




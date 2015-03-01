
ArrayList <Mover> m;

PVector food = new PVector(0, 0, 0);

int nextFoodCounter = 0;
int nextFoodAppearsIn = (int) random (20, 100);
boolean generateNewFood = false;

void setup ()
{
  size (800, 400);
  smooth();
  frameRate (30);
  background (#7a9686);

  initMover (40);
}

void draw ()
{
  background (#7a9686);

  noStroke ();

  fill (#e8e2b2);
  ellipse (food.x, food.y, food.z, food.z);

  boolean someoneAteAllFood = false;

  for (int i = 0; i < m.size(); i++)
  { 
    m.get(i).setTargetZ (food.z);
    m.get(i).move(); 
    m.get(i).checkEdges();
    m.get(i).display();
    if (m.get (i).target != null) food.z =  m.get(i).target.z;

    if (!someoneAteAllFood && m.get (i).target == null)
    {
      someoneAteAllFood = true;
    }
  }

  if (someoneAteAllFood && !generateNewFood)
  {
    for (int i = 0; i < m.size(); i++) m.get(i).target = null;
    nextFoodCounter = 0;
    nextFoodAppearsIn = (int) random (20, 100);
    generateNewFood = true;
  }

  if (generateNewFood) nextFoodCounter++;
  if (generateNewFood && nextFoodCounter == nextFoodAppearsIn)
  {
    generateNewFood = false;
    setNewFood(0);

    for (int i = 0; i < m.size(); i++) m.get(i).setTarget (food);
  }
}


void setNewFood(int depth)
{
  food.x = random (width);
  food.y = random (height);
  food.z = random (1, 50);

  if (depth < 10)
  {
    float dis;
    for (int i = 0; i < m.size(); i++)
    {
      dis = dist (food.x, food.y, m.get(i).location.x, m.get(i).location.y);
      if (dis < (food.z/2 + m.get(i).d/2))
      {
        setNewFood (depth + 1);
      }
    }
  }
}


void initMover (int n)
{
  m = new ArrayList();
  for (int i = 0; i < n; i++) m.add (new Mover());
}


void keyPressed ()
{
  if (key == '+')
  {
    m.add (new Mover());
  }  
  if (key == '-') 
  {
    if (m.size() > 0) 
    {
      m.remove (0);
    }
  }
}

class Mover 
{
  PVector location;
  PVector lastLocation;
  PVector direction;
  PVector DIRECTION;
  PVector target;
  float speed, SPEED;

  float topSpeed;

  float d;

  Mover ()
  {
    location = new PVector(random(width), random(height));
    lastLocation = new PVector (location.x, location.y);
    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));
    DIRECTION = new PVector (direction.x, direction.y);

    d = random (5, 20);
    speed = map (d, 5, 20, 5, 1);
    SPEED = speed;

    topSpeed = 7;
  }

  void setTargetZ (float newZ)
  {
    if (target != null)
    {
      target.z = newZ;
      if (target.z <= 0) target = null;
    }
  }

  void setTarget (PVector newTarget)
  {
    if (target != null)
    {
      target = newTarget;
    }
    else target = new PVector (newTarget.x, newTarget.y, newTarget.z);
    target.x = constrain (target.x, 0, width);
    target.y = constrain (target.y, 0, height);
  }

  void move ()
  {

    if (target != null) 
    {
      move (target);
    } 
    else 
    {
      direction.add (new PVector (DIRECTION.x*0.3, DIRECTION.y*0.3));
      direction.normalize();
      location.add (getVelocity ());
    }
    if (speed < SPEED) speed *= 1.05;
    if (speed > SPEED) speed *= 0.9;

    d*= 0.999;
    if (d < 5) d = 5;
    SPEED = map (d, 5, 20, 5, 1);
    
    lastLocation.x = location.x;
    lastLocation.y = location.y;
  }

  void move (PVector force)
  {
    float maxDis = dist (0, 0, width, height);
    float dis = dist (force.x, force.y, location.x, location.y);
    float angle = atan2 (force.y - location.y, force.x - location.x);

    float forceStrength = map (dis, 0, maxDis, 0.5, 0.1);


    PVector acceleration = new PVector (cos(angle)*forceStrength, sin (angle)*forceStrength);


    float slowDownarea = map (d, 5, 20, 50, 20);
    if (dis < slowDownarea)
    {
      speed *= 0.85;
      acceleration.normalize();
    }

    forceStrength *= map (d, 5, 20, 3, 0.2);

    speed += forceStrength;
    speed = constrain (speed, 1, topSpeed);

    direction.add (acceleration);
    direction.normalize();
    location.add (getVelocity ());

    checkTargetReached();
  }

  void checkTargetReached ()
  {
    float currentDistanceToTarget = dist(location.x, location.y, target.x, target.y);
    if (currentDistanceToTarget < speed || currentDistanceToTarget < (d/2+target.z/2))
    {
      d*= 1.05;
      if (d > 20) d = 20;

      target.z -= map (d, 5, 20, 0.05, 0.5);

      if (target.z <= 0)
      {
        target = null;
      }
      
      location.x = lastLocation.x;
      location.y = lastLocation.y;
    }
  }

  PVector getVelocity ()
  {
    PVector velocity = new PVector (direction.x * speed, direction.y * speed);
    return velocity;
  }

  void checkEdges ()
  {
    if (location.x < -d/2)
    {
      location.x = width+d/2;
      //direction.x = direction.x * -1;
    } 
    else if (location.x > width+d/2) 
    {
      location.x = -d/2;
      // direction.x = direction.x * -1;
    }

    if (location.y < -d/2)
    {
      location.y = height+d/2;
      //  direction.y = direction.y * -1;
    } 
    else if (location.y > height+d/2) 
    {
      location.y = -d/2;
      //direction.y = direction.y * -1;
    }
  }


  void display ()
  {
    noStroke();
    fill (#b1c999);
    ellipse (location.x, location.y, d, d);

    strokeWeight (1);
    stroke (255);
    line (location.x, location.y, location.x + direction.x*d/2, location.y + direction.y*d/2);
  }
}




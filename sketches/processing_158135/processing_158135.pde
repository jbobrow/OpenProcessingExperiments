
ArrayList creatures;
ArrayList creaturesToRemove, creaturesToAdd;
int initialCreatureCount = 200;
private float speed = .15;
PFont font, messageFont;
float[] messageTimer;
float messageTime = 1.5;
float messageSpacing = 30;
float reproductionSize = 60;
float offspringMean = 22;
boolean info = false;

void setup()
{
  font = createFont("Arial", 12);
  messageFont = createFont("Arial", 24);

  ellipseMode(RADIUS);
  size(1600, 800);
  creatures = new ArrayList<Creature>();
  for (int i=0; i<initialCreatureCount; i++)
    creatures.add(new Creature(new PVector(random(width), random(height)), null, 0));
  creaturesToAdd = new ArrayList<Creature>();
  messageTimer = new float[5];
}

void draw()
{
  background(0);
  creaturesToRemove = new ArrayList<Creature>();
  for (int i=0; i < creaturesToAdd.size (); i++)
  {
    Creature creature = (Creature)creaturesToAdd.get(i);
    creatures.add(creaturesToAdd.get(i));
  }
  creaturesToAdd = new ArrayList<Creature>();

  for (int i=0; i < creatures.size (); i++)
  {
    Creature creature = (Creature)creatures.get(i);
    creature.index = i;
  }
  float totalArea = 0;
  for (int i=0; i < creatures.size (); i++)
  {
    Creature creature = (Creature)creatures.get(i);
    totalArea += creature.GetArea();
    creature.Run();
    creature.Eat();
    creature.Reproduce();
    creature.Draw();
    if (info)
      creature.DistplayText();
  }
  //println("totalArea: " + totalArea);
  Creature creature = (Creature)creatures.get(0);
  for (int i=0; i < creaturesToRemove.size (); i++)
  {
    creatures.remove(creaturesToRemove.get(i));
  }
  //println("creatures.size(): " + creatures.size());

  int messageCounter = 0;
  for (int i=0; i<5; i++)
  {
    if (messageTimer[i] > 0)
    {
      String property = "";
      float val = 0;
      switch(i)
      {
      case 0: 
        property = "creature acceleration speed";
        val = speed;
        break;
      case 1:
        property = "reproduction size";
        val = reproductionSize;
        break;
      case 2:
        property = "mean number of offspring";
        val = offspringMean;
      }
      textFont(messageFont);
      textAlign(LEFT);
      text(property + ": " + nfs(val, 0, 2), 10, messageCounter * messageSpacing + 30);
      messageTimer[i] -= 1/frameRate;
      messageCounter++;
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    switch (keyCode)
    {
    case UP:
      reproductionSize++;
      messageTimer[1] = messageTime;
      break;
    case DOWN:
      if (reproductionSize > 20)
      {
        reproductionSize--;
        messageTimer[1] = messageTime;
      }
      break;
    case LEFT:
      if (offspringMean > 4)
      {
        offspringMean--;
        messageTimer[2] = messageTime;
      }
      break;
    case RIGHT:
      offspringMean++;
      messageTimer[2] = messageTime;
      break;
    }
  } else
  {
    switch (key)
    {
    case '-':
    case '_':
      speed -= .02;
      messageTimer[0] = messageTime;
      break;
    case '=':
    case '+':
      speed += .02;
      messageTimer[0] = messageTime;
      break;
    case ' ':
      info = !info;
      break;
    }
  }
}

class Creature
{
  public int index;


  private static final float SIZE_MEAN = 10;
  private static final float SIZE_DEV = 2;
  //private static final float REPRODUCTION_SIZE = 60;
  //private static final float OFFSPRING_MEAN = 18;
  private static final float OFFSPRING_DEV = 1.5;
  private static final float OFFSPRING_SIZE_DEV = 3;
  private static final float OFFSPRING_OFFSET_DEV = 0;
  private static final float OFFSPRING_OFFSET_MEAN = 100;
  private static final float OFFSPRING_VEL_DEV = .25;
  private static final float OFFSPRING_VEL_MEAN = 1;
  private static final float ACC_SCALER = .04;

  private Mover mover;
  private float size;
  private float maxSpeed = 3;
  private boolean towards;
  private Creature closestNeighbor;
  private int eatCount;

  private float closestNeighSize;

  Creature(PVector pos, PVector vel, float size)
  {
    mover = new Mover(pos);
    if (size == 0)
      this.size = nextGaussian() * SIZE_DEV + SIZE_MEAN;
    else 
      this.size = size;
    //println("Creature size: " + size);
    this.index = index;
    if (vel != null)
      this.mover.vel = vel;
  }

  float GetArea()
  {
    return size * size * PI;
  }

  void Draw()
  {
    noFill();
    strokeWeight(1);
    if (towards)
      stroke(0, 255, 0);
    else
      stroke(255, 0, 0);
    ellipse(mover.pos.x, mover.pos.y, size, size);
  }

  void GetPos()
  {
    println(index + " pos: " + mover.pos);
    println(" vel: " + mover.vel);
    println(index + " size: " + size);
  }

  void Run()
  {
    //find closest neighbor
    int closestIndex = 0;
    float closestDistance = 9999999;
    for (int i=0; i < creatures.size (); i++)
    {
      if (i == index)
        continue;

      Creature neighbor = (Creature)creatures.get(i);
      float distance = PVector.dist(mover.pos, neighbor.mover.pos);
      if (distance < closestDistance)
      {
        closestDistance = distance;
        closestIndex = i;
      }
    }

    closestNeighbor = (Creature)creatures.get(closestIndex);

    PVector to = PVector.sub(closestNeighbor.mover.pos, mover.pos);
    to.normalize();
    if (closestNeighbor.size > size)
    {
      //run away
      to.mult(-speed * size * ACC_SCALER);
      towards = false;
    } else
    {
      //run towards
      to.mult(speed * size * ACC_SCALER);
      towards = true;
    }
    mover.acc = to;
    mover.vel.limit(maxSpeed);
    stroke(255);
    if (info)
      line(mover.pos.x, mover.pos.y, closestNeighbor.mover.pos.x, closestNeighbor.mover.pos.y);
    mover.Move();
    mover.Wrap(size);
    closestNeighSize = closestNeighbor.size;
  }

  void Reproduce()
  {
    if (size < reproductionSize)
      return;

    int numOfOffspring;
    float area = PI * size * size;
    do
    {
      numOfOffspring = round(nextGaussian() * OFFSPRING_DEV + offspringMean);
    }
    while (numOfOffspring < 2);
    float meanOffspringArea = area/numOfOffspring;
    //println("area: " + area);
    //println("numOfOffspring: " + numOfOffspring);
    //println("meanOffspringArea: " + meanOffspringArea);
    float[] offSpringSizes = new float[numOfOffspring];
    float deviation;
    float firstDeviation = nextGaussian() * OFFSPRING_SIZE_DEV;
    float prevDeviation = firstDeviation;
    float offSpringArea;
    for (int i=1; i<numOfOffspring; i++)
    {
      do
      {
        deviation = nextGaussian() * OFFSPRING_SIZE_DEV;
        offSpringArea = meanOffspringArea + deviation - prevDeviation;
      }
      while (offSpringArea < 0);
      offSpringSizes[i] = sqrt(offSpringArea/PI);
      prevDeviation = deviation;
    }
    offSpringArea = meanOffspringArea + firstDeviation - prevDeviation;
    offSpringSizes[0]  = sqrt(offSpringArea/PI);

    //println("area: " + area);
    float totalArea = 0;
    for (int i=0; i<numOfOffspring; i++)
    {
      totalArea += offSpringSizes[i] * offSpringSizes[i] * PI;
    }
    //println("totalArea: " + totalArea);

    for (int i=0; i<numOfOffspring; i++)
    {
      PVector newPos = new PVector(mover.pos.x, mover.pos.y);
      //PVector posOffset = PVector.random2D();
      PVector posOffset = new PVector(random(-1, 1), random(-1, 1));
      posOffset.normalize();
      posOffset.mult(nextGaussian() * OFFSPRING_OFFSET_DEV + OFFSPRING_OFFSET_MEAN);

      newPos.add(posOffset);
      if (newPos.x < 0)
        newPos.x += width; 
      if (newPos.y < 0)
        newPos.x += height;

      PVector dir = PVector.sub(newPos, mover.pos);
      dir.normalize();
      dir.mult(nextGaussian() * OFFSPRING_VEL_DEV + OFFSPRING_VEL_MEAN);
      creaturesToAdd.add(new Creature(newPos, dir, offSpringSizes[i]));
    }
    creaturesToRemove.add(this);
    stroke(255, 0, 255);
    strokeWeight(5);
    ellipse(mover.pos.x, mover.pos.y, size, size);
  }

  void Eat()
  {
    if (towards && PVector.dist(closestNeighbor.mover.pos, mover.pos) < size - closestNeighbor.size)
    {
      creaturesToRemove.add(closestNeighbor);
      float neighborRad = closestNeighbor.size;
      float neighborArea = PI * neighborRad * neighborRad;
      float area = PI * size * size;
      area += neighborArea;
      size = sqrt(area / PI);
      strokeWeight(4);
      stroke(0, 255, 0);
      ellipse(mover.pos.x, mover.pos.y, size, size);
      eatCount++;
    }
  }

  void DistplayText()
  {
    textFont(font);
    textAlign(CENTER);
    text(eatCount, mover.pos.x, mover.pos.y);
  }

  void Info()
  {
    println("size: " + size);
    println("closestNeighSize: " + size);
  }
}

float nextGaussian()
{
  return( (random(1)*2 - 1) + (random(1)*2 - 1) + (random(1)*2 - 1) );
}
class Mover
{
  private PVector pos;
  private PVector vel;
  private PVector acc;

  Mover(PVector pos)
  {
    this.pos = pos;
    vel = new PVector();
    acc = new PVector();
  }

  void Move()
  {
    vel.add(acc);
    pos.add(vel);
  }

  void Wrap(float r)
  {
    if (pos.x < -r)
      pos.x = width + r;
    if (pos.x > width + r)
      pos.x = -r;
    if (pos.y < -r)
      pos.y = height + r;
    if (pos.y > height + r)
      pos.y = -r;
  }
}




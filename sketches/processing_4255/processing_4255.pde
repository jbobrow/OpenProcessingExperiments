
class Ant 
{ 

  NeuralNet brain; 
  Coordinate position = new Coordinate(); 
  Coordinate direction = new Coordinate(); 

  double rotation; 
  double speed; 

  int fitness; 

  int closestMinePosition = 0; 

  void setGenome(double[] w) 
  { 
    brain.setGenome(w); 
    Reset(); 
  } 

  Ant(NeuralNet net) 
  { 
    brain = net; 
    rotation = random(1) * TWO_PI;
    fitness = 0; 
    position = new Coordinate(random(SIMULATION_WIDTH), random(SIMULATION_HEIGHT)); 
  } 

  double[] getGenome() 
  { 
    return brain.getGenome(); 
  } 

  void Reset() 
  { 
    position = new Coordinate(random(SIMULATION_WIDTH), random(SIMULATION_HEIGHT)); 
    fitness = 0; 
    rotation = random(1) * TWO_PI; 
  } 

  int checkForMine(Coordinate[] mines) 
  { 
    Coordinate DistToObject = new Coordinate(position.x - mines[closestMinePosition].x, position.y - mines[closestMinePosition].y); 

    if (VectorLength(DistToObject) < 5) 
    { 
      return closestMinePosition; 
    } 

    return -1; 
  } 

  Coordinate GetClosestMine(Coordinate[] mines) 
  { 
    double closestSoFar = Double.MAX_VALUE; 

    Coordinate closestObject = new Coordinate(0, 0); 

    for (int i = 0; i < mines.length; i++) 
    { 
      double lengthToObject = VectorLength(new Coordinate(mines[i].x - position.x, mines[i].y - position.y)); 

      if (lengthToObject < closestSoFar) 
      { 
        closestSoFar = lengthToObject; 

        closestObject = new Coordinate(position.x - mines[i].x, position.y - mines[i].y); 

        closestMinePosition = i; 
      } 
    } 

    return closestObject; 
  } 

  double VectorLength(Coordinate v) 
  { 
    return Math.sqrt((v.x * v.x) + (v.y * v.y)); 
  } 

  void update(Coordinate[] mines) 
  { 
    double[] inputs = new double[4]; 

    Coordinate closestMine = GetClosestMine(mines); 
    Vec2DNormalize(closestMine); 

    inputs[0] = closestMine.x; 
    inputs[1] = closestMine.y; 

    inputs[2] = direction.x; 
    inputs[3] = direction.y; 

    double[] output = brain.evaluate(inputs); 

    double RotationForce = output[0] - output[1]; 

    if (RotationForce < -MAXIMUM_TURNING_RATE) 
    { 
      RotationForce = -MAXIMUM_TURNING_RATE; 
    } 
    if (RotationForce > MAXIMUM_TURNING_RATE) 
    { 
      RotationForce = MAXIMUM_TURNING_RATE; 
    } 

    rotation += RotationForce; 

    speed = (output[0] + output[1]); 

    direction.setLocation(-Math.sin(rotation), Math.cos(rotation)); 

    position.setLocation(position.x + (direction.x * speed), position.y + (direction.y * speed)); 

    if (position.x > SIMULATION_WIDTH) 
    { 
      position.x -= SIMULATION_WIDTH; 
    } 
    if (position.x < 0) 
    { 
      position.x += SIMULATION_WIDTH; 
    } 
    if (position.y > SIMULATION_HEIGHT) 
    { 
      position.y -= SIMULATION_HEIGHT; 
    } 
    if (position.y < 0) 
    { 
      position.y += SIMULATION_HEIGHT; 
    } 
  } 

  void Vec2DNormalize(Coordinate v) 
  { 
    double vector_length = VectorLength(v); 
    v.setLocation(v.x / vector_length, v.y / vector_length); 
  }

  void draw(PGraphics g)
  {
    g.pushMatrix();
    g.translate((float)position.x,(float)position.y);
    g.rotate((float)rotation);
    g.ellipse(0,-2,4,4);
    g.ellipse(0,-6,4,4);
    g.ellipse(0,-10,4,4);
    g.line(-2,-2,-4,-3);
    g.line(2,-2,4,-3);
    g.line(-2,-6,-4,-7);
    g.line(2,-6,4,-6);
    g.line(-2,-10,-4,-11);
    g.line(2,-10,4,-11);
    g.line(0,0,-2,2);
    g.line(0,0,2,2);
    g.popMatrix();
  }
}




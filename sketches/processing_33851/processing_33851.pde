
class SteeredVehicle extends Vehicle
{
  // _maxForce best values
  // seek 0.05 - 0.1, flee 0.01 - 0.05
  float _maxForce = 0.1; //1.0;
  Vector2D _steeringForce;
  
  float _arrivalThreshold = 100;
  
  float _wanderAngle = 0.0; //0
  float _wanderDistance = 10.0; //10
  float _wanderRadius = 5.0; //5
  float _wanderRange = 1.0; //1
  
  float _avoidDistance = 50;
  float _avoidBuffer = 10;
  
  int _pathIndex = 0;
  float _pathThreshold = 20;
  Boolean _loopRound = false;
  
  float _inSightDist = 200;
  float _tooCloseDist = 60;
  
  
  SteeredVehicle()
  {
    super();
    _steeringForce = new Vector2D();
  }
  
  SteeredVehicle(Vector2D _position, Vector2D _velocity)
  {
    super(_position, _velocity);
    _steeringForce = new Vector2D();
  }

  // set/get maxForce
  void setMaxForce(float value)
  {
    _maxForce = value;
  }
  float getMaxForce()
  {
    return _maxForce;
  }
  
  void update()
  {
    _steeringForce.limit(_maxForce);
    _steeringForce.div(_mass);
    _velocity.add(_steeringForce);
    _steeringForce = new Vector2D();
//          if (_position.x < 0 ) exit();
    super.update();
  }
  
  //*** seek and flee
  // differ only by addition or subtraction of force
  void seek(Vector2D target)
  {
    Vector2D desiredVelocity = target.clone();
    desiredVelocity.sub(_position);
    desiredVelocity.normalize();
    desiredVelocity.mult(_maxSpeed);
    Vector2D force = desiredVelocity.clone();
    force.sub(_velocity);
    _steeringForce.add(force);
  }
  void flee(Vector2D target)
  {
    Vector2D desiredVelocity = target.clone();
    desiredVelocity.sub(_position);
    desiredVelocity.normalize();
    desiredVelocity.mult(_maxSpeed);
    Vector2D force = desiredVelocity.clone();
    force.sub(_velocity);
    _steeringForce.sub(force);
  }

  //*** arrive
  void arrive(Vector2D target)
  {
    Vector2D desiredVelocity = target.clone();
    desiredVelocity.sub(_position);
    desiredVelocity.normalize();
    float distV = _position.distV(target);
    if(distV > _arrivalThreshold)
    {
      desiredVelocity.mult(_maxSpeed);
    }
    else
    {
      desiredVelocity.mult(_maxSpeed * distV / _arrivalThreshold);
    }
    
    Vector2D force = desiredVelocity.clone();
    force.sub(_velocity);
    _steeringForce.add(force);
  }
  
  //*** persue and evade
  void persue(Vehicle target)
  {
    float lookAheadTime = _position.distV(target._position) / _maxSpeed;
    Vector2D predictedPosition = target._position.clone();
    Vector2D predictedVelocity = target._velocity.clone();
    predictedVelocity.mult(lookAheadTime);
    predictedPosition.add(predictedVelocity);
    seek(predictedPosition);
  }
  void evade(Vehicle target)
  {
    float lookAheadTime = _position.distV(target._position) / _maxSpeed;
    Vector2D predictedPosition = target._position.clone();
    Vector2D predictedVelocity = target._velocity.clone();
    predictedVelocity.mult(lookAheadTime);
    predictedPosition.sub(predictedVelocity);
    flee(predictedPosition);
  }

  //*** wander
  void wander()
  {
    Vector2D centre = _velocity.clone();
    centre.normalize();
    centre.mult(_wanderDistance);
    Vector2D offset = new Vector2D(0,0);
    offset.setLength(_wanderRadius);
    offset.setAngle(_wanderAngle);
    _wanderAngle += random(-_wanderRange, _wanderRange);
    Vector2D force = centre.clone();
    force.add(offset);
    _steeringForce.add(force);
  }

  
  //*** flocking
  void flock(Vehicle[]Vehicles)
  {
    Vector2D averageVelocity = _velocity.clone();
    Vector2D averagePosition = new Vector2D();
    int inSightCount = 0;
    for(int v = 0; v < Vehicles.length; v++)
    {
      if(Vehicles[v] != this && inSight(Vehicles[v]))
      {
        averageVelocity.add(Vehicles[v]._velocity);
        averagePosition.add(Vehicles[v]._position);
        if(tooClose(Vehicles[v])) flee(Vehicles[v]._position);
        inSightCount++;
      }
    }
    
    if(inSightCount > 0)
    {
      averageVelocity.div(inSightCount);
      averagePosition.div(inSightCount);
      seek(averagePosition);
      averageVelocity.sub(_velocity);
      _steeringForce.add(averageVelocity);
    }
    
  }
  Boolean inSight(Vehicle vehicle)
  {
    if(_position.distV(vehicle._position) > _inSightDist) return false;
    Vector2D heading = _velocity.clone();
    heading.normalize();
    Vector2D difference = vehicle._position.clone();
    difference.sub(_position);
    float dotProd = difference.dot(heading);
    if(dotProd < 0) return false;
    
    return true;
  }
  Boolean tooClose(Vehicle vehicle)
  {
    return _position.distV(vehicle._position) < _tooCloseDist;
  }
  void setInSightDist(float value)
  {
    _inSightDist = value;
  }
  float getInSightDist()
  {
    return _inSightDist;
  }
  void setTooCloseDist(float value)
  {
    _tooCloseDist = value;
  }
  float getTooCloseDist()
  {
    return _tooCloseDist;
  }
}



/**
Agent parent class. The hero and the hunters will be subclasses of it.
**/
public abstract class Agent implements Drawable {
  
  private CoordinateDouble _position;
  private CoordinateInt _destination;
  private double _speed;
  private PImage _image;
  private World _world;
  private CoordinateDouble _direction; // vector pointing in the direction of the destination
  private float _lastTheta; // last angle the agent sprite was rotated. used to prevent the sprite from always facing the same direction once its destination has been reached
  
  /**
  Constructor
  **/
  public Agent(CoordinateInt position, Double speed, PImage image, World world) {
    _position = world.gridCenterToPosition(position);
    _destination = position;
    _direction = new CoordinateDouble(0, 0);
    _speed = speed;
    _image = image;
    _world = world;
    _lastTheta = atan2(0, 0) + PI/2;
  }
  
  /**
  Agent's main loop
  **/  
  public abstract void doSomething();
  
  /**
  Position getter
  **/
  public CoordinateDouble getPosition() {
    return _position;
  }
  
  /**
  Position setter
  **/
  public void setDestination(CoordinateInt destination) {
    _destination = destination;
  }
  
  /**
  Destination getter
  **/
  public CoordinateInt getDestination() {
    return _destination;
  }
  
  /**
  World getter
  **/
  public World getWorld() {
    return _world;
  }
  
  /**
  Move an agent in the direction of its current destination
  **/
  protected void move() {
    // calculate direction vector
    _direction = new CoordinateDouble(_destination.getX(), _destination.getY());
    _direction = _world.gridCenterToPosition(_destination);
    _direction.minus(_position);
    
    // usually, move one unit of speed of the agent. but if the destination is closer than one speed unit, limit the speed in order to not overshoot the destination
    if (_direction.magnitude() > _speed) {
      _direction.normalize();
      _direction.times(_speed);
    }
    
    // calculate the new position. do not step on not walkable squares
    CoordinateDouble newPosition = new CoordinateDouble(_position.getX(), _position.getY());
    newPosition.plus(_direction);
    if (_world.isWalkable(newPosition)) {
      _position = newPosition;
    }
  }
  
  /**
  Draw the agent
  **/
  public void draw(View view) {
    CoordinateInt position = view.convert(_position);
    
    // angle to draw sprite. if we have reached the destination, use the last angle to avoid the agent facing the direction of atan2(0, 0) + PI/2
    float theta;
    if (_direction.magnitude() == 0) {
      theta = _lastTheta;
    }
    else {
      theta = atan2((float) _direction.getY(), (float) _direction.getX()) + PI/2;
    }
    _lastTheta = theta;
    
    // draw the sprite
    pushMatrix();
    translate(position.getX(), position.getY());
    rotate(theta);
    imageMode(CENTER);
    image(_image, 0, 0);
    popMatrix();
  }
}


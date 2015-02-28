
class CollisionSystem extends System <Float> {

  // This is a simple collision system that -only- checks for collision with the screen edge.
  // Find out on how to include other objects here:
  // http://processing.org/learning/topics/circlecollision.html

  void process(int entityID) {

    Float radius = (Float)objects.get(entityID);
    PVector pos = position.getDataFor(entityID);
    PVector vel = velocity.getDataFor(entityID);

    if (radius != null && pos != null && vel != null) {
          
      // Check for collision with the screen edge (left and right)
      boolean collision = false;
      
      if (pos.x + radius >= width) {
        collision = true;
        pos.x = width - radius;
      }
      else {
        if (pos.x - radius < 0) {
          collision = true;
          pos.x = radius;
        }
      }
      
      // Update position and velocity if there was a collision
      if (collision) {
        position.updateDataFor(entityID, pos);
        vel.x *= -1;
        velocity.updateDataFor(entityID, vel);
      }
      
      // Check for collision with the screen edge (top and bottom)
      collision = false;
      
      if (pos.y + radius > height) {
        collision = true;
        pos.y = height - radius;
      }
      else {
        if (pos.y - radius < 0) {
          collision = true;
          pos.y = radius;
        }
      }
      
      // Update position and velocity if there was a collision
      if (collision) {
        position.updateDataFor(entityID, pos);
        vel.y *= -1;
        velocity.updateDataFor(entityID, vel);
      }            
      
    }
  }
}



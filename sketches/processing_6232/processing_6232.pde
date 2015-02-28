
class Astroid extends Body {
  PVector acceleration;
  int id;
  
  Astroid(PVector position, float mass, float radius, float bright, float freq, int i){
    super(position, mass, radius, bright, freq);
    id = i;
    
    acceleration = new PVector(0, 0);
    moveable = true;
  }
  
  void move(){
    acceleration.mult(0);
    for(int i = bodies.size()-1; i>=0; i--){
      if(i != id){
        Body b = (Body) bodies.get(i);
        float d = dist(position.x, position.y, b.position.x, b.position.y);
        if(d < 500){
          PVector force = calculateForce(b, this);
          force.div(mass);
          acceleration.add(force);
        }
        if(d < (radius+b.radius)){
          resolveCollision(b, this);
        }
      }
    }
    
    velocity.add(acceleration);
    position.add(velocity);
    if(position.x+radius > width){
      position.x = width-radius;
      velocity.x *= -1;
    } else if(position.x-radius < 0){
      position.x = radius;
      velocity.x *= -1;
    }
    if(position.y+radius > height){
      position.y = height-radius;
      velocity.y *= -1;
    } else if(position.y-radius < 0){
      position.y = radius;
      velocity.y *= -1;
    } 
  }
  
  void update(){
    move();
    super.render();
  }
}


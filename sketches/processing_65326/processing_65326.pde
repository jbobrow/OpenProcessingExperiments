
float GRAVITY = 0.0f;
float THRUST = 0.5f;
float DRAG = 0.995f;
float ANGULAR_FORCE = 0.04f;
float ANGULAR_DRAG = 0.995f;
float MAXIMUM_SPEED = 2.0f;
float BODY_SIZE = 5.0f;
float FEELER_SIZE = 3.0f;

class Boid {
  PVector position;
  PVector velocity;
  float angular_velocity;
  float angle;
  PVector feeler1;
  PVector feeler2;
  
  NeuralNetwork network;
  float family_color;
  
  int food_collected = 0;
  float fitness;
  int time_since_beginning;
  
  Boid(Boid parent1, Boid parent2) {
    network = new NeuralNetwork(parent1.network, parent2.network);
    family_color = (parent1.family_color + parent2.family_color) / 2.0f;
    if (abs(parent1.family_color - parent2.family_color) > 127.0f) family_color = abs(family_color + 127.0f);
  }
  
  Boid() {
    network = new NeuralNetwork(new int[] {8, 25, 3});
    family_color = random(255.0f);
  }
  
  void mutate() {
    network.mutate();
  }
  
  void initialize() {
    this.position = new PVector(random(width), random(height));
    this.velocity = new PVector(0, 0);
    this.angular_velocity = 0.0f;
    this.angle = 0.0f;
    this.food_collected = 0;
    time_since_beginning = 1;
    fitness = 0.0f;
    
    float cost = cos(angle);
    float sint = sin(angle);
    feeler1 = new PVector (-BODY_SIZE * sint + position.x, -BODY_SIZE * cost + position.y);
    feeler2 = new PVector ( BODY_SIZE * sint + position.x,  BODY_SIZE * cost + position.y);
  }
  
  void simulate(ArrayList food, ArrayList others) {
    float closest_food_dist = 1000000f;
    PVector closest_food = null;
    float closest_other_dist = 1000000f;
    PVector closest_other = null;
    for (int i=0; i<food.size(); i++) {
      PVector f = (PVector)food.get(i);
      float d = PVector.dist(f, position);
      if (d < BODY_SIZE + FOOD_SIZE) {
        food.remove(i);
        if (time_since_beginning > 10) {
          fitness += 1f;
          food_collected++;
        }
        food.add(new PVector(random(width), random(height)));
      } else if (d < closest_food_dist) {
        closest_food = f;
        closest_food_dist = d;
      }
    }
    
    for (int i=0; i<others.size(); i++) {
      Boid other = (Boid)others.get(i);
      float d = PVector.dist(other.position, position);
      if (d < BODY_SIZE + BODY_SIZE) {
        fitness += velocity.mag() / 1f;
        position = PVector.add(position, PVector.mult(PVector.sub(position, other.position), 0.5f));
      }
      if (d < closest_other_dist) {
        closest_other_dist = d;
        closest_other = other.position;
      }
    }
    
    float food_distance1 = 0f;
    float food_distance2 = 0f;
    float other_distance1 = 0f;
    float other_distance2 = 0f;
    if (closest_food != null) {
      food_distance1 = PVector.dist(feeler1, closest_food);
      food_distance2 = PVector.dist(feeler2, closest_food);
      other_distance1 = PVector.dist(feeler1, closest_food);
      other_distance2 = PVector.dist(feeler2, closest_food);
    }
    float[] inputs = {food_distance1, food_distance2, other_distance1, other_distance2, velocity.x, velocity.y, angular_velocity, angle};
    float[] outputs = network.get_outputs(inputs);
    
    angular_velocity += ANGULAR_FORCE * outputs[0];
      

    if (outputs[1] > 0f) {
      velocity.x += THRUST * outputs[1] * cos(angle);
      velocity.y -= THRUST * outputs[1] * sin(angle);
    }
    
    if (velocity.mag() > MAXIMUM_SPEED) {
      velocity.normalize();
      velocity.mult(MAXIMUM_SPEED);
    }
    
    velocity.y += GRAVITY;
    
    velocity.mult(DRAG);
        
    angular_velocity *= ANGULAR_DRAG;
    angle += angular_velocity;
    
    if (position.x < 0) velocity.x = max(0, velocity.x);
    if (position.x > width) velocity.x = min(0, velocity.x);
    if (position.y < 0) velocity.y = max(0, velocity.y);
    if (position.y > height) velocity.y = min(0, velocity.y);
    
    position.add(velocity);
    
    float cost = cos(angle);
    float sint = sin(angle);
    feeler1 = new PVector (-BODY_SIZE * sint + position.x, -BODY_SIZE * cost + position.y);
    feeler2 = new PVector ( BODY_SIZE * sint + position.x,  BODY_SIZE * cost + position.y);
    
    time_since_beginning++;
  }
}


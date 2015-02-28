
Player p;

void setup() {
  size(640, 640);
  p = new Player();
}

void draw() {
  background(0);
  p.draw();
}

void mousePressed() {
  if (p.isRunning)
    p.isRunning = false;
  else 
    p.isRunning = true;
}

class Player {
  //vector movement needs a position, velocity and direction
  //I liked to use target based movement
  PVector pos, target, direction, velocity;
  //This just controlls if the shape is running or not
  boolean isRunning;

  Player() {
    //set to basic values 
    direction = new PVector(0, 0);
    pos = new PVector(width/2, height/2);
    target = new PVector(mouseX, mouseY);
    velocity = new PVector(0, 0);
  }

  void draw() {
    //to keep the player clean i seperated the moving and physics into 
    //its own method. also in most game developing you do updates before drawing
    update();
    fill(255, 0, 0);
    //Pushes the current transformation matrix onto the matrix stack.
    //dont worry to much about this, just know that it is used when rotating
    pushMatrix();
    //move shape to position
    translate(pos.x, pos.y);
    //calculate difference between points
    float dX = pos.x - target.x;
    float dY = pos.y - target.y;
    //create angle from the difference
    float angle = radians((atan2(dY, dX) * 180 / PI));
    //rotate the object to this angle to make it look like it is looking at something
    rotate(angle);
    //draw object 0,0 and make it centered
    ellipse(0-10, 0-5, 20, 10);
    //Pops the current transformation matrix off the matrix stack
    //same as the push, dont worry about it
    popMatrix();
    //over all don't worry to much about how processing handles rotation and such since
    //most programs or languages handle it differently 
    //try and learn/play with rotation and translations to find out how they work 
  }

  void update() {
    //set the target vector to the mouse's position
    target.x = mouseX;
    target.y = mouseY;
    //calculate direction
    direction = PVector.sub(target, pos);
    //find seperation based on the distance vectors magnitude
    float separation = direction.mag();
    float distance = separation;
    //normalize vector and mult by speed to get acceleration
    direction.normalize();
    direction.mult(0.5);
    PVector acceleration = direction;

    //velocity equation and limit to a certain speed
    velocity.add(acceleration);
    velocity.limit(2);
    //if you want the shape to run from the target then subtract the velocity 
    //otherwise just add it
    if (isRunning)
      pos.sub(velocity);
    else
      pos.add(velocity);
  }
}




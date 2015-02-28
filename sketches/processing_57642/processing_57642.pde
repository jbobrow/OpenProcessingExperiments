
// A simple swarming algorithm
// (c) Alasdair Turner 2008

Fly [] swarm = new Fly [200];

void setup()
{
  size(400,400);
  colorMode(HSB);
  for (int i = 0; i < swarm.length; i++) {
    swarm[i] = new Fly();
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < swarm.length; i++) {
    swarm[i].move(swarm);
    swarm[i].draw();
  }
}
class Fly
{
  PVector direction;
  PVector position;
  float speed;
  color colour;
  Fly()
  {
    // random location
    position = new PVector(random(0,width),random(0,height));
    // random direction
    direction = new PVector(random(-1,1),random(-1,1));
    direction.normalize();
    // random speed
    speed = random(1,2);
    // random HSB color
    colour = color(random(0,256),255,204);
  }
  void move(Fly [] swarm)
  {
    // fly to the centre of the swarm...
    PVector centre = new PVector(0,0);
    for (int i = 0; i < swarm.length; i++) {
      centre.add(swarm[i].position);
    }
    centre.mult(1.0/swarm.length);
    // ...but avoid getting too close to other flies
    int closest = -1;
    float closestdist = width + height;
    for (int i = 0; i < swarm.length; i++) {
      float d = PVector.dist(swarm[i].position,position);
      if (swarm[i] != this && d < closestdist) {
        closest = i;
        closestdist = d;
      }
    }
    // now implement: only fly to the centre if you are not too close
    if (closestdist > 10) {
      PVector centredir = PVector.sub(centre,position);
      centredir.normalize();
      // steer towards the centre, here using simple addition:
      direction.add(centredir);  
    }
    else {
      // otherwise avoid other flies! 
      PVector closestdir = PVector.sub(swarm[closest].position,position);
      closestdir.normalize();
      // steer away from the closest fly, here using simple subtraction:
      direction.sub(closestdir);
    }
    // normalise the combination of other operations
    direction.normalize();
    direction.mult(speed);
    position.add( direction );
    // constrain to screen:
    position.x = (position.x + width) % width;
    position.y = (position.y + height) % height;
  }
  void draw()
  {
    stroke(colour);
    pushMatrix();
    translate(position.x,position.y);
    line(0,0,direction.x*2,direction.y*2);
    popMatrix();    
  }
}
 



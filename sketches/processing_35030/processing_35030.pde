
class Fly
{
  PVector heading;
  PVector position;
  
  PVector cohesion;
  PVector alignment;
  
  float speed;
  color colour;
  color c;
  int mapWidth;
  int mapHeight;
  int mapZed;
  
  Fly(int w, int h, int z, int neighRad, int space)
  {
    
    mapWidth = w;
    mapHeight = h;
    mapZed = z;
    neighborhoodRadius = neighRad; 
    
    // random location
    position = new PVector(random(0, mapWidth), random(0, mapHeight), random(0, mapZed));
    // random heading
   
    heading = new PVector(random(-1,1),random(-1,1), random(-1,1));
    heading.normalize();
    // random speed
    speed = random(0,1);
    // random HSB color
    colour = color(random(0,256),255,204);
  }
  void move(Fly [] swarm)
  {
    // fly to the centre of the swarm...
    PVector centre = new PVector(0, 0, 0);
    for (int i = 0; i < swarm.length; i++) {
      centre.add(swarm[i].position);
    }
    centre.mult(1.0/swarm.length);
    // ...but avoid getting too close to other flies
    int closest = -1;
    float closestdist = mapWidth + mapHeight + mapZed;
    for (int i = 0; i < swarm.length; i++) {
      float d = PVector.dist(swarm[i].position, position);
      if (swarm[i] != this && d < closestdist) {
        closest = i;
        closestdist = d;
      }
    }
    // now implement: only fly to the centre if you are not too close
    if (closestdist > neighborhoodRadius) {
      PVector centredir = PVector.sub(centre,position);
      centredir.normalize();
      // steer towards the centre, here using simple addition:
      heading.add(centredir);  
    }
    else {
      // otherwise avoid other flies! 
      PVector closestdir = PVector.sub(swarm[closest].position,position);
      closestdir.normalize();
      // steer away from the closest fly, here using simple subtraction:
      heading.sub(closestdir);
    }
    // normalise the combination of other operations
    heading.normalize();
    heading.mult(speed);
    position.add(heading);
      
      // Toroidial universe    

      if(position.x < 0){ position.x = mapWidth;}
      if(position.x > mapWidth){ position.x = 0;}

      if(position.y < 0){ position.y = mapHeight;}
      if(position.y > mapHeight){ position.y = 0;}
      
      if(position.z < 0){ position.z = mapZed;}
      if(position.z > mapZed){ position.z = 0;} 


//      //Bound box universe
//      
//      if(position.x < 0){ position.x *= -1;}
//      if(position.x > mapWidth){ position.x *= -1;}
//
//      if(position.y < 0){position.y *= -1;}
//      if(position.y > mapHeight){ position.y *= -1;}
//      
//      if(position.z < 0){ position.z *= -1;}
//      if(position.z > mapZed){ position.z *= -1;}

  }
  
  void draw()
  {
    stroke(255,255,255);
    strokeWeight(speed*2);
    point(position.x, position.y, position.z);
    pushMatrix();
    translate(position.x,position.y, position.z);
    line(0,0, 0, heading.x*2, heading.y*2, heading.z*2);
    popMatrix();

  
  }

}



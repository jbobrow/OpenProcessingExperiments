
ArrayList snakes = new ArrayList();

void setup() {
  size(640, 640);
  for(int i = 0; i < 180; i+=3){
    snakes.add(new Snake(i));
  }
}

void draw() {
  background(20);
  for(int i = 0; i < snakes.size(); i++){
    Snake s = (Snake) snakes.get(i);
    s.draw();
    s.pulse();
  }
}

class Snake {
  PVector loc, loc2, prevloc, prevloc2, vel;
  
  boolean locStopped = false, loc2Stopped = false;

  Snake(float i) {
    float r = random(-0.1, 0.1);
    loc = new PVector(width/2+sin(radians(i*1.9))*199, height/2+cos(radians(i*1.9))*199);
    loc2 = new PVector(width/2+sin(radians((i+r)*1.9))*198, height/2+cos(radians((i+r)*1.9))*198);
    /* Remeber the point so we can set the line back to where is came from */
    prevloc = loc.get();
    prevloc2 = loc2.get();
    
    vel = new PVector(loc2.x-loc.x, loc2.y-loc.y);
    /* Give it some individuality */
    vel.mult(random(1, 2));
  } 

  void draw() {
    strokeWeight(10);
    stroke(255);
    line(loc.x, loc.y, loc2.x, loc2.y);
    strokeWeight(7);
    stroke(0, 150, 255);
    line(loc.x, loc.y, loc2.x, loc2.y);
  }

  void pulse() {
    float dloc = PVector.dist(loc, loc2);
    PVector mid = new PVector(width/2, height/2);
    
    /* if we are in the circle and the length of our line is 100 then move our FIRST location*/
    if (PVector.dist(loc, mid) < 200 && dloc >= 100) {
      locStopped = false;
      loc.add(vel);
      /* if we are in the circle and our SECOND point has stopped, then still continue to move */
    }else if (PVector.dist(loc, mid) < 200 && loc2Stopped){
      locStopped = false;
      loc.add(vel);
    }else{
      /* Stop when we reached the boundary */
      locStopped = true; 
    }
    
    /* if we are in the circle and the length of our line is 100 then move our SECOND location*/
    if (PVector.dist(loc2, mid) < 200 && dloc >= 100) {
      loc2Stopped = false;
      loc2.add(vel);
    }else if (PVector.dist(loc2, mid) < 200 && locStopped){
      /* if we are in the circle and our FIRST point has stopped, then still continue to move */
      loc2Stopped = false; 
      loc2.add(vel);
    }else{
      /* Stop when we reached the boundary */
      loc2Stopped = true; 
    }
    
    /* If both point have reached the boundary, start them back where they came from */
    if(locStopped && loc2Stopped){
      loc = prevloc.get();
      loc2 = prevloc2.get();
    }
  }
}




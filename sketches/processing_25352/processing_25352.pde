

class Dot {

  PVector pos; // position
  PVector vel; // velocity = change in position per frame
  PVector acc; // acceleration
  color c; // colour
  float s; // size

  float maxSpeed = 10.0;
  float avoidScale = 0.05;
  float avoidDist = 100;
  float drag = 0.85;

  float coherenceScale = 0.08;
  float coherenceDist = 180;

  float alignmentScale = 0.1;
  float alignmentDist = 100;


  Dot( PVector _pos, color _c, float _s  ) { // constructor - makes a new object
    pos = _pos; // take the incoming info and store it
    c = _c; // color;
    s = _s; // size;
    vel = new PVector(random(-2,2),random(-2,2));
    acc = new PVector(); // set acceleration to zero
  }

  void run() { // master controller 
    move(); // move!
    bounce(); // bounce
    //toCenter();
    coherence();
    alignment();
    avoid();
    render(); // draw it
  }

  void render() { // something our object can do -- draw itself
    fill(c); // fill the dot with its own colour
    pushMatrix();
    noStroke();
    translate(pos.x, pos.y,pos.z);
    sphereDetail(9);
    sphere(s);
    popMatrix();
    // draw the dot on the screen
    float neighbourDistance = 5000;
    float neighbour2Distance = 5000;
    float neighbour3Distance = 5000;
    Dot neighbour = this;
    Dot neighbour2 = this;
    Dot neighbour3 = this;
    for (int i=0; i<Dots.size(); i++) { // run through all the dots
      Dot D = (Dot) Dots.get(i);// get a dot out
      Dot E = (Dot) Dots.get(i);
      Dot F = (Dot) Dots.get(i);
      float dis = pos.dist(D.pos);// distance to the other dot
      float dis2 = pos.dist(E.pos);
      float dis3 = pos.dist(F.pos);
      if (dis < neighbourDistance  && D != this) { // dont check yourself
        neighbourDistance = dis;
        neighbour = D;
      }
      if (dis2 < neighbour2Distance  && E != this && E != neighbour) { // dont check yourself
        neighbour2Distance = dis2;
        neighbour2 = E;
      }
      if (dis3 < neighbour3Distance && F !=this && F != neighbour && F != neighbour2) { // dont check yourself
        neighbour3Distance = dis3;
        neighbour3 = F;
      }
    }
    stroke(255);
    line(pos.x,pos.y,pos.z,neighbour.pos.x,neighbour.pos.y,neighbour.pos.z); // draw line between dots
    line(pos.x,pos.y,pos.z,neighbour2.pos.x,neighbour2.pos.y,neighbour2.pos.z);
    line(pos.x,pos.y,pos.z,neighbour3.pos.x,neighbour3.pos.y,neighbour3.pos.z);

    fill(random(200,255),100);
    noStroke();
    beginShape(TRIANGLES); //form a surface between three dots
    vertex(neighbour.pos.x, neighbour.pos.y, neighbour.pos.z);
    vertex(neighbour2.pos.x, neighbour2.pos.y, neighbour2.pos.z);
    vertex(neighbour3.pos.x, neighbour3.pos.y, neighbour3.pos.z);
    endShape();
  }


  void move() {
    vel.mult(drag); // drag - scale down velocity
    vel.limit(maxSpeed); // limit max speed
    pos.add(vel); // add velocity vector to our position
    vel.add(acc); // add acceleration to velocity
    acc.mult(0); // reset acceleration to 0
  }

  /*void toCenter() {
    PVector m = new PVector(0,0,0); // the mouse vector
    PVector p = PVector.sub(m,pos); // a "push" vector pointing to the mouse
    p.mult(0.0008); // scale it down a bit
    acc.add(p); // add the mouse push to acceleration
  }*/


  void avoid() { // avoid dots near you
    PVector av = new PVector(); // avoidance force
    for (int i=0; i<Dots.size(); i++) { // run through all the dots
      Dot D = (Dot) Dots.get(i); // get a dot out
      float dis = pos.dist(D.pos); // distance to the other dot
      if (dis < avoidDist) { // if it is close, make a push
        PVector p = PVector.sub(pos,D.pos); 
        float sc = avoidScale * ((avoidDist-dis)/avoidDist); // get weaker with distance
        p.mult(sc); // scale the push
        av.add(p); // add this push to our avoidance force
      }
    }
    acc.add(av); // add avoidance to our acceleration
  }


  void coherence() { // staying together

    PVector ave = new PVector(); // middle (average) of the flock - where we are headed
    int count = 0; // how many dots in our range?
    for (int i=0; i<Dots.size(); i++) {
      Dot D = (Dot) Dots.get(i); // get a dot
      if (pos.dist(D.pos) < coherenceDist) { // if it's within range
        ave.add(D.pos); // add it to our average
        count++; // add one to the count
      }
    }

    ave.div(count); // divide by num dots
    PVector p = PVector.sub(ave,pos); // push to the average pos
    p.normalize(); // scale the push to 1.0
    p.mult(coherenceScale);
    acc.add(p); //  add push to acceleration
  }

  void alignment() { // go in the same direction as your neighbours
    PVector ave = new PVector(); // average velocity of our neighbours
    int count = 0; // how many dots in our range?
    for (int i=0; i<Dots.size(); i++) {
      Dot D = (Dot) Dots.get(i); // get a dot
      if (pos.dist(D.pos) < alignmentDist) { // if it's within range
        ave.add(D.vel); // add its velocity to our average
        count++; // add one to the count
      }
    }
    ave.div(count); // divide by num dots
    ave.normalize(); // scale the push to 1.0
    ave.mult(alignmentScale);
    acc.add(ave); //  add push to acceleration
  }


  void bounce() {
    if (pos.x > width) { // i am at the right hand wall
      vel.x = vel.x * -0.9; // flip my x velocity
    }

    if (pos.x < 0) { // i am at the left hand wall
      vel.x = vel.x * -0.9; // flip my x velocity
    }

    if (pos.y > height) { // i am at the bottom wall
      vel.y = vel.y * -0.9; // flip my y velocity
    }

    if (pos.y < 0) { // i am at the top wall
      vel.y = vel.y * -0.9; // flip my x velocity
    }
  }
}



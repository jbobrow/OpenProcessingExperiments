

PFont font; // name the Pfont font
class Dot { // name class Dot

    PVector pos; // position
  PVector vel; // velocity = change in position per frame
  PVector acc; // acceleration
  // PImage b; //image

  // The font must be located in the sketch's 
  // "data" directory to load successfully







  color c; // colour
  float s; // size
  float rdom = random(10,50); ///random number setting size of ellipse

  float maxSpeed = 10.0; // speed at which hey follow
  float avoidScale = 0.02; // how quickly eturn from a push
  float avoidDist = 100; // distance they avoid each other
  float drag = 0.9; // the lag behind following the mouse

  float coherenceScale = 0.05;
  float coherenceDist = 80;// tightness of the cluster

  float alignmentScale = 1;
  float alignmentDist = 100; // how closley they follow the same path




  Dot( PVector _pos, color _c, float _s  ) { // constructor - makes a new object
    pos = _pos; // take the incoming info and store it
    c = _c;
    s = _s;
    // b = loadImage("f1.jpg"); // used instead of ellipse 
    vel = new PVector(random(-2,2),random(-2,2));
    acc = new PVector(); // set acceleration to zero

  }

  void run() { // master controller 
    move(); // move!
    bounce(); // bounce
    // toMouse(); // follow the mouse
    //coherence(); // swarm together
    alignment(); //go in the same direction as your neighbours
    avoid(); // avoid each other
    render(); // draw it
  }

  void render() { // something our object can do -- draw itself
    fill(c); // fill the dot with its own colour
    int splat = round(random(0,9)); // generate a random whole number of splat font (choose from 10 different splodge characters)

    textFont(font, 55);  //make the font 55pt in size

    text(splat, pos.x, pos.y); // set size using int splat, mouse pos x, and mouse position y
  }

  void move() {
    vel.mult(drag); // drag - scale down velocity
    vel.limit(maxSpeed); // limit max speed
    pos.add(vel); // add velocity vector to our position
    vel.add(acc); // add acceleration to velocity
    acc.mult(0); // reset acceleration to 0
  }
  //void toMouse() {
  //    PVector m = new PVector(mouseX,mouseY); // the mouse vector
  //    PVector p = PVector.sub(m,pos); // a "push" vector pointing to the mouse
  //  p.mult(0.005); // scale it down a bit
  //   acc.add(p); // add the mouse push to acceleration
  // }

  void avoid() { // avoid dots near you
    PVector av = new PVector(); // avoidance force
    for (int i=0; i<Dots.size(); i++) { // run through all the dots
      Dot D = (Dot) Dots.get(i); // get a dot out
      float dis = pos.dist(D.pos); // distance to the other dot
      if (dis < avoidDist) { // if it is close, make a push
        PVector p = PVector.sub(pos,D.pos); // redefining the vectors position
        float sc = avoidScale * ((avoidDist-dis)/avoidDist); // get weaker with distance
        p.mult(sc); // scale the push
        av.add(p); // add this push to our avoidance force
      }
    }
    acc.add(av); // add avoidance to our acceleration
  }


  //  void coherence() { // staying together
  //
  //    PVector ave = new PVector(); // middle (average) of the flock - where we are headed
  //    int count = 0; // how many dots in our range?
  //    for (int i=0; i<Dots.size(); i++) {
  //      Dot D = (Dot) Dots.get(i); // get a dot
  //      if (pos.dist(D.pos) < coherenceDist) { // if it's within range
  //        ave.add(D.pos); // add it to our average
  //        count++; // add one to the count
  //      }
  // }
  //    ave.div(count); // divide by num dots
  //    PVector p = PVector.sub(ave,pos); // push to the average pos
  //    p.normalize(); // scale the push to 1.0
  //    p.mult(coherenceScale);
  //    acc.add(p); //  add push to acceleration
  //    
  //  }

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




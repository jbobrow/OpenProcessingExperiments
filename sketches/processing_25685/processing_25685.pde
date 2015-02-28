

class Dot {

  PVector pos; // position
  PVector vel; // velocity = change in position per frame
  PVector acc; // acceleration
  color c; // colour
  float s; // size

  float maxSpeed = 20.0;
  float avoidScale = 0.05;
  float avoidDist = 50;
  float drag = 0.95;
  
  float coherenceScale = 0.05;
  float coherenceDist = 80;
  
  float alignmentScale = 0.1;
  float alignmentDist = 100;
  
  //float rotation = 0;
 // float gridpos_x;
 // float gridpos_y;
  PVector gridpos;


  Dot( PVector _gridpos, color _c, float _s  ) { // constructor - makes a new object
    pos = new PVector(random(width),random(height)); //_pos; // take the incoming info and store it
    c = _c;
    s = _s;
    vel = new PVector(random(-2,2),random(-2,2));
    acc = new PVector(); // set acceleration to zero
    gridpos = _gridpos;
   // gridpos_x = _gridpos_x;
    //gridpos_y = _gridpos_y;
  }

  void run() { // master controller 
    move(); // move!
    bounce(); // bounce
    toMouse();
   coherence();
    alignment();
    avoid();
    render(); // draw it
  }

  void render() { // something our object can do -- draw itself
    //fill(pos.y); // fill the dot with its own colour
    //ellipse( gridpos.x,gridpos.y, pos.x*0.01,pos.x*0.01 ); // draw the dot on the screen
     
     pushMatrix(); // save current transform
     translate(gridpos.x,gridpos.y); // translate to the grid position
     rotate(pos.x*0.05); // rotate
     line(0,0,pos.y*0.02,0); //draw the line
     //ellipse(pos.y*0.02,0,pos.y*0.02,0);
   
    popMatrix(); // reset to saved transform
  }

  void move() {
    vel.mult(drag); // drag - scale down velocity
    vel.limit(maxSpeed); // limit max speed
    pos.add(vel); // add velocity vector to our position
    vel.add(acc); // add acceleration to velocity
    acc.mult(0); // reset acceleration to 0
  }

  void toMouse() {
    PVector m = new PVector(mouseX,mouseY); // the mouse vector
    float mousedistance = m.dist(gridpos); // distance between thispoint and the mouse
 
 if (mousedistance > 100) fill(255,0,0) ;
 else{fill(0,0,255);}
 
    if (mousedistance > 100) stroke(255,0,0) ; // bail out if distance is too large force field
       else{stroke(0,0,255);}//if the force field is 
       if (mousedistance > 100) return ;
    PVector p = PVector.sub(m,gridpos); // a "push" vector pointing to the mouse
    p.mult(0.05); // scale it down a bit
    acc.add(p); // add the mouse push to acceleration
  }

  void avoid() { // avoid dots near you
    PVector av = new PVector(); // avoidance force
    for (int i=0; i<Dots.size(); i++) { // run through all the dots
      Dot D = (Dot) Dots.get(i); // get a dot out
      float dis = gridpos.dist(D.gridpos); // distance to the other dot
      if (dis < avoidDist) { // if it is close, make a push
        PVector p = PVector.sub(gridpos,D.gridpos); 
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
      if (gridpos.dist(D.gridpos) < coherenceDist) { // if it's within range
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
  
  void alignment(){ // go in the same direction as your neighbours
    PVector ave = new PVector(); // average velocity of our neighbours
    int count = 0; // how many dots in our range?
    for (int i=0; i<Dots.size(); i++) {
      Dot D = (Dot) Dots.get(i); // get a dot
      if (gridpos.dist(D.gridpos) < alignmentDist) { // if it's within range
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



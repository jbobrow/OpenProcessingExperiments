

class Dot {


  PVector pos; // position
  PVector vel; // velocity = change in position per frame
  PVector acc; // acceleration
  float maxSpeed = 10.0;

  float drag = 0.99;

  float coherenceScale = 0.09;
  float coherenceDist = 400;
  PVector gridpos;


  Dot( PVector _gridpos) { // constructor - makes a new object
    pos = new PVector(random(5,10),random(5,10)); //_pos; // take the incoming info and store it
    vel = new PVector(random(-3,3),random(-3,3));
    //  vel= new PVector(pos.x*0.05,pos.y*0.05);
    acc = new PVector(); // set acceleration to zero
    gridpos = _gridpos;
  }

  void run() { // master controller 
    move(); // move!
    toMouse();
    coherence();
    render(); // draw it
  }


  void render() { // something our object can do -- draw itself
   
    pushMatrix(); // save current transform
    translate(gridpos.x,gridpos.y); // translate to the grid position
    rotate(-pos.y*0.09); // Swarming rotation
    ellipse(-pos.y*0.05,0,0,pos.y*0.05); // the ellipse, x, y co-ordinate then width and height
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
  
    if (mousedistance > 55) stroke(0,255,0); // if line is 50 or closer/smaller, make the like green
    else {  stroke(0,0,255); }           // otherwise make the line blue
    if (mousedistance > 55) return;    // bail out if distance is too large
  
  
    PVector p = PVector.sub(m,gridpos); // a "push" vector pointing to the mouse
    p.mult(0.9); // scale it down a bit
    acc.add(p); // add the mouse push to acceleration
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
}



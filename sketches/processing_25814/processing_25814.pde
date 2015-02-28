

class Dot {


  PVector pos; // position
  PVector vel; // velocity = change in position per frame
  PVector acc; // acceleration

  float maxSpeed = 10.0; // maximuim speed of dots
  float drag = 0.95; //drag of movements
  float coherenceScale = 0.05; //coherence of dot movement in relation to its neighbours
  float coherenceDist = 100;// if another dot is within this varible cohere to it
 PVector gridpos; //??


  Dot( PVector _gridpos ) { // constructor - makes a new object
    pos = new PVector(random(-10,10),random(-10,10)); // take the incoming info and store it
    vel = new PVector(random(-2,10),random(-2,10)); // vel and pos inducing the controlled "swarming"
    
    acc = new PVector(); // set acceleration to zero
    gridpos = _gridpos;//
  }

  void run() { // master controller 
    move(); // move according to the Pvectors
    toMouse(); //move to mouse
    coherence(); //
    render(); // draw it
  }


  void render() { // something our object can do -- draw itself
    //fill(pos.y); // fill the dot with its own colour
 
    pushMatrix(); // save current transform
 // translate(gridpos.x,gridpos.y);// translate to the grid position
  //rotate(-pos.x*0.05); // swarming rotation
  rect(gridpos.x,gridpos.y, pos.x*0.04,pos.y*0.04);
   // curve(-pos.x*0.08,0.8,0.8,pos.x*0.09,pos.y*0.09,0.9,0.8,pos.y*0.08); //curve itself
    popMatrix(); // reset to saved transform*/
    
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


    if (mousedistance < 80) { //if the line cruve is further than 80, make the line green and fill the curve blue
      stroke(255,0,0);
      fill(255,259,0);
      
    }
    else {stroke(0,255,0);  // otherwise make the line red and fill it with orange
      fill(0,10,255);
      
    }
    if (mousedistance> 100) return; // bail out if distance is too large
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




class Particle {
  //simple particle defined by 
  PVector pos;//position vector
  PVector vel;//velocity vector
  PVector acc;//acceleration vector
  ArrayList path;//list of vectors recording particle position
  color c;
  int t;//local time or "age"
  
  Particle() {
    pos=new PVector(random(-200, 200), 500, random(-200, 200));  
    vel=new PVector(0, 0, 0);
    path=new ArrayList();
    c= color(random(55, 190));
    t=0;
  }


  void update() {
    if (t<200) {//only for first 200 iterations do the following:
      for (int i=0;i<particles.size();i++) {//check all the particles
        Particle other=(Particle)particles.get(i);//pick one particle and call it "other"
        float d=pos.dist(other.pos);//measure the distance between this particle and the other
        if (d>10&&d<150&&t>100)connections.add(new Connection(new PVector(pos.x, pos.y, pos.z), new PVector(other.pos.x, other.pos.y, other.pos.z)));//if the distance between them is within a specified range, and particle is "old enough" (t>100), add a connection
      }
      //follow the target
      acc= PVector.sub(target, pos);
      acc.normalize();
      acc.mult(0.2);
      vel.add(acc);
      vel.mult(0.99);
      pos.add(vel);
      path.add(new PVector(pos.x, pos.y, pos.z));//store current position in "path" list
      t++;//particle is getting "older"
    }
  }

  void display() {
    stroke(c);
    beginShape();//draw entire path
    for (int i=0;i<path.size();i++) {
      PVector v=(PVector)path.get(i);//by getting each previous position vector from the path list
      curveVertex(v.x, v.y, v.z);
    }
    endShape();
  }
}

class Connection {
  //bridge between trajectories defined by:
  PVector bg, end;//beginning and end vector
  color c;//and a color
  
  Connection(PVector _bg, PVector _end) {
    bg=_bg;
    end=_end;
    c=color(map(bg.dist(end), 10, 150, 0, 190));//color depends on the distance between beginning and end
  }
  void display() {
    stroke(c);
    line(bg.x, bg.y, bg.z, end.x, end.y, end.z);
  }
}



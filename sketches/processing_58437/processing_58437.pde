

class Objet {
  PVector pos;
  PVector vel;
  PVector acc;
  float masse;
float speed_y; 
  float speed_x;

  Objet (PVector p, PVector v, PVector a, float m) {
    pos = p.get();
    vel = v.get();
    acc = a.get();
    masse = m;
    speed_y = random(-5,2);
    speed_x = random(-5, 2);


  }


  void update() {
    border();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);// si décocher accélération permanente
  }
void appliqueForce(PVector force) {
  force.div(masse);   
  acc.add(force); 
}
  
  
  PVector getGraviteForce (Objet obj) {
    PVector direction = PVector.sub(pos, obj.pos); 
    float distance = direction.mag();
    distance = constrain(distance,5.0,25.0); //jamais plus petit que 5 et jamais plus grand que 25
    direction.normalize();
    float force = (G * masse * obj.masse)/ (distance*distance);
    direction.mult(force); 
    return direction;
  }




void draw() {
  update();
  fill(255);
  ellipse (pos.x, pos.y, masse*9, masse*9);
}
void border() {
  if (pos.x <0 || pos.x > width) {
    vel.x*=-1;
  }
  if (pos.y <0 || pos.y > height) {
    vel.y*=-1;
  }
}
}


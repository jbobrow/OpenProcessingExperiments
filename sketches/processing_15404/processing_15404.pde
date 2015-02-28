
class Node {
  PVector velocity;
  PVector acceleration;
  PVector position;
  boolean checkpoint;




  Node(PVector _position, PVector _velocity, PVector _acceleration) {
    position = _position;
    velocity = _velocity;
    acceleration = _acceleration;
    checkpoint = false;
  }

  ArrayList neighbors(float distance){
    ArrayList neighbors = new ArrayList();
    for(int i=0; i<nodes.size();++i){
      Node n = (Node) nodes.get(i);
      if (!n.equals(this)){
        float curr_distance = position.dist(n.position);
        if (curr_distance < distance) neighbors.add(n); 
      }

    }
    return neighbors;
  }

  PVector repel(){
    ArrayList neighbors = neighbors(distanceRepel);
    PVector repelDirection = new PVector();
    PVector hood_repel = new PVector();
    for(int i=0;i<neighbors.size();++i) {
      Node n = (Node) neighbors.get(i);
      PVector away = PVector.sub(position, n.position);
      float distanceSq = away.x*away.x+away.y*away.y+away.z*away.z;
      away.mult(1.0/distanceSq);
      hood_repel.add(away);
    }
    if(neighbors.size() != 0) { 
      hood_repel.mult(1.0/(neighbors.size()));
    }
    //hood_repel.normalize();
    return hood_repel;
  }

  void move(float time_step){
    acceleration.set(0,0,0);
    PVector sep;
    sep = repel();
    position.add(PVector.mult(velocity, time_step));
    sep.mult(sepWeight);
    acceleration.add(sep);
    acceleration.mult(time_step);
    velocity.mult(0);
    velocity.add(acceleration);
    velocity.limit(maxVelocity);
    
  }

  void draw() {
    strokeWeight(3);
    line(position.x, position.y, position.x+velocity.x, position.y+velocity.y);
    ellipse(position.x, position.y, 5, 5);
  }
  
  void removeNode(){
    if(abs((position.x - width)) <=cutOff || abs((position.x)) <cutOff || abs((position.y)) <cutOff || abs((position.y - height)) <cutOff){
     nodes.remove(this);
    } 
}

  
}







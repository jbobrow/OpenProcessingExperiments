
class Node {
  PVector velocity;
  PVector acceleration;
  PVector position;


  Node(PVector _position, PVector _velocity, PVector _acceleration) {
    position = _position;
    velocity = _velocity;
    acceleration = _acceleration;
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
      hood_repel.mult(1.0/neighbors.size());
    }
    //hood_repel.normalize();
    return hood_repel;
  }
  
  PVector mouseAttract(){
    PVector center = new PVector(mouseX, mouseY);
    PVector away = PVector.sub(position, center); //from b to a
    float distanceSq = away.x*away.x+away.y*away.y+away.z*away.z;
    if(mousePressed) {
    distanceSq*=-1;
     }

    
    away.mult(-10/distanceSq);
    
    
     
   
    return away;
  }
  
  void move(float time_step){
    acceleration.set(0,0,0);
    PVector sep;
    sep = repel();
    sep.add(mouseAttract());
    position.add(PVector.mult(velocity, time_step));
    acceleration.add(sep);
    acceleration.mult(time_step);
    velocity.add(acceleration);
    velocity.limit(maxVelocity);
  }

  void draw() {
    strokeWeight(4);
    color paint = color(int(velocity.mag()*100), 255, 255, 75);
    stroke(paint);
    line(position.x, position.y, position.x+velocity.x, position.y+velocity.y);
  }
}







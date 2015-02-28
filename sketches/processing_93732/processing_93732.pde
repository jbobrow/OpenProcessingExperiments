
import java.util.Iterator;

ArrayList<Seeker> swarm;
int BORDER = 10;
int NUMBER = 100;
int ATTENTION = 2;
int SIZE = 3;

void setup() {
  size(800, 600);
  swarm = new ArrayList<Seeker>();
  for(int i = 0; i < NUMBER; i++) {
    swarm.add(new Seeker(new PVector(width/2, height/2), new PVector(random(-2,2), random(-2,2))));
  }  
}

void draw() {
  background(255);
  int num = swarm.size();
  if(num > 0) {
    for(int i = 0; i < num; i++) {
      swarm.get(i).move(swarm); 
    }
  } 
}

void mousePressed() {
  swarm.add(new Seeker(new PVector(mouseX, mouseY))); 
}

class Seeker {
  PVector m_location;
  PVector m_velocity;
  PVector m_acceleration;
  
  Seeker(PVector l, PVector v, PVector a) {
    m_location = l;
    m_velocity = v;
    m_acceleration = a;
  } 
  
  Seeker(PVector l, PVector v) {
    this(l, v, new PVector(0,0));
  }
  
  Seeker(PVector l) {
    this(l, new PVector(0,0), new PVector(0,0)); 
  }
  
  void move(ArrayList<Seeker> friends) {
    Seeker friend = this.getClosestNeighbor(friends);
    PVector towards = PVector.sub(friend.m_location, this.m_location);
    this.m_acceleration.add(towards);
    
    Iterator<Seeker> i = friends.iterator();
    Seeker current;
    float distance;
    int lim = 1;
    while(i.hasNext()) {
      current = i.next();
      towards = PVector.sub(current.m_location, this.m_location);
      distance = towards.mag();
      if(distance < 20) {
        towards.mult(3);
        this.m_acceleration.sub(towards);
      }
      if(distance > 100) {
        towards.normalize();
        towards.mult(0.009);
        this.m_acceleration.add(towards); 
      }
    }
    this.m_velocity.add(m_acceleration);
    this.m_velocity.limit(lim);
    this.m_location.add(m_velocity);
    this.m_acceleration = new PVector(0,0);
    this.manageEdges();
    this.evince(friend);
  }
  
  Seeker getClosestNeighbor(ArrayList<Seeker> friends) {
    Iterator<Seeker> i = friends.iterator();
    Seeker current;
    float minDistance = 999999;
    float distance;
    Seeker currentClosestNeighbor = new Seeker(new PVector(0,0));
    while(i.hasNext()) {
      current = i.next();
      distance = PVector.sub(current.m_location, this.m_location).mag();
      if(distance < minDistance && current != this) {
        minDistance = distance;
        currentClosestNeighbor = current; 
      }
    }
    return currentClosestNeighbor;
  }
  
  void evince(Seeker friend) {
    fill(0);
    for(int i = 0; i < 10; i++) {
       
    }
    stroke(255,0,0, 60);
    line(this.m_location.x, this.m_location.y, friend.m_location.x, friend.m_location.y);
    stroke(0,0,0,0);
    fill(255,0,0,50);
    for(int i = 0; i < 5; i++) {
       ellipse(this.m_location.x, this.m_location.y, SIZE*i, SIZE*i);
    }
  }
  
  void manageEdges() {
    if(this.m_location.x < BORDER) {
      this.m_velocity.add(new PVector(10, 0));
      this.m_location.add(this.m_velocity);
    } else if(this.m_location.x > width - BORDER) {
      this.m_velocity.add(new PVector(-10, 0));
      this.m_location.add(this.m_velocity);
    } else if(this.m_location.y < BORDER) {
      this.m_velocity.add(new PVector(0, 10)); 
      this.m_location.add(this.m_velocity);
    } else if(this.m_location.y > height - BORDER) {
      this.m_velocity.add(new PVector(0, -10));
      this.m_location.add(this.m_velocity);
    }
    
  }
}

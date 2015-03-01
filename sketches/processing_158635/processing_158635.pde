
ArrayList <Swarm> swarms;

void setup(){
  size(800, 600);
  swarms = new ArrayList();
  int n_swarms = (int) random(5) + 5;
  for(int i = 0; i < n_swarms; i++){
    swarms.add(new Swarm());
  }
  fill(0, 30);
  noStroke();
}

void draw(){
  //background(255);
  fill(0, 10);
  for(Swarm s : swarms){
    s.update();
    s.display();
  }
  fill(255, 2);
  rect(0, 0, width, height);
}

class Swarm{
  ArrayList <Boid> boids;
  
  Swarm(){
    boids = new ArrayList();
    int n_boids = (int) random(5) + 3;
    for(int i = 0; i < n_boids; i++){
      boids.add(new Boid());
    } 
  }
  
  void update(){
    for(Boid b : boids){
      b.update();
    }
  }
  
  void display(){
    beginShape();
    for(Boid b : boids){
      b.display();
      vertex(b.location.x, b.location.y);
    }
    endShape(CLOSE);
  }
}

class Boid{
  PVector location;
  PVector speed;
  Boid(){
    location = new PVector(random(width), random(height));
    speed = new PVector(random(2) - 1, random(2) - 1);     
  }
  
  void update(){    
    if(location.x > width) location.x = 0;
    if(location.x < 0) location.x = width;
    if(location.y > height) location.y = 0;
    if(location.y < 0) location.y = height;
    
    location.add(speed);    
  }
  
  void display(){
    //ellipse(location.x, location.y, 10, 10);
  }
}

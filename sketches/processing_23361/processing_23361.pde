
public class Cube{
  PVector size;
  PVector position;
  PVector rotation;
  PVector velocity;
  PVector angularVelocity;
  PVector col;
  
  Cube(PVector size, PVector position, PVector col, PVector velocity, PVector angularVelocity){
    this.size = new PVector(size.x, size.y, size.z);
    this.position = new PVector(position.x, position.y, position.z);
    this.col = new PVector(col.x, col.y, col.z);
    this.angularVelocity = new PVector(angularVelocity.x, angularVelocity.y, angularVelocity.z);
    this.velocity = new PVector(velocity.x, velocity.y, velocity.z);
    
    rotation = new PVector(0, 0, 0);   
    n = 0; 
  }
  
  Cube[] breakIntoPieces(){
    float xValue = random(0.3, 0.8), yValue = random(0.3, 0.8), zValue = random(0.3, 0.8);
    
    PVector[] initialVelocities = new PVector[]{
      new PVector(-1, 3, -1), new PVector(1, 3, -1), new PVector(1, 1, 1), new PVector(-1, 1, -1),
      new PVector(-1, -1, -1), new PVector(1, -1, -1), new PVector(1, -3, 1), new PVector(-1, -3, -1)};
      
    //Rotate direction vectors around y axis
    for(int i = 0; i < 8; i++){
      float angle = random(0, 2*PI);
      initialVelocities[i].x = cos(angle);
      initialVelocities[i].z = sin(angle);      
    }
    
    PVector vDir = velocity;
    vDir.normalize();
    for(int i = 0; i < 8; i++){
      initialVelocities[i].add(vDir);
      initialVelocities[i].y *= random(0.5,1);
      initialVelocities[i].x *= random(1,2);
    }
    
    return new Cube[]{ new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[0], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[1], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[2], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[3], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[4], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[5], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[6], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06))),
                                  new Cube(new PVector(size.x * xValue, size.y * yValue, size.z * zValue),
                                   position, col, initialVelocities[7], new PVector(random(-0.03, 0.03), random(-0.03, 0.03), random(-0.06, 0.06)))};
  }
  
  void draw(){
    fill(col.x, col.y, col.z);
    pushMatrix();
    stroke(80);
    strokeWeight(2);
    translate(position.x, position.y, position.z);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    box(size.x, size.y, size.z);
    popMatrix();
  }
  
  void update(){
    position.add(velocity);
    rotation.add(angularVelocity);
    
    if(position.x < 0 || position.x > width)
      velocity.x *= -1;
    
    if(position.y < 0 || position.y > height)
      velocity.y *= -1;
  }
}


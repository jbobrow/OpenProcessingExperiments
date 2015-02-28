
class spark {
  PVector location;
  PVector previous;
  PVector velocity;
  spark() {
    location = new PVector(mouseX, mouseY);
    previous = new PVector(pmouseX, pmouseY);
    float radius = sqrt(random(0,1))*3;
    float angle = random(0,TWO_PI);
    velocity = new PVector(radius*cos(angle), radius*sin(angle)-1.5);
    
    velocity.add(PVector.mult(PVector.sub(location, previous),0.3));
  }
  void update() {
    previous = location.get();
    location.add(velocity);
    velocity.y += 0.05;
  }
}
spark[] sparkList;
int index = 0;
void setup() {
  size(800, 600);
  background(0);
  sparkList = new spark[1000];
  for (int i=0;i<sparkList.length;i++) {
    sparkList[i] = new spark();
  }
  smooth();
}
void draw() {
  noStroke();
  fill(0, 32);
  rect(0, 0, width, height);
  stroke(255, 16, 16);
  for (int i=0;i<sparkList.length;i++) {
    line(sparkList[i].location.x, sparkList[i].location.y, 
    sparkList[i].previous.x, sparkList[i].previous.y);
    sparkList[i].update();
  }
  for (int i=0;i<10;i++) {
    sparkList[index] = new spark();
    index++;
    if (index==sparkList.length) {
      index=0;
    }
  }
}




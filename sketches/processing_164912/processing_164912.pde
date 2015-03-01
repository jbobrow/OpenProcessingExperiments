
//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, repel
// Using collision detection to repel objects
// This example uses some advanced concepts, like
// classes and PVector, but the main detection code
// is the same as the one students will see on Day 8
//----------------------------------------------------

ArrayList<Circle> myBalls;

void setup(){
  size(600, 600);
  myBalls = new ArrayList<Circle>();
}

void draw(){
  background(0);
  for(Circle c : myBalls){
    c.update();
    c.display();
  }
}

void mousePressed(){
  myBalls.add(new Circle(mouseX, mouseY));
}
class Circle{
  PVector pos;
  float radius;
  float final_radius;
  Circle(float x, float y){
    pos = new PVector(x, y);
    radius = 1;
    final_radius = random(30, 60);
  }
  
  void update(){
    for(Circle c : myBalls){
      float distance = dist(c.pos.x, c.pos.y, pos.x, pos.y);
      float minDistance = c.radius + radius;
      if(distance < minDistance && distance > 0){
        PVector escape = new PVector(pos.x - c.pos.x,
                                     pos.y - c.pos.y);
        escape.normalize();
        pos.x += escape.x * 1.1;
        pos.y += escape.y * 1.1;
      }    
    }  
  }

  void display(){
    if(radius < final_radius * 0.99){
      radius += (final_radius - radius) * 0.1;
    }
    stroke(255);
    noFill();
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
  }
}




int time;
int wait = 5000;
boolean halt = false;

ArrayList<Circle> circles;

void setup() {
  size(800,800);
  time = millis();
  circles = new ArrayList<Circle>();
  circles.add(new Circle(width/2,height/2,400));
}
 
void draw() {
  background(255);
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle circle = circles.get(i);
    circle.display();
  }
  
  if(millis() - time > wait && halt == false) {
     for (int i = circles.size()-1; i >= 0; i--) {
    Circle circle = circles.get(i);
    circle.spawn();
  }
  }
}


class Circle {
  float x, y, radius;
  Circle (float xpos, float ypos, float rad) {
    x = xpos;
    y = ypos;
    radius = rad;
  }
  
  void spawn() {
    if(radius > 15) {
      circles.add(new Circle(x + radius/2, y, radius/2));
      circles.add(new Circle(x - radius/2, y, radius/2));
      circles.add(new Circle(x, y + radius/2, radius/2));
      circles.add(new Circle(x, y - radius/2, radius/2));
    } else {
      halt = true;
    }
  }
  
  void display() {
    stroke(3);
    ellipse(x,y, radius, radius);
  }
}
 




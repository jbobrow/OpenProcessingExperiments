
Walker w;
int walkerSize = 10;
 
void setup() { 
  size(300, 300);
  w = new Walker();
  background(0); 
  smooth();
  noStroke();
}
 
void draw() {
  fill(0,20);
  rect(0,0,width,height);
  w.step();
  w.display();
}

class Walker {
  PVector location;
  PVector time;

  Walker() {
    time = new PVector(0,10000);
    location = new PVector(width/2, height/2);
  }

  void step() {
    location.x = map(noise(time.x), 0, 1, 0, width);
    location.y = map(noise(time.y), 0, 1, 0, height);
    time.add(new PVector(0.01,0.01));
  }
  
  void display(){
    fill(0,255,0);
    ellipse(location.x,location.y,walkerSize,walkerSize);
  }
}

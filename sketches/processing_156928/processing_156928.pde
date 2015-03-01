
ArrayList<Object> objects;
boolean mouse;
int counter = 0;

void setup() {
  size(600, 600);
  smooth();
  objects = new ArrayList<Object>();
}

void draw() {
  background(30);
  mouse = checkMouseMoved();

  if (mouse) {
    if (frameCount % 10 == 0) {
      objects.add(new Object(new PVector(mouseX, mouseY)));
    }
  } else if (!mouse) {
    //fill(200, 200, 100, 30);
    fill(225, 200, 40, 30);
    noStroke();
    beginShape(TRIANGLE_FAN);
  for (Object o : objects) {
    vertex(o.position.x, o.position.y);
    vertex(width/2, height/2);
  }
  endShape(CLOSE);
  
  fill(39, 210, 255, 30);
    noStroke();
    beginShape(TRIANGLE_FAN);
  for (Object o : objects) {
    vertex(o.position.y, o.position.x);
    vertex(width/2, height/2);
  }
  endShape(CLOSE);
  
  counter++;
    if (counter > 300) {
      objects = new ArrayList<Object>();
      counter = 0;
    }
}
}

boolean checkMouseMoved() {
  if (mouseX == pmouseX && mouseY == pmouseY) {
    return false;
  } else {
    return true;
  }
}

class Object {

  PVector position;
  Object(PVector pos_) {
    position = pos_.get();
  }
}


//Day 55 #create365

ArrayList<Object> objects;
int num = 500;

void setup() {
  size(640, 640);
  smooth();
  background(0);
  objects = new ArrayList<Object>();
  for (int i = 0; i < num; i++) {
    objects.add(new Object(new PVector(random(width), random(height))));
  }
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);

  if (pmouseX <  mouseX ) {
    for (Object o : objects) {
      o.right = true;
    }
  } else if (pmouseX > mouseX ) {
    for (Object o : objects) {
      o.left = true;
    }
  } else if (pmouseY > mouseY ) {
    for (Object o : objects) {
      o.up = true;
    }
  } else if (pmouseY < mouseY ) {
    for (Object o : objects) {
      o.down = true;
    }
  }


  for (Object o : objects) {

    o.update();
    o.display();
  }
}

class Object {

  PVector position;
  float p1, p2, p3, p4;
  PVector velocity;
  float radius;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  color c = color(random(0, 100), random(200,250), random(200,250));

  Object(PVector pos) {
    position = pos.get();
    if (position.x < width/2) {
      p1 = position.x;
      p2 = width - position.x;
    } else {
      p2 = position.x;
      p1 = width - position.x;
    }
    if (position.y < height/2) {
      p3 = position.y;
      p4 = height - position.y;
    } else {
      p4 = position.y;
      p3 = height - position.y;
    }

    velocity = new PVector(0, 0);
    radius = 5;
  }



  void update() {
    float a = 3 + abs(position.x - width/2)/10;
   float b = 3 + abs(position.y - height/2)/10;

    if (left) {
      if (position.x > p1) {
        velocity = new PVector(-a, 0);
      } else if (position.x <= p1) {
        left = false;
        velocity = new PVector(0, 0);
      }
    }

    if (right) {
      if (position.x < p2) {
        velocity = new PVector(a, 0);
      } else if (position.x >= p2) {
        right = false;
        velocity = new PVector(0, 0);
      }
    } 

    if (down) {
      if (position.y < p4) {
        velocity = new PVector(0, b);
      } else if (position.y >= p4) {
        down = false;
        velocity = new PVector(0, 0);
      }
    }

    if (up) {
      if (position.y > p3) {
        velocity = new PVector(0, -b);
      } else if (position.y <= p3) {
        up = false;
        velocity = new PVector(0, 0);
      }
    }

    position.add(velocity);
  }

  void display() {
    fill(c, 100);
    noStroke();
    ellipse(position.x, position.y, radius, radius);
  }
}


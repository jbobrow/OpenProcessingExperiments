
Shape[] shapeCollection; // an array of our classes
int objectCount = 150; // how many objects
int drawMode = 0; // what do we draw?

void setup() {
  size(400, 400); 
  smooth();

  // create 100s of objects
  // first create the array
  // then for each element, create a new object
  shapeCollection = new Shape[objectCount];
  for(int i=0; i<objectCount; i++) {
    shapeCollection[i] = new Shape();
  }
}

void draw() {  
  background(0);

  for(int i=0; i<objectCount; i++) {
    // update position & draw
    shapeCollection[i].update();
    shapeCollection[i].display();
  }
}


class Shape {
  PVector pos;

  float diameter;
  float rotation;
  float speed;
  
  color shapeColor;
  int animateMode;

  Shape() {
    pos = new PVector();
    speed = random(0.3, 0.7);

    diameter = random(50, 130);
    rotation = random(0, 360);

    animateMode = (int)random(4);

    pos.x = random(0, width);
    pos.y = random(0, height);
    
    randomColor();
  }

  void update() {
    // move the object
    if(animateMode == 0) {
      pos.x += speed;
      if(pos.x > width+diameter) pos.x = -diameter;
    } 
    else if (animateMode == 1) {
      pos.x -= speed;
      if(pos.x < -diameter) pos.x = width+diameter;
    } 
    else if (animateMode == 2) {
      pos.y += speed;
      if(pos.y > height + diameter) pos.y = -diameter;
    } 
    else if (animateMode == 3) {
      pos.y -= speed;
      if(pos.y < -diameter) pos.y = height+diameter;
    }
    
    diameter = 90+cos(radians(rotation))*40;
    rotation+=0.8;
  }

  void display() {
    // draw the line
    noStroke();
    fill(shapeColor);
    ellipse(pos.x, pos.y, diameter,diameter);
    //rect(pos.x, pos.y, diameter,diameter);
  }

  void randomColor() {
    int randomColor = (int)random(0, 5);

    if(randomColor == 0) {
      shapeColor = color(6, 87, 147);
    } 
    else if(randomColor == 1) {
      shapeColor = color(204, 57, 39);
    } 
    else if(randomColor == 2) {
      shapeColor = color(37, 50, 27);
    } 
    else if(randomColor == 3) {
      shapeColor = color(232, 195, 37);
    } 
    else if(randomColor == 4) { 
      shapeColor = color(233, 87, 42);
    }
  }
}


ArrayList<Object> objects;
int resolution = 20;
boolean overObject = false;
float angle = 0;
color c = color(245, 171, 10) ;

void setup() {
  size(600, 600);
  smooth();

  objects = new ArrayList<Object>();
  for (int i = 0; i < 1.5*width/resolution; i++) {
    for (int j = 0; j < 1.5*height/resolution; j++) {
      objects.add(new Object(new PVector( resolution * (i +0.5) - width*0.75, resolution * (j+ 0.5) - height*0.75)));
    }
  }
}

void draw() {
  background(0);

  translate(width/2, height/2);
  if (mousePressed) {

    angle += 0.01;
  }
  rotate(angle);

  for (Object object : objects) {
    //object.update();
    object.checkMouse();

    object.display();
  }
  for (Object object : objects) {
    object.wave();
  }
}

class Object {

  PVector position;
  int lifespan;



  Object(PVector p_) {
    position = p_;
  } 

  void update() {
  }

  void checkMouse() {
    if (mouseX - width/2 > position.x - resolution/2 && mouseX - width/2 < position.x + resolution/2 && mouseY - height/2 > position.y - resolution/2 && mouseY - height/2 < position.y + resolution/2) {
      if (!overObject) {
        overObject = true;
        lifespan = 256;
      }
    } else {
      overObject = false;
    }
  }

  void wave() {

    noStroke();
    int a = 2;
    for (int i = 0; i < 10; i++) {
      fill(50 + 10*i, 100, lifespan - 20*i, lifespan-10*i);
      rectMode(CENTER);

      rect(position.x + a*(255 - lifespan) + 5*i, position.y, resolution+1, resolution+1);
      rect(position.x - a*(255 - lifespan) - 5*i, position.y, resolution+1, resolution+1);
    }
    lifespan--;


    if (lifespan < 0) {
    }
  }

  void display() {
    int b = 10;
    rectMode(CENTER);
    if (random(1) < 0.1) {
      color c1 = color(245 + random(-b, b), green(c) + random(-b, b), blue(c) + random(-b, b));
      fill(c1);
    } else {
      fill(c);
    }
    noStroke();

    rect(position.x, position.y, resolution+1, resolution+1);
  }
}



//Ellipses of 4 different colors that change shape and path (and overwrite the path laid down by the previous ellipse).
Path myPath;

float x1, x2, y1, y2;
color c1, c2;

void setup() {
  size(200, 200);
  background(0);
  myPath = new Path();
}

void draw() {

  myPath.update();
  myPath.display();
}

class Path {

  float x1 = random(20, 20);
  float y1 = random(20, 20);
  float x2 = random(20, 20);
  float y2 = random(20, 20);
  color c1 = color(255, 0, 0); //red
  color c2 = color(0, 0, 255); //blue
  color c3 = color(255, 255, 0); //yellow
  color c4 = color(0, 255, 0); //green

  Path() {
  }

  void update() {

    x1 = x1 - random(-2, 2);
    y1 = y1 - random(-2, 2);
    x2 = x2 + random(-2, 2);
    y2 = y2 + random(-2, 2);
  }


  void display() {

    //red ellipse
    stroke(c1); 
    ellipse(x1, y1, x2, y2);
    //blue ellipse
    stroke(c2);
    ellipse(x2, y2, x1, y1);
    //yellow ellipse
    stroke(c3);
    ellipse(x1, y2, x2, y1);
    //green ellipse
    stroke(c4);
    ellipse(x2, y1, x1, y2);
  }
}



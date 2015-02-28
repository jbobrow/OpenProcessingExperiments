
PolygonX p, o;
void setup() {
  size(400, 400);
  p = new PolygonX(6, 100);
  o = new PolygonX(3, 100);
}

void draw() {
  background(-1);
  translate(width/2, height/2); // for the simplicity 
  p.display();
  p.update();
  translate(width/2-100, height/2-100); // you can use Array for multiple instance or you can just use Arraylist and generate polygons at mouse click postion translate(mouseX,mouseY)
  o.display();
  o.update();
}

//---------- polygon class ------------
class PolygonX {
  int edges, size;
  float speed, v;
  color c;
  PolygonX(int edges, int size) {
    this.edges = edges;
    this.size = size;
    v = random(0, 0.1);
    c = (color) random(#000000);
  }

  void display() {
    fill(c);
    noStroke();
    pushMatrix();
    rotate(speed);
    beginShape();
    for (int i=0;i<edges+1;i++) {
      float y = size*sin(i*2*PI/edges);
      float x = size*cos(i*2*PI/edges);
      vertex(x, y);
    }
    endShape();
    popMatrix();
  }
  void update() {
    speed=speed+v;
  }
}


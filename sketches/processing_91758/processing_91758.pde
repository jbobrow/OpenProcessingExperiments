
//siatka - Piotr Welk

Particle particle;
PVector a, dir;


void setup() {
  size(600,600);
  background(0);
  textSize(10);
  smooth();
  frameRate(300);
  particle = new Particle(14000);
}
void draw() {

  background(0);
  //stroke(0, 10);
  noStroke();

  particle.render();

}

class Particle {
  int li;
  ArrayList points = new ArrayList();

  Particle(int d) {
    li = d;
    for (int i=0;i<d;++i) {
      points.add(new PVector(random(width), random(height)));
    }
  }

  void render() {

    for (int i=0;i<li;i=i+1) {
      //fill(int(random(255)));
      PVector po = (PVector)points.get(i);
      a = new PVector(mouseX, mouseY);

      PVector dir = PVector.sub(a, po);
      dir.normalize();
      dir.div(dist(mouseX, mouseY, po.x, po.y)/210);

      if (dist(mouseX, mouseY, po.x, po.y)<50) {
        if (mousePressed == true) {
          po.sub(dir);
          // po.normalize();
          
        }
        ellipse(po.x, po.y, 10, 10);
      }
      else {
        ellipse(po.x, po.y, 10, 10);
      }
    }
  }
}

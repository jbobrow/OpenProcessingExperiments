
int zoom=11;
ArrayList planets;

void setup() {
  size(600, 600, P3D);
  smooth();

  planets=new ArrayList();
  planets.add(new Planet(1));

  for (int i=1; i<20; i++) {
    planets.add(new Planet(i*int(random(10, 15))));
  }

  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  );
    lights();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  scale(zoom);
  rotateX( map(mouseX, 0, width, -PI, PI));
  rotateY( map(mouseY, 0, height, -PI, PI) );

  pushMatrix();
  noStroke();
  fill(255, 168, 0);

  translate(3, 0, 0);
  sphere(3);
  translate(-6, 0, 0);
  sphere(3);
  popMatrix();

  for (int i=planets.size()-1;i>0;i--) {
    Planet p1= (Planet) planets.get(i);
    p1.update();
    stroke(255);
    noFill();
    ellipse(0,0,p1.d*2,p1.d*2);
  }
  println(frameRate);
}

class Planet {
  int d;
  float r, g, b;
  float rot;
  Planet(int cd) {
    d=cd;
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
    rot=random(-PI,PI);
  }

  void update() {
    rotate(rot);
    pushMatrix();
    noStroke();
    fill(r,g,b);
    translate(d, 0, 0);
    sphere(1);
    popMatrix();
  }
}
void mouseWheel(int delta) {
  zoom-=delta*5;
}



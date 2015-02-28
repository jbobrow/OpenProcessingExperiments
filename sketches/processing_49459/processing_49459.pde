
int zoom=5;
float r=0;
Ship s1;
ArrayList Ships;

void setup() {
  size(700, 700, P3D);
  background(0);
  smooth();

  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  );

  Ships=new ArrayList();

  Ships.add(new Ship(50, 0, 0, 1));
  
  for(int i=0; i<12; i++){
    Ships.add(new Ship(50+i*10, random(-30,30), random(-30,30), 3-i*.25));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  r+=.02;
  rotateY(r);
  scale(zoom);
  noStroke();
  fill(168, 140, 140);
  sphere(10);
  noFill();
  stroke(0, 255, 168, 100);
  sphere(15);

  for(int i=Ships.size()-1;i>0;i--){
    Ship s1=(Ship) Ships.get(i);
    s1.update();
  }
  println(frameRate);
}

void mouseWheel(int delta) {
  zoom-=delta*2;
}

class Ship {
  float x, y, z;
  float s;
  Ship(float cx, float cy, float cz, float cs) {
    x=cx;
    y=cy;
    z=cz;
    s=cs;
  }

  void update() {
    pushMatrix();
    translate(x, y,z);
    noStroke();
    fill(255, 255);
    scale(s, s/4, s/4);
    sphere(3);
    translate(2, -2, 2);
    sphere(1);
    translate(0, 0, -4);
    sphere(1);
    translate(0, 4, 0);
    sphere(1);
    translate(0, 0, 4);
    sphere(1);
    popMatrix();
  }
}



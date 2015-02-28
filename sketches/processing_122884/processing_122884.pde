
// grass
ArrayList<Blade> grass = new ArrayList<Blade>();
ArrayList<Wave> waves = new ArrayList<Wave>();
float noisex, noisey;

boolean flag = false;


void setup() {
  size(440,440);
  smooth();
  for(int i = 0; i < 1500; i++) {
    PVector p = new PVector(random(width), random(height));
    Blade b = new Blade();
    b.pos = p.get();
    grass.add(b);
  }
  noisex = 0.0;
  noisey = 0.0;
}



void draw() {
  background(#266718);
  noisex += 0.02;
  noisey += 0.01;
  for(Blade b : grass) {
    b.update();
    b.draw();
  }
  for(Wave w : waves) {
    w.update();
    w.draw();
  }
}


void mousePressed() {
  Wave w = new Wave();
  w.pos = new PVector(mouseX, mouseY);
  waves.add(w);
}



class Blade {
  PVector pos = new PVector();
  PVector dir = new PVector();
  PVector blown = new PVector();
  
  Blade() {};
  
  void update() {
    float mg = 35.0;
    dir.x = mg*noise(4*pos.x/width + 4*pos.y/height + noisex) - mg/2;
    dir.y = mg*noise(4*pos.x/width + 4*pos.y/height + 33 + noisey) - mg/2;
    blown.mult(0.95);
    for(Wave w : waves) {
      if(abs(pos.dist(w.pos) - w.radius) < 5.0) {
        PVector d = pos.get();
        d.sub(w.pos);
        d.normalize();
        d.mult(min(25.0,2000/w.radius));
        d.div(5.0);
        blown.add(d);
        blown.limit(30.0);
      }
    }
  }
  
  void draw() {
    stroke(80,185,56,100);
    strokeWeight(3.0);
//    line(pos.x,pos.y,pos.x+dir.x+blown.x, pos.y-20.0+dir.y+blown.y);
    noStroke();
    fill(80,185,56,100);
    beginShape();
    vertex(pos.x-1.0,pos.y);
    vertex(pos.x+dir.x+blown.x, pos.y-30.0+dir.y+blown.y);
    vertex(pos.x+1.0,pos.y);
    endShape();
  }
};





class Wave {
  PVector pos = new PVector();
  float radius = 0.0;
  
  Wave() {};
  
  void update() {
    radius += 2.0;
  }
  
  void draw() {
    noFill();
    float a = 255;
    a = 10/radius;
    a = max(0,a);
    a = min(a,1.0);
    a *= 200.0;
    stroke(255,a);
    strokeWeight(8.0);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
};

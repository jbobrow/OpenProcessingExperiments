
int gridDim = 30;
    int numCharges = 5;
    float maxStrengthPerCharge = 100/numCharges;
    ArrayList <Vector> field = new ArrayList <Vector> ();
    ArrayList <Electron> charges = new ArrayList <Electron> ();
    PVector mouse = new PVector();
     
    void setup() {
      size(800, 600);
      smooth();
      strokeWeight(1.5);
      int w = width/gridDim;
      int h = height/gridDim;
      for (int y=0; y<gridDim; y++) {
        for (int x=0; x<gridDim; x++) {
          field.add(new Vector((x+0.5)*w, (y+0.5)*h));
        }
      }
      resetElectrons();
    }
     
    void draw() {
      background(255);
      mouse.set(mouseX, mouseY, 0);
      for (Electron e : charges) {
        e.update();
        e.display();
      }
      for (Vector v : field) {
        v.update();
        v.display();
      }
    }
     
    void keyPressed() {
      resetElectrons();
    }
     
    void mousePressed() {
      for (Electron e : charges) {
        if(mouse.dist(e.pos) < e.charge*0.5) {
          e.selected = true;
        }
      }
    }
     
    void mouseReleased() {
      for (Electron e : charges) {
        e.selected = false;
      }
    }
     
    void resetElectrons() {
      charges.clear();
      for (int i=0; i<numCharges; i++) {
        charges.add( new Electron(random(width), random(height), random(30, 100)) );
      }
    }
     
       class Electron {
      PVector pos;
      float charge;
      boolean selected;
     
      Electron(float x, float y, float charge) {
        pos = new PVector(x, y);
        this.charge = charge;
      }
     
      void update() {
        if (selected) { pos.set(mouseX, mouseY, 0); }
      }
     
      void display() {
        pushMatrix();
        translate(pos.x, pos.y);
        noStroke();
        fill(0);
        ellipse(0, 0, charge, charge);
        popMatrix();
      }
    }
      class Vector {
      PVector pos, dir;
     
      Vector(float x, float y) {
        pos = new PVector(x, y);
        dir = new PVector();
      }
     
      void update() {
        dir.set(0,0,0);
        for (Electron e : charges) {
          PVector currentDir = e.pos.get();
          float magnitude = map(currentDir.dist(pos), 0, width, maxStrengthPerCharge, 0);
          currentDir.sub(pos);
          currentDir.normalize();
          currentDir.mult(-magnitude);
          dir.add(currentDir);
        }
      }
     
      void display() {
        pushMatrix();
        translate(pos.x, pos.y);
        stroke(0);
        line(0, 0, dir.x, dir.y);
        translate(dir.x, dir.y);
        rotate(atan2(dir.y, dir.x));
        triangle(3,0,0,-3,0,3);
        popMatrix();
      }
    }

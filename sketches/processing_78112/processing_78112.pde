
import ijeoma.motion.*;
import ijeoma.motion.tween.*;

Parallel pgp;

ArrayList<PyramidGroup> pyramidGroups;

float w = 75, h = 150, d = 75, duration = 150;

public void setup() {
  size(screenWidth, screenHeight, P3D);
//  size(800, 600, P3D);

  Motion.setup(this);
  setupPyramids();
}

public void setupPyramids() {  
  pgp = new Parallel();
  pyramidGroups = new ArrayList<PyramidGroup>();

  for (int y = 0; y < height; y+=h) {
    for (int x = 0; x < width; x+=w+w/2) { 
      pyramidGroups.add(new PyramidGroup(-width/2+x, -height/2+y, w, h, d, duration));
    }
  }

  pgp.repeat().play();
  pgp.play();
}

public void draw() {
  background(0);

  lights();

  translate(width/2, height/2);
  rotateX(radians(map(mouseY, 0, height, -45, 45))); 
  rotateY(radians(map(mouseX, 0, width, -45, 45)));

  for (PyramidGroup pg:pyramidGroups)  
    pg.draw();
}

public void keyPressed() {
  setupPyramids();
}

public void mousePressed() {
  pgp.pause();
}

public void mouseReleased() {
  pgp.resume();
}

public void mouseDragged() {
  pgp.seek(norm(mouseX, 0, width));
}

class PyramidGroup {
  Pyramid p1, p2;
  Sequence ps;

  PyramidGroup (float x, float y, float w, float h, float d, float duration) {
    p1 = new Pyramid(x, y, w, h, d, duration, 0);
    p2 = new Pyramid(x, y, w, -h, d, duration, duration);

    ps = new Sequence().add(p1.pp).add(p2.pp); 
    pgp.add(ps);
  }

  void draw() {
    p1.draw();
    p2.draw();
  }
}

class Pyramid {
  float x, y, w, h, d;
  float a = 255;
  float ry = 0;

  Face f1, f2, f3, f4;

  Sequence fs = new Sequence();
  Parallel pp = new Parallel();

  Tween ty, ryt;

  Pyramid(float x, float y, float w, float h, float d, float duration, 
  float delay) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.d = d;

    f1 = new Face();
    f1.a = new PVector(0, -h / 4, 0);
    f1.b = new PVector(-w / 2, h / 2 - h / 4, d / 2);
    f1.c = new PVector(-w / 2, h / 2 - h / 4, -d / 2);

    f2 = new Face();
    f2.a = new PVector(0, -h / 4, 0);
    f2.b = new PVector(w / 2, h / 2 - h / 4, -d / 2);
    f2.c = new PVector(-w / 2, h / 2 - h / 4, -d / 2);

    f3 = new Face();
    f3.a = new PVector(0, -h / 4, 0);
    f3.b = new PVector(w / 2, h / 2 - h / 4, -d / 2);
    f3.c = new PVector(w / 2, h / 2 - h / 4, d / 2);

    f4 = new Face();
    f4.a = new PVector(0, -h / 4, 0);
    f4.b = new PVector(-w / 2, h / 2 - h / 4, d / 2);
    f4.c = new PVector(w / 2, h / 2 - h / 4, d / 2);

    float fd = duration / 4; 

    if (h > 0) {
      fs.add(new Tween(fd).add(f1.b, "y", f1.b.y - h).add(f1.c, "y", 
      f1.c.y - h))
        .add(new Tween(fd).add(f2.b, "y", f2.b.y - h).add(f2.c, 
        "y", f1.c.y - h))
          .add(new Tween(fd).add(f3.b, "y", f3.b.y - h).add(f3.c, 
          "y", f3.c.y - h))
            .add(new Tween(fd).add(f4.b, "y", f4.b.y - h).add(f4.c, 
            "y", f4.c.y - h));
    } 
    else {
      fs.add(new Tween(fd).add(f1.a, "y", f1.a.y + h))
        .add(new Tween(fd).add(f2.a, "y", f2.a.y + h))
          .add(new Tween(fd).add(f3.a, "y", f3.a.y + h))
            .add(new Tween(fd).add(f4.a, "y", f4.a.y + h));
    }

    ty = new Tween(duration).add(this, "y", y + abs(h / 2));
    ryt = new Tween(duration).add(this, "ry", TWO_PI); 

    pp.add(fs).add(ty).add(ryt);
  }

  void draw() {
    if (fs.isPlaying() && !fs.isDelaying()) {
      pushMatrix(); 
      translate(x, y);
      rotateY(ry);
      noStroke();
      fill(255, 0, 0, a);
      f1.draw();
      fill(255, 255, 0, a);
      f2.draw();
      fill(0, 255, 255, a);
      f3.draw();
      fill(0, 255, 0, a);
      f4.draw();
      popMatrix();
    }
  }
}

class Face {
  PVector a, b, c;

  void draw() {
    beginShape(TRIANGLES);
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    endShape();
  }
}




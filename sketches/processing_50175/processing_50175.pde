
float cvalue = 0;
import processing.opengl.*;

Particle particle[];

void setup() {

  size(600, 600, OPENGL);
  //smooth();

  particle = new Particle [40 * 300];

  for (int i=0; i<particle.length; i++) {
    particle[i]=new Particle(i/50, 300, 300);
  }
  
  
}

void draw() {

//  z = random(145);
//  zz = random(0,255);
    
  background(0);
  noStroke();

  stroke(cvalue,100,cvalue);

//trigger the particles  
  for (int i=0; i <particle.length; i++) {
    particle[i].update();
  }
}


//randomly assign different color
 void mousePressed() {
  if(cvalue > 150) {
    cvalue = random(0, 255);
  } else {
    cvalue = 255;
  }
}

////////////////////////////////////////////////////////////////////

class Particle {
  float id, x, y, xp, yp, s, d;

  public Particle (float _id, float _x, float _y) {
    
    
    id = random(_id);
    x = xp = _x;
    y = yp = _y;
    s = random (6, 15);
  }

  void update() {

    id += 0.01;
    d = (noise (s, x/mouseY, y/mouseX) + s ) * mouseX * 5;

    x += sin(radians(d)) * s;
    y += cos(radians(d)) * s;

    //if (x < -10) {
    //  x = xp = width + 10;
    //}
   
    //offscreen rewind
    
    if (x > width + 100) { 
      x = xp = -10;
    }
    
    if (y <- 10) {
      y = yp = height + 10;
    }
    
    if (y > height+10) { 
      y = yp = -100;
    }
    
    line (xp, yp, x, y);
    xp = x;
    yp = y;
  }
}



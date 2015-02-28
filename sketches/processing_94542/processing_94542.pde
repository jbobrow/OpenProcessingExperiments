
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

ArrayList walkers;
PeasyCam cam;
int maxSteps = 500;

void setup() {
  size(800, 400, P3D);
  walkers = new ArrayList();
  for(int i = 0; i < 100; i++)
    walkers.add(new Walker());
  cam = new PeasyCam(this, 0, 0, 0, 200);
}

void draw() {
  background(0);
  for(int i = 0; i < walkers.size(); i++) {
    Walker w = (Walker) walkers.get(i);
    w.noiseStep();
    w.draw();
  }
}

class Walker {
  float[] x;
  float[] y;
  float[] z;
  float seed;
  //color[] c;
  int i;
  float maxX, minX, maxY, minY, maxZ, minZ;
  
  
  Walker() {
    x = new float[1];
    y = new float[1];
    z = new float[1];
    seed = random(100);
    //c = new color[1];
    x[0] = 0;
    y[0] = 0;
    z[0] = 0;
    maxX = minX = maxY = minY = 0;
    minZ = maxZ = 0;
    //c[0] = color(196, 196, 196);
    i = 0;
  }
  
  void step() {
    x = append(x, x[i] + random(3) - 1.5);
    y = append(y, y[i] + random(3) - 1.5);
    z = append(z, z[i] + random(3) - 1.5);
    /*c = append(c, color(constrain(red(c[i]) + random(3) - 1.5, 128, 255),
                        constrain(green(c[i]) + random(3) - 1.5, 128, 255),
                        constrain(blue(c[i]) + random(3) - 1.5, 128, 255)));*/
    i++;
    if(x[i] < minX) minX = x[i];
    if(x[i] > maxX) maxX = x[i];   
    if(y[i] < minY) minY = y[i];
    if(y[i] > maxY) maxY = y[i];   
    if(z[i] < minZ) minZ = z[i];
    if(z[i] > maxZ) maxZ = z[i];
    if(i > maxSteps) {
      x = subset(x, 1);
      y = subset(y, 1);
      z = subset(z, 1);
      i--;
    }
  }
  
  
  void noiseStep() {
    x = append(x, x[i] + (noise(frameCount * (keyPressed ? 1 : 0.01), i * 0.01, seed) * 3) - 1.5);
    y = append(y, y[i] + (noise(seed, frameCount * (keyPressed ? 1 : 0.01), i * 0.01) * 3) - 1.5);
    z = append(z, z[i] + (noise(i * 0.01, seed, frameCount * (keyPressed ? 1 : 0.01)) * 3) - 1.5);
    i++;
    if(x[i] < minX) minX = x[i];
    if(x[i] > maxX) maxX = x[i];   
    if(y[i] < minY) minY = y[i];
    if(y[i] > maxY) maxY = y[i];   
    if(z[i] < minZ) minZ = z[i];
    if(z[i] > maxZ) maxZ = z[i];
    if(i > maxSteps) {
      x = subset(x, 1);
      y = subset(y, 1);
      z = subset(z, 1);
      i--;
    }
  }
  
  void draw() {
    for(int j = 0; j <= i; j++) {
      stroke(map(x[j], minX, maxX, 128, 255), map(y[j], minY, maxY, 128, 255), map(z[j], minZ, maxZ, 128, 255));
      point(x[j], y[j], z[j]);
    }
  }
}


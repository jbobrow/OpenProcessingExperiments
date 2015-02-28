
import processing.opengl.*;
import ddf.minim.*;
Minim minim;
AudioInput in;

Moon moons;

PShape egg;

float strokeMap;
void setup() {
  size(1280, 800, P3D);
  noStroke();
  egg = loadShape("eggWhite.svg");
  egg.scale(0.8);
  egg.disableStyle();
  
  minim = new Minim(this);
  minim.debugOn();
 
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);


}

void draw() {
  noStroke(); 
  background(0); 
  strokeMap= map(in.left.get(0)*50, -0.6812134,0.76312256, 3, 0);
  fill(255);
  stroke(255);
  strokeWeight(strokeMap);
  
  
  for(int i=0; i<width; i+=260){
    for(int j=0; j<height-100; j+=260){
      shape(egg,i,j);
    }
  }

moons = new Moon(in.left.get(0)*50,in.right.get(0)*50);  
//moons.grid();
moons.update();

  
}

class Moon {
  float sensorL, sensorR, sensorLmapped, sensorRmapped;
  float easing, x, y;
  float dirX, dirY;
  
  Moon (float tempSensorL, float tempSensorR) {
    sensorL = tempSensorL;
    sensorR = tempSensorR;
    easing = 0.05;
  }
  
  void update() {
      fill(255,230,0);
      noStroke();
    sensorLmapped = int(map(sensorL, -0.6812134,0.76312256, 0, width));  
    sensorRmapped = int(map(sensorR, -0.6812134,0.76312256, 0, height));  
      float targetX = sensorLmapped;
      float dx = targetX - x;
        if(abs(dx) > 1) {
        x += dx * easing;
  }
  
      float targetY = sensorRmapped;
      float dy = targetX - x;
        if(abs(dy) > 1) {
        y += dy * easing;
  }

    float dirY = (x / float(height) - 0.5) * 2;
    float dirX = (y / float(width) - 0.5) * 2;
    
  ambientLight(102, 102, 102); 
  directionalLight(255, 255, 255, -dirX, -dirY, -1); 
  translate(140, 120, 0); 

for(int i=0; i < width-100; i+=256) {
for(int j=0; j < height; j+=256) {
  pushMatrix();
  translate(i, j, 0); 
  sphere(60);
  popMatrix();
      }
    }
  }
}
  
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}

  




import peasy.*;

float speed = .05;

PeasyCam cam;
Candide candide;
float[] auOffsets;

void setup() {
  size(512, 512, P3D);
  cam = new PeasyCam(this, width);
  candide = new Candide();
  
  auOffsets = new float[candide.auWeights.length];
  for(int i = 0; i < auOffsets.length; i++)
    auOffsets[i] = random(120 * auOffsets.length);
  
  cam.rotateX(PI);
  cam.rotateY(PI);
}

void draw() {
  background(255);
  candide.draw();
  
  for(int i = 0; i < auOffsets.length; i++)
    candide.auWeights[i] = pow(noise(auOffsets[i] + (speed * (float) frameCount)), 3);
}


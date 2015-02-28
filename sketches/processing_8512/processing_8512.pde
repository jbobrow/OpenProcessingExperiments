
//import processing.opengl.*;

int numSpheres = 510;
float speed = .01;
float radius = 750;
float r = 15;
void setup() {
  //size(800,800,OPENGL);
  size(800,800,P3D);
  noStroke();
  sphereDetail(6);
}

void draw() {
  background(0);
  directionalLight(255, 255, 255, 0, 1, 0);
  directionalLight(105, 105, 215, 0, -1, -.3);  

  translate(mouseX,mouseY);
  for (int i = 0; i < numSpheres; i++) {                  
    fill(100,300,255);  
    randomSeed(i+10);
    float x = random(0,100);
    randomSeed(i+20);
    float y = random(0,200);
    randomSeed(i+30);
    float z = random(0,300);
    pushMatrix();
    translate(map(noise(speed * frameCount + x),0,1,-radius,radius),
    map(noise(speed * frameCount + y),0,1,-radius,radius),
    map(noise(speed * frameCount + z),0,1,-radius,radius));

    sphere(r);
    popMatrix();
  }
}









Heartbeat[] myHeartbeats;
int heartbeatCount;

void setup() {
  size(800, 800, P3D);
  smooth();
  background(0);
  noStroke();
  
  myHeartbeats = new Heartbeat[1000];
  myHeartbeats[0] = new Heartbeat(width/2, height/2);
  heartbeatCount = 1;
}

void draw() {
  background(25, 20);
  directionalLight(255, 255, 255, 0, 0, -1);
  directionalLight(100, 100, 100, 0, 0, -1);
  for( int i=0; i<heartbeatCount; i++){
    myHeartbeats[i].update();
    myHeartbeats[i].display();
   
  }
}

void mousePressed() {
 myHeartbeats[heartbeatCount] = new Heartbeat(mouseX, mouseY);
 heartbeatCount++;
}
  

class Heartbeat {
  int counter;
  float x;
  float y;
  color fillColor;
  float heartRate = 20;
  float beat;
  float speed;
  float radius = 85;
  float repeattime = 60;

  Heartbeat(float theX, float theY) {
    x = theX;
    y = theY;
  }

  void update() {
    counter++;
    beat-=1/repeattime;
    if (counter > repeattime) counter-=counter;
    if (counter == heartRate) beat = 1;
    if (counter == heartRate*2) beat = 1;
  }

  void display() {
    //float brightness = 255 / (float) heartbeatCount;
    
    pushMatrix();
    //background(25, 20);
    smooth();
    fill(beat*255, 51, 102);
    //lightSpecular(beat*255, 0, 0);
    //directionalLight(brightness, brightness, brightness, 0, 0, -1);
    translate(x, y, 0);
    specular(255, 255, 255);
    sphere((beat+0.5)/2*radius);
    popMatrix();
  }
}


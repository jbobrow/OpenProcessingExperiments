
float delta;
long lastTime;
long curTime;

float count;

void setup() {
  size(640, 480,P3D);
  lastTime = millis();
  count=0;
}

void draw() {
  background(0);
  curTime = millis();
  delta = (curTime - lastTime) / 1000;
  lastTime = curTime;
  noStroke();
  lights();
  
  count += 1*delta;
  
  translate(width/2,height/2,0);
  rotateY(count);
  
  for(int i = 0;i<360;i+=1) {
    rotateZ(i*0.0174532925);
    translate(i,0,0);
    box(1);
    translate(-i,0,0);
    rotateZ(-(i*0.0174532925));
  }
}

void keyPressed() {
  
}

void keyReleased() {
  
}


cloud[] clouds = new cloud[25];

void setup() {
  size(600, 600);
  frameRate(5);
  for (int i=0; i<25; i++) {
    float a = random(120, 480);
    float b = random(120, 480);
    clouds[i] = new cloud(a,b,i);
  }
}

void draw() {
  background(0);
  for(int i=0; i<25; i++) {
    clouds[i].display();
    clouds[i].raining();
  }
}

class cloud{
  float cloudX, cloudY;
  int id;
  
  cloud(float x, float y, int i) {
    cloudX = x;
    cloudY = y;
    i = id;
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse (cloudX, cloudY, 30, 20);
    ellipse (cloudX+10, cloudY, 30, 30);
    ellipse (cloudX+30, cloudY, 40, 40);
    ellipse (cloudX+30, cloudY+10, 40, 20);
    ellipse (cloudX+30, cloudY+10, 40, 20);
    ellipse (cloudX+30, cloudY-10, 40, 40);
    ellipse (cloudX+10, cloudY+10, 40, 20);
    ellipse (cloudX+30, cloudY-20, 40, 40);
    ellipse (cloudX+50, cloudY, 40, 40);
    ellipse (cloudX+30, cloudY+10, 40, 20);
  }
  
  void raining() {
      for(int r = 1; r<=100; r++){
        float a = random(cloudX, cloudX+60);
        float b = cloudY+20;
        strokeWeight(2);
        stroke(255,255,255,random(100));
        line(a, b, a, b+r);
       }
    }
}

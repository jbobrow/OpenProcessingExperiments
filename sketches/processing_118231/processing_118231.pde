
Bubble[] bubs;

void setup() {
  size(300, 900);
  colorMode(HSB);
  bubs = new Bubble[300];
  for(int i = 0; i < 100; i++){
    bubs[i] = new Bubble(width/2, 150, random(5, 15), color(0, random(100, 255), random(80, 200), random(200, 250)));
  }
  for(int i = 100; i < 200; i++){
    bubs[i] = new Bubble(width/2, 450, random(5, 15), color(40, random(100, 255), random(80, 200), random(200, 250)));
  }
  for(int i = 200; i < 300; i++){
    bubs[i] = new Bubble(width/2, 750, random(5, 15), color(100, random(100, 255), random(80, 200), random(200, 250)));
  }
}

void draw() {
  background(50);
  for(int i = 0; i < 300; i++) {
    bubs[i].display();
    bubs[i].update();
  }
}

class Bubble {
  float xCent;
  float yCent;
  float xPos;
  float yPos;
  float bubSize;
  float vel = 0;
  float acc = 0;
  color bubColor;
  
  Bubble(float x, float y, float size, color bColor){
   xCent = x;
   yCent = y;
   bubSize = size;
  bubColor = bColor; 
  }

  void display(){
    stroke(255, 150);
    //
    
    pushMatrix();
    translate(xCent, yCent);
    rotate(vel);
    line(0, 0, xPos, yPos);
    fill(bubColor);
    noStroke();
    ellipse(xPos, yPos, bubSize, bubSize);
    popMatrix();
  }
  
  void update() {
    xPos += random(-2, 2);
    yPos += random(-2, 2);
    if(dist(mouseX, mouseY, xCent, yCent) < 100) {
      acc += .01;
    } else if(acc > 0) {
      acc *= .9;
    }
    vel += acc;
  }

}



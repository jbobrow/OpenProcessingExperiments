
Clouds[] clouds;

void setup() {
  // Draw the background
  size(800, 600);
  colorMode(HSB, 360, height, 100);
  clouds = new Clouds[20];
  for (int i = 0; i < height; i++) {
    stroke(198, i, 99);
    line(0, height-i, width, height-i);
  }
  
  // Draw clouds
  colorMode(RGB, 255);
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Clouds(100, width/2.5, 100, 100, 10);
  }
}

void draw() {
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
}

class Clouds {
  float xpos;
  float ypos;
  float xdiameter;
  float ydiameter;
  float opacity;
  
  Clouds(float tempXpos, float tempYpos, float tempXdiameter, float tempYdiameter, float tempOpacity) {
    xpos = random(tempXpos, width);
    ypos = random(tempYpos, height);
    xdiameter = random(tempXdiameter, width/3);
    ydiameter = random(tempYdiameter, height/10);
    opacity = random(0, tempOpacity);
  }
  
  // Draw the cloud
  void display() {
    smooth();
    fill(random(225, 255), opacity);
    noStroke();
    ellipse(xpos, ypos, xdiameter, ydiameter); 
  }
}



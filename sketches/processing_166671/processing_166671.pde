
float[] xCoord = new float[1000];
float[] yCoord = new float[1000];

void setup() {
  size(600, 600);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
  }
}

void draw() {
  background(0);
  strokeWeight(10);
  ellipse(mouseX,mouseY,400,400);
 
  stroke(255);
  strokeWeight(3);
  fill(57,110,140);
  smooth();
  
  for (int i = 0; i < 100; i++) {
    xCoord[i] += random(-1,1);
    yCoord[i] -= 2;
    
    if (yCoord[i] < 0) yCoord[i] += height;
   
   if (dist(mouseX,mouseY,xCoord[i],yCoord[i]) < 200) {
    fill(20,20,100);
    ellipseMode(CENTER);
    ellipse(xCoord[i], yCoord[i], 10, 10);
    }
  }
}


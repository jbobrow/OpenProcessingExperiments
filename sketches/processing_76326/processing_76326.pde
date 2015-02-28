

float fillColor = random(255);
float xPoint = random(900);
float yPoint = random(500);
float xSize = random(450);
float ySize = random(250);

void setup() {
  size(900,500);
  background(0);
}

void draw() {
  for (int i = 0; i < 25; i = i + 1) {
    noStroke();
    fill(fillColor,0,0);
    
    float a = random(2); 
    float degree = random(180);
    
    pushMatrix();
    translate(xPoint, yPoint);
    rotate(degrees(degree));
    
    if (a > 1) {
      ellipse(0, 0, xSize, ySize);
    } else {
      rect(0, 0, xSize, ySize);
    }
    popMatrix();
    
    fillColor = random(255);
    xPoint = random(900);
    yPoint = random(500);
    xSize = random(600);
    ySize = random(350);

    
  }
  noLoop();
  
  fill(255, 255, 0);
  rect(xPoint, yPoint, 50, 50);
  
    
}




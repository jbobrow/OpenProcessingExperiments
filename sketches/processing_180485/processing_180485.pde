
int num = 20;
int frameCount;
int redCount = 0;
int blueCount = 0;

float theta = 0;
 
void setup() {
  size(400, 400);
  background(10);
}

void drawLemniscate(float a) {
  strokeWeight(2);
  noFill();
  
  for (int i = 0; i < num; i++) {
    float angle = 360 / num * i;
    float rad = radians(angle);
    float x = (a * cos(rad)) / (1 + sin(rad) * sin(rad));
    float y = (a * sin(rad) * cos(rad)) / (1 + sin(rad) * sin(rad));
    if (i == redCount % num) {
      stroke(#BF0B0A, 255);
    } else if (i == blueCount % num) {    
      stroke(#E5B643, 255);
    } else {
      stroke(#9EC3CE, 255);
    }

    ellipse(x, y, 5, 5);    
  }

}
 
void draw() {
  fill(10, 10, 10, 5);
  noStroke();
  rect(0, 0, width, height);
  translate(width / 2, height / 2);
  drawLemniscate(50 * (sin(theta) + 1.5));
  theta += 0.01;
  frameCount++;
  if (frameCount % 10 == 0) {
    redCount++;
  }
  
  if (frameCount % 7 == 0) {
    blueCount++;
  }
  
}


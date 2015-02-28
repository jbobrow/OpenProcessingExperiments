
void setup() {
size (500, 500);

colorMode(HSB, 255, 255, 255);
background(200);
smooth();
}
void draw() {
  
    
    float h = random(0, 255);
    float s = random(50, 100);
    float b = random(250, 255);
    fill(h, s, b);
    noStroke();
    float x = random(0, width);
    float y = random(0, height);
    float dotdiameter = random (height/20, height/10);
    ellipse(x, y, dotdiameter, dotdiameter);
    
    }


int elements = 700;
float x[] = new float[elements];
float y[] = new float[elements];
int frame = 0;
int drawpoints = 0;

void setup() {
  frameRate(10);
  size(800, 800);
  noStroke();
  for (int i = 0; i < elements; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void mouseDragged(){
  if (drawpoints < elements){
    
  x[drawpoints] = mouseX;
  y[drawpoints] = mouseY;
  
  drawpoints += 1;
  }
}

void drawBubble() {
  fill(random(1, 100), 153, 255, random(50, 100));
  ellipse(0, 0, 5, 5);
}

void drawFish() {
  pushMatrix();
  translate(random(-10, 10), random(-10, 10));
  scale(random(2, 7));
  //fish
  fill(255, random(1, 255), random(1, 255), random(150, 255));
  ellipse(5, 0, 10, 5);
  fill(255, random(1, 255), random(1, 255), random(150, 255));
  translate(-3, -3);
  scale(0.6);
  triangle(0, 0, 0, 10, 5, 5);
  popMatrix();
}

void draw() {
  
  frame++;
  
  background(5, 0, 153);
  
  pushMatrix();
  if (mousePressed) {
    translate(mouseX, mouseY);
    drawFish();
  }
  popMatrix();
  
  for (int i = 0; i < elements; i++) {
    x[i] += random(-1, 1);
    y[i] += random(-1, 1);
    
    pushMatrix();
    translate(x[i], y[i]);
    scale(random(1, 20));
    drawBubble();
    popMatrix();
  }
  
  for (int j = 1; j < drawpoints; j++) {
    if (! mousePressed){
      float phase = frame / j;
      x[j] = x[j] + sin(phase);
      y[j] = y[j] + cos(phase);
    }
    
    float size = ((frame + j) * 0.2) % 20;
    
    ellipse(x[j], y[j], size, size);
}
}

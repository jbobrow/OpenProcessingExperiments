
int num = 20000; 

float[] x = new float[num]; 
float[] y = new float[num]; 

PImage img;
int drawMode = 1;
boolean rotated = false;
int cx;
int cy;
int signum = 1;
 
void setup() {
  size(511, 693);
  img = loadImage("Duft068.jpg");
 
  cx = (int) (width / 2);
  cy = (int) (height / 2);
  
  for (int i = 0; i < num; i++) { 
    x[i] = random(width);
    y[i] = random(height);
  }
  
  noStroke();
}
 
void draw() {
  background(0);
  if (rotated) {
    rotate(0.5);
    translate(width / 4, -height / 4);
  }
  if(mousePressed == true) {
    cx = mouseX;
    cy = mouseY; 
  }
  if(keyPressed){
    if(key == '1'){
      signum = 1;
    }
    if(key == '2'){
      signum = -1;
    }
    if(key == '3'){
      drawMode = 1;
    }
    if(key == '4'){
      drawMode = 2;
    }
    if(key == '5'){
      rotated = true;
    }
    if(key == '6'){
      rotated = false;
    }
  }
  
  for (int i = 0; i < num; i++) {
    color c = img.get(int(x[i]), int(y[i]));
    float b = brightness(c) / 255.0; 
    float speed = pow(b, 2) + 0.2; 
    if (x[i] < cx) {
      x[i] += signum * speed;
    } else {
      x[i] -= signum * speed;
    }
    if (y[i] < cy) {
      y[i] += signum * speed;
    } else {
      y[i] -= signum * speed;
    }
 
    if ((x[i] >= cx && x[i] <= cx + 1) || x[i] < 0 || x[i] > width) {                      
      x[i] = random(width); 
      
    }
    if ((y[i] >= cy && y[i] <= cy + 1) || y[i] < 0 || y[i] > height) {                      
      y[i] = random(height);
    }
    fill(c);
    int s;
    switch(drawMode) {
      case 1:
        s = (int) (8 * b);
        rect(x[i], y[i],s,s);
        break;
      case 2:
        s = (int) (12 * b);
        ellipse(x[i], y[i],s,s);
        break;
    }
  }
}


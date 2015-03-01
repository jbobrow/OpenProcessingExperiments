
int n = 70;
float ballSize = 8;
float[] x = new float[n];
float[] y = new float[n];
float[] sx = new float[n];
float[] sy = new float[n];
float a = 0;
float cx = 80;
float cy = 60;


void setup() {
  size(600, 600);
  smooth();
  for (int i=0; i<n; i++) {
    x[i] = random(10, width-10);
    y[i] = random(10, height-10);
    sx[i] = random(-1, 1);
    sy[i] = random(-1, 1);
  }
}
void draw() {
  noStroke();
  fill(0,40);
  rect(0,0,width,height);
   

  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (i != j) {
        float d = dist(x[i], y[i], x[j], y[j]);
        if (d < 10)
        {
          sx[i] += constrain(0.5 / (x[i]-x[j]), -0.05, 0.05);
          sy[i] += constrain(0.5 / (y[i]-y[j]), -0.05, 0.05);
        }
      }
    }
  }
  for (int i=0; i<n; i++) {
    strokeWeight(5);
    stroke(100,100,100,20);  
    fill(random(225),random(225),random(225),50);
    ellipse(x[i], y[i], ballSize, ballSize);
     }
 if (mousePressed == true){
  for (int i=0; i<n; i++) {
    for (int k=0;k<n; k++) {
      if (i != k) {
        float d = dist(x[i], y[i], mouseX, mouseY);
        if (d < 1)
        {
          sx[i] = constrain(0.5 /( x[i]-mouseX) , -0.5, 0.05);
          sy[i] = constrain(0.5 /( y[i]-mouseY) , -0.5, 0.05);
        }
      }
    }
  }
 }
 else{
  for (int i=0; i<n; i++) {
    for (int k=0;k<n; k++) {
      if (i != k) {
        float d = dist(x[i], y[i], mouseX, mouseY);
        if (d < 10)
        {
          sx[i] += constrain(0.5 /( x[i]-mouseX) , -0.05, 0.05);
          sy[i] += constrain(0.5 /( y[i]-mouseY) , -0.05, 0.05);
        }
      }
    }
  }
 
 }
 
  
move();
}


void move()
{
 for (int i=0; i<n; i++) {
    x[i] += sx[i];
    y[i] += sy[i];

    if (x[i] < 0) { x[i] = 0; sx[i] = -sx[i]; }
    if (x[i] > width) { x[i] = width; sx[i] = -sx[i]; }
    if (y[i] < 0) { y[i] = 0; sy[i] = -sy[i]; }
    if (y[i] > height) { y[i] = height; sy[i] = -sy[i];}
  }
  
}





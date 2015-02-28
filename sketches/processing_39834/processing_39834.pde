

int num = 20; 


float[] x = new float[num]; 
float[] y = new float[num]; 
float[] speed = new float[num]; 

void setup() {
  size(300, 300);
  colorMode(HSB, 100);
  smooth();

  
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = i * (height/num);
    speed[i] = random(0, 4);
  }
}

void draw() {
  background(0);
  
  for (int i=0; i < num; i++) {
    
    ellipseMode(CENTER);
    stroke(0);
    fill(255, 255, 224);
    ellipse(x[i], y[i], 20, 20); 
    fill(0);
    ellipse(x[i], y[i], 10, 10);
    fill(255, 255, 224);
    ellipse(x[i]-40, y[i], 20, 20);
    fill(0);
    ellipse(x[i]-40, y[i], 10, 10);

    x[i] = x[i] + speed[i];
    if (x[i] > width + 10) {
      x[i] = -10;
    }
    
  }
  
}







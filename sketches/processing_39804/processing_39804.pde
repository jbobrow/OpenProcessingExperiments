

int num = 50; 
float[] w = new float[num];
float[] x = new float[num];
float[] y = new float[num]; 
float[] z = new float[num];

void setup() {
  size(300,300);
  smooth();
  noStroke();
  fill(100,random(200),random(100), 50);

  for(int i = 0; i < y.length; i++) {
    y[i] = random(height);
  }
}


void draw() {
  background(0);
  
  for (int i=0; i<w.length;i++) {
    stroke(100);
    line((width/w.length)*i, w[i], 150, 150);
  }
    
  for (int i=0; i<x.length;i++) {
    stroke(100);
    line((width/x.length)*i, x[i], 300, 300);
  }
  
  for (int i=0; i<z.length;i++) {
    stroke(100);
    line((width/z.length)*i, z[i], 0, 300);
  }
  
  for(int i=0; i<y.length;i++) {
    noStroke();
    ellipse((width/y.length) * i,y[i],100,100); 
    y[i] = y[i]+1; 
    if(y[i] > height) y[i] = 0; 
  }
}



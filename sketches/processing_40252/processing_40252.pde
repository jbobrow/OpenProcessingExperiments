

int num = 10000;
float[] x = new float[num];  
float[] y = new float[num];
PImage img;

void setup(){
  size(300,300);
  img = loadImage("helmut copy.jpg");
  
  
  for (int i = 0; i < num; i++){  
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw(){
  background(255);
  fill(0);
  rect(100, 0, 100, 300);
  stroke(0);
  for (int i = 0; i < num; i++){
    color c = img.get(int(x[i]), int(y[i]));  
    float b = brightness(c) / 255.0;          
    float speed = pow(b,2) + 0.05;            
    x[i] += speed;                            
    
    if (x[i] > width) {                       
      x[i] = 0;                              
      y[i] = random(height);                  
    }
    
    point(x[i], y[i]);                        
  }
  
  stroke(255);
  for (int i=0; i < num; i++){
    color c = img.get(int(x[i]), int(y[i]));
    float b= brightness(c) / 255.0;
    float speed = pow(b,2) + 0.05;
    x[i] += speed;
    
    if (x[i] > width) {
      x[i] = 100;
      y[i] = random(height);
    }
    point(x[i], y[i]);
  }
}


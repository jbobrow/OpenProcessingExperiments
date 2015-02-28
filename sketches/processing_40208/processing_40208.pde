
int num = 200000;  
float[] x = new float[num];  
float[] y = new float[num];  
PImage name;

void setup(){
size(530,800);  
name=loadImage("Downtown.jpg");

  for (int i = 0; i < num; i++){  
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(255); 
  
}

void draw(){
  background(0);
  for (int i = 0; i < num; i++){
    color c = name.get(int(x[i]), int(y[i]));  
    float b = brightness(c) / 255.0;          
    float speed = pow(b,2) + 0.025;            
    x[i] += speed;                           
    
    if (x[i] > width) {                       
      x[i] = 0;                               
      y[i] = random(height);                  
    }
    
    point(x[i], y[i]);                        
  }
}




float t = 0.0;  

void setup()  {   
  size(200,200);  
  smooth();  
}   

void draw()  {   
  background(255);  
  t += 0.01;  
  float x = t;  
  
  noStroke();  
  fill(0);  
  
  for (int i = 0; i <= 20; i++)  {   
    float y =  noise(x)*height;  
    ellipse(i*10, y, 16, 16);  
    x += 0.05;  
  }   
}


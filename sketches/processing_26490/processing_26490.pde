
//Yes, the circle appears to be moving "naturally"

float xtime = 0.0;  
float ytime = 100.0;
float increment = 0.01;  

void setup()  {   
  size(200, 200);  
  smooth();  
}   

void draw() {   
  background(255);  
  float x = noise(xtime)*width;  
  float y = noise(ytime)*height;  
  xtime += increment;  
  ytime += increment;  

  stroke(0);
  fill(175);  
  ellipse(x, y, 16, 16);  
}


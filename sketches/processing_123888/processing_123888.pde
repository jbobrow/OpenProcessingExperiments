
float x = 0;

void setup() { 
  size(400, 400); 
  background(255);
}

void draw() {
  line(x, 200, x, 100);
  x = x +1; 
  
  if (x > width) {
    x = 0;
  }
  
  if (random(100) > 70) {
    if(random(100) > 50) {
      stroke(0); 
    }
    else {
      stroke(255); 
    }
    
  }
}


  



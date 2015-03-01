
int diam=10; 

void setup() {
  size(800, 800);
}

void draw() {
  
  for(int x=width/100; x<=width; x+=width/100) {
   
      noStroke();
      fill(random(0,100));
      ellipse(x, random(height), diam, diam);
      
    
    
    
  }
  
}




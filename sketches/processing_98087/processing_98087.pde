
float theta = 0;

void setup() {
  size(1000,1000);
  smooth();
}

void draw() {
  background(255, 0, 150);
  stroke(20, 50, 180);
  
  translate(width/2,height/2);
  
  for(float i = 0; i < TWO_PI; i += 0.08) {
    
    pushMatrix(); 
    rotate(theta + i);
    line(100,200,1000,800);
    
    for(float j = 1; j < TWO_PI; j += 1) {
      pushMatrix();
      translate(300,200);
      rotate(-theta-j);
      line(100,70,500,100);
      popMatrix();
    }
    
    popMatrix();
  }
  
  theta += 0.1;
}



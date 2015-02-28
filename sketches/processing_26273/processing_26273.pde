
void setup() {
  size(700,700);
}

void draw() {
  background(99,0,18);
  
  for(int i=0; i<750; i=i+15){
    for(int j=0; j<700; j=j+20) {
    
      
    
      
      stroke(255);
      fill(121,235,225,10);
      ellipse(i-10,j,10,5);
      ellipse(i-10,j,10,5);
      ellipse(random(i),random(j),50,50);      
  }
  }
}
                
                

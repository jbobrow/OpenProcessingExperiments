


void setup() {
 size(300,300);
 smooth();

 
 
  
}

void draw() {
  background(0);
    
  rect(0,0,100,50);
  
  pushMatrix();
  translate(50,0);
  
  rect(0,50,100, 50);
  
  pushMatrix();
  translate(50,0);
  rect(0, 100, 100, 50);
  popMatrix();
  
  rect(0, 150, 100,50);
  
  popMatrix();
  rect(0, 200, 100, 50);
  
  
}



// recap of past excersices 

void setup() {
 size(600, 200);
 smooth();  
}

void draw() {
  background(128); 
  float spacing = width/10;
  for(int i=0; i < 10; i++) { // keep looping as longs as it is less then given number
  if (i % 2 == 0) { 
    fill(0); 
  }
  else{
    fill(255); 
  }
    ellipse(i*spacing,height/2,(i*1)*mouseX-100,(i*1)*mouseY-100);     
  }
}


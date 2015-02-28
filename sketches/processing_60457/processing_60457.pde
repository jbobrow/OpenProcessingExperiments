


void setup() {
  size (500,500);
  smooth();
}

void draw() {
  background(0);
  stroke(0);
   rect(0,0,50,50);
  
  
  translate(50,0);
  rotate(PI * 0.25);
  rect(0,0,50,50);
  
 
  translate(50,0);
  rotate(PI* 0.33);
  rect(0,0,50,50);
  
  translate(50,0);
  rotate(PI*-0.5);
  scale(2);
  strokeWeight(1.0);
  rect(0,0,50,50);
  
  translate(50,50);
  rotate(PI*-0.4);
  rect(0,0,50,50);   
 
  translate(50,50);
  rotate(PI*0.4);
  rect(0,0,50,50);  
  
 
  translate(50,0);
  rotate(PI*0.25);
  strokeWeight(1.0);
  scale(0.5);
  rect(0,0,50,50);
 
  translate(50,0);
  rotate(PI*-0.25);
  strokeWeight(1.0);
  scale(0.5);
  rect(0,0,50,50);
 
  translate(50,0);
  rotate(PI*-0.25);
  strokeWeight(1.0);
  scale(0.5);
  rect(0,0,50,50); 
   
  translate(50,0);
  rotate(PI*-0.25);
  strokeWeight(1.0);
  scale(0.5);
  rect(0,0,50,50); 
  
  translate(50,0);
  rotate(PI*-0.5);
  strokeWeight(1.0);
  scale(0.5);
  rect(0,0,50,50); 
  
  rotate(radians (30));
  translate(80,0);
  rect(0,0,100,100); 
  

  
}




void setup() { 
  size(700, 300); 
  smooth(); 
  background(255); 
  noFill(); 
  stroke(0,150); 
}  
  
void draw() { 
  for(int i=0; i<200; i=i+1) { 
      Diagonal(); 
  } 
}  
 
void Diagonal() { 
  strokeWeight(random(10)); 
  float d1 = random(100); 
  
  
  if(d1 < 20) {  //verde 
    stroke(75,210,8);  
    rotate(5);
  } 
  if(d1 < 15) { // morado
    stroke(159,27,139); 
   rotate(5); 
  } 
  if(d1 < 10) {  //naranjo 
    stroke(253,193,48); 
     rotate(5);
  } 
  if(d1 < 5) {  // blanco 
    stroke(255); 
    rotate(5);
  } 
  float x1 = random(height); 
  float x2 = random(height); 
  line(x1,x2,second()/10,millis()/10); 
  stroke(0,40); 
} 





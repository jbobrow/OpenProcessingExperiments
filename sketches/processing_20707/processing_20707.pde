
//Matthew Iannacci
//Problem Set 1
//Question 4


boolean on = false;

void setup() {
  size(500,500);
  smooth();
  strokeWeight(50);
}

void draw() {
  background(200);
  stroke(0);
  if (on == true) {
  }
  if (mousePressed) {
    stroke(0);
 }  else {
    stroke(255);
 }
      
   fill(0,255,255);
   rect(0,0,500,100);
   
   translate(0,100);
   rect(0,0,500,100);
  
   fill(16,255,255);
   translate(0,100);
   rect(0,0,500,100);
   
   translate(0,100);
   rect(0,0,500,100);
   
   translate(0,100);
   rect(0,0,500,100);
   
   
}



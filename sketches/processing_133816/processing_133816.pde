
// Draw code here
 
void setup() {
  size(600,600);
  smooth();
}
 
void draw() {
   
  float strok1 = mouseX;
  float strok2 = mouseY;
  float strok3 = 0.7*mouseX;
  float strok4 = 0.7*mouseY;
  float strok5 = 0.95*mouseX;
  float strok6 = 0.95*mouseY;
 
  background(255);
 noStroke();

 //horizontal
  fill(236, 127, 140, 190);
  rect(0, 0, strok1, 100);
  
  fill(249, 211, 105, 190);
  rect(0, 100, strok3, 100);
  
  fill(153, 202, 172, 190);
  rect(0, 200, strok5, 100);
  
  fill(251, 197, 161, 190);
  rect(0, 300, strok1, 100);
  
  fill(144, 168, 176, 190);
  rect(0, 400, strok3, 100);
  
  fill(164, 154, 158, 190);
  rect(0, 500, strok5, 100);
  
  //vertical

  fill(236, 127, 140, 190);
  rect(500, 0, 100, strok6);
  
  fill(249, 211, 105, 190);
  rect(400, 0, 100, strok4);
  
  fill(153, 202, 172, 190);
  rect(300, 0, 100, strok2);
  
  fill(251, 197, 161, 190);
  rect(200, 0, 100, strok6);
  
  fill(144, 168, 176, 190);
  rect(100, 0, 100, strok4);
  
  fill(164, 154, 158, 190);
  rect(0, 0, 100, strok2);
}




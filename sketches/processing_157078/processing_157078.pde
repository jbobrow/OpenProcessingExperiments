
float mx, my;
float r1; 
float inc; 
color c1 = #16C5CC; 

void setup() {
  size(350, 350); 
  background(0); 
  smooth();  
  noFill(); 

  mx = width/2; 
  my = height/2; 

  r1 = 100; 
  inc = 0;
}  

void draw() {
  background(0); 

  float x, y, angle, rStep, aStep; 
  float strWeight = 10;
  float alpha = 50;    
  
  rStep = sin(radians(frameCount));     

  translate(mx, my); 
 
  aStep = 0; 
  for (int i = 0; i < 10; i++) { 
    strokeWeight(strWeight); 
    stroke(c1, alpha); 
    
    beginShape(); 
    for (angle = aStep; angle < 360+aStep; angle += 30) {    
      x = cos(radians(angle) + inc) * (r1 + 50 - 25*rStep); 
      y = sin(radians(angle) + inc) * (r1 + 50 - 25*rStep);
      vertex(x, y);  
      vertex(0, 0);    
      x = cos(radians(angle + 15) - inc) * (r1 + 25*rStep); 
      y = sin(radians(angle + 15) - inc) * (r1 + 25*rStep);
      vertex(x, y);
    }    
    endShape(CLOSE);
    
    aStep += 5;     
    scale(0.9); 
    strWeight *= 0.9; 
    alpha *= 1.1; 
  } 

  inc += 0.01;
}





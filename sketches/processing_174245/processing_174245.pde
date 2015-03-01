
float r, R; 

void setup() { 
  r= 0;
  size(500, 500, P3D);  
  
  background(#B7B5B5);
  smooth(); 
  stroke(0); 
} 

void draw() {  
  noCursor();
  
  R= noise(r)*4;  
  translate(mouseX, mouseY);
  rotateX(random(1, 10));  
  fill(#B7B5B6);   
  rect(0, 0, 200, 280); 
}


void keyPressed() { 
  setup();
}







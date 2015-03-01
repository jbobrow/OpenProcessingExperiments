
void setup() {
  size(300, 300);
  smooth();
  
}
 
void draw() {
  background(#3D04DB);
 
  pushMatrix();
  translate(width/2, height);
  branch(map(mouseY,0,width,30,200));
  popMatrix();
}
 
void branch(float len) {  
  line(0, 2, 0, -len);
  translate(0, -len);
 
  len *= 0.7;
  float theta = map(mouseX, 0, width, 0, PI);
   
  if (len > 10) {
    pushMatrix();
    rotate(theta);
    branch(len);      
    popMatrix();     
    
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
     
  }
}
 


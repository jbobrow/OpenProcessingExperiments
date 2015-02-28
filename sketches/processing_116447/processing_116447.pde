
void setup() {
  
  size(300, 300); 
  noStroke();
  noFill();
  background(0); //only draw bg once
}
void draw() {
  rect(mouseX, mouseY, 5, 5); //draw rect. where the mouse is. 
  
  if (mousePressed) 
    fill(random(0, 255), random(0,10), random(0, 0));
    //(red values,     green values,  blue values)
 else {
 noFill();  
 
 //alternative- fill with random shades of these colors if the mouse is up
  
   //fill(random(0, 10), random(0,255), random(0,10)); 
  
   
}
}

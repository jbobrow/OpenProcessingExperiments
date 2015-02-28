
int rectWidth = 50;  
int rectHeight = 50;  
void setup() {  
  size(400,600);  
  
  
  
}  
  
void draw() {  
  background(0);  
  fill(83, 60, 175);  
  for (int y= 5; y<height; y += 60){  
    for (int x= 5; x<width; x += 40){  
  
  
      rect(x, y,rectWidth, rectHeight);  
  
      if (mouseX >= x && mouseX <= x+rectWidth &&   
        mouseY >= y && mouseY <= y+rectHeight) {  
        fill(83, 60, 175);  
        rect(x, y,rectWidth, rectHeight);  
      }  
      fill(201, 145, 85);  
    }  
  }  
  
}  
  
  
 
 



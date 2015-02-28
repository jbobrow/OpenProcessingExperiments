
int rectWidth = 40; 
int rectHeight = 45; 
void setup() { 
  size(400,400); 
 
 
 
} 
 
void draw() { 
  background(0); 
  fill(220); 
  for (int y= 7; y<height; y += 30){ 
    for (int x= 7; x<width; x += 30){ 
 
 
      rect(x, y,rectWidth, rectHeight); 
 
      if (mouseX >= x && mouseX <= x+rectWidth &&  
        mouseY >= y && mouseY <= y+rectHeight) { 
        fill(213); 
        rect(x, y,rectWidth, rectHeight); 
      } 
      fill(173,146,183); 
    } 
  } 
 
} 
 
 




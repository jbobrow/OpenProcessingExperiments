
/*int x1 = 200;  
int y1 = 250;  
int y2 = 250;  
int x2 = 200;*/ 
   

void setup(){  

  size(700,400);  
  background(0);

}  


void draw(){  
  loop();
  if (mousePressed && (mouseButton == LEFT)) {  
  stroke(255); 
  line(mouseX,mouseY,200,400);  
  mouseY = mouseY + 5;  
  mouseX = mouseX - 5;
  }  

} 

void mouseReleased(){
  background(0);
}



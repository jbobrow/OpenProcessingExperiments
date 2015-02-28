
int a = 50;
int b = 50;

void setup(){
  size (700,400);
  
  
  
}

void draw(){
  background (255);
  
 fill(255,0,0);
 ellipse (mouseX + a, mouseY + b, 20,20);
 ellipse (mouseX - a, mouseY - b, 20,20); 
 ellipse (mouseX + a, mouseY - b, 20,20);
 ellipse (mouseX - a, mouseY + b, 20,20);


}

void mousePressed(){
  a = a + 1;
  b = b + 1;
  
}


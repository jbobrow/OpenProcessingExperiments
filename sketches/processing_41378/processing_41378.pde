
float x = 250;
float y = 250;
int a = 0;
void setup(){
  size(500,500);
}

void draw () {
 background(0);
 
 ellipse(mouseX,mouseY ,x,y); 
 fill(255,255,255,a); 
smooth();
 x = x + 100; 
  if (x > 250){
  x = 15;
 
}
}
 void mouseClicked() {
    fill(255,255,255,a);
    a = a + 10;
    
 }
    


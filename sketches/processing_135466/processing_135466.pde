
int papita = 10;

void setup() {
  size (200,800);
  background(0);
 
}
void draw(){
  
  line( mouseX,mouseY,mouseY,mouseX);
  stroke(255,255,255);
  strokeWeight(0.1); 
  line( mouseX,mouseY,100,100);
  stroke(1+papita,255,0,20);
  strokeWeight(1);
 
}

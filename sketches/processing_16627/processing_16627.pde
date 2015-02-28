
float x, y;
void setup(){
  size(800,600);
  smooth();
  background(0);
  
  x=0.1;
  y=0.1;
  }

void draw(){
  desenho(850,500);
}  

void desenho(float x, float y){
 background(0);
  translate(400,300);
  rotate(x+y*millis()/20);
  
  fill(90,255,205);
  ellipse(mouseX/2,mouseY/2,100,100);
 }  

void mouseMoved(){
  x=x+5;
  y=y+0.2;
  }


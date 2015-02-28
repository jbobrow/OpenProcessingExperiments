
void setup() {
 size(1080,1920);
 background(0,0,0);
 smooth();
 mouseX=width/2
 mouseY=height/2
} 
 
void draw() {
 
  
 translate(mouseX,mouseY);
 fill(0,0,0,0);
 stroke(255);
 quad(mouseX,mouseY,30,40,50,70,60,30);
  
 
}

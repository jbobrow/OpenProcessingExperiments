
float angle=0; 
void setup() {
size(800,400);
background(5);
smooth(); 
}
void draw() 
{
  fill(255,90,0);
translate(mouseX/1,mouseY/1);
ellipse(0,0,random(width/9), random(height/20));
}
                


void setup(){
  size(600,600);
  background(659);
}
 void draw(){
   for(int i=0;i<20;i++){
   }
   ellipse(mouseX,mouseY,mouseX+random(10),mouseY+random(10));
   stroke(0);
   fill(random(255),random(255),random(255),random(255));
   
   if(mousePressed == true) {
    ellipseMode(CORNER);
   ellipse(mouseX,mouseY,100,100); 
 }
 }


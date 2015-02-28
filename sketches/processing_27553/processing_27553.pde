
void setup(){
  size(500,500);
  fill(50,50,0);}
  
void draw () {
   fill(135,23,0,random(0,135));
   triangle(mouseX,mouseY,random(0,500),
 random(0,500),random(0,500),random(0,500));
  stroke(60,60,0);}
   
 void mousePressed(){
   stroke(random(50,100),random(135,150),50);}
 void keyPressed(){
   stroke(0);}

                
                

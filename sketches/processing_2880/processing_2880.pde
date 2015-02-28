
float margen, sp;

void setup (){
  background(14,44,100);
  size(600, 600);
  smooth();
  sp = 20;
}
 void draw(){
  
   smooth();
   for(float y =4; y <= height-40; y += sp){ 
    for(float x =40; x <= width-4; x += sp){ 
      float d;
      d=5-sqrt((mouseX - x)*(mouseX - x)+ + (mouseY - y)*(mouseY - y)); 
       
       noStroke();
       fill(x,y, 200, 350);
      ellipse(mouseY,y, sp/d, sp/d);
      ellipse(x,mouseY, sp/d, sp/d);
     
    rotate(200);
      
   
 
    }
   }
 }
 
 
 
 
 
 
void keyPressed(){ 
  saveFrame("pamelacarranza.jpg"); 
  println("fotograma grabado"); 
} 



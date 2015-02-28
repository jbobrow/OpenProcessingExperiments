
float margen, sp;
 
 
void setup(){
  margen = 1;
  sp =20;
  size(500, 500);
  smooth();
  stroke(250,50);
  strokeWeight(1);
}
 
 
void draw(){
 
 
  background(50);
       

 
  rotate(100);

    for(float x = margen; x < width; x += sp/2){
      for(float y = margen; x < width; x += sp/12){
      float d;
      d = 100+sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
       fill(255,5);
     ellipse(x,y,d*0.2, d/16);  //
 
      fill(#C6C6C6,mouseY); 
      stroke(#9D9D9D,mouseX); 
      ellipse (mouseX, mouseY, d/10, d*100);
       
       noStroke();
      fill(x,y, 250, 100);
ellipse(mouseX, y, d, 60/d);  
ellipse(x,mouseY, 60/d, 60/d);  
 
rotate(100);
 
       d = 100+sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
    fill(250,150);
 
     ellipse(x,y,d/2, d/2);  
   d = dist(mouseX, mouseY, x, y);
      }

  
  stroke(52,200); 
      fill(155, 163, 165);
      
      
       
    }    
    }   
       


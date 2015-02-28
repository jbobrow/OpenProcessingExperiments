
float x = 350;
float y = 200;

void setup(){
  size(700, 400);
  
  
}

void draw(){
  background(0);
  
  fill(255);
 
  ellipse(x, y, 250, 250);
 
}

void mouseDragged(){
 if(dist(mouseX, mouseY, x, y) < 125){
   
   x = x + random(-2, 2);
   y = y + random(-2, 2);
   
   if(x < 348){x = 350;}
   if(x > 352){x = 350;} 
   if(y < 198){y = 200;}
   if(y > 202){y = 200;}
 }
}
 



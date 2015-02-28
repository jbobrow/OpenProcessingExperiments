
void setup(){
  size(450, 450);
  smooth();
  noStroke();
}
 
 void draw(){
  background(0);
 
   for(int x = 0; x <= height; x= x + 50){
   for(int y= 0; y <= width; y = y + 50){

   fill(255,80);
   ellipse(y, x, 100, 100);
   fill(0);
   ellipse(y, x, 50, 50);
   fill(255,80);
   ellipse(y, x, 30, 30);

      
     }
   }
   if(mousePressed){ fill(0, 200);
   rect(0, 0, width, mouseY);
   }
  }                              

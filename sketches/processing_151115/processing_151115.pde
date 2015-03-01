
void setup(){
   size(700,300);
}
void draw(){
   background(255);
   fill(0,0,100);
   if(mouseX<70){
     fill(0,0,255);
   }
   if(mouseX>width-70){
     fill(255,0,0);
   }
   if(mouseY<50){
     fill(0,75,0);
   }
   if(mouseY>height-50){
     fill(0,0,150); 
   }     
   rect(mouseX,mouseY,25,25);
   }       

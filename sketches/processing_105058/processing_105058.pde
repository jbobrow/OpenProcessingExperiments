
void setup(){
  size(600,600);
}
  
 void draw(){
   rect(height/4,width/4,300,300);
   if (mouseX>200 && mouseY<400){
     if (mouseY>200 && mouseX<400){
       fill(255,0,0);} else {fill(255,255,255);
     }
 
   }
 }

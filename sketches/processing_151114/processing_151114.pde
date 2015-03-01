
void setup(){
     size(700,300);
}
void draw() {
     background(0);
     fill(0,0,255);
     if (mouseX<50){
     fill(255,0,0);
     }
     if(mouseX>height-50) {
      fill(255,0,0);
     } 
     rect(mouseX,mouseY,50,50);
     }
   
     
    
     

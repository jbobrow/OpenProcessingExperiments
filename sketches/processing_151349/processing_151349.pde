
void setup(){
     size(700,300);
     }
     
void draw(){
     background(0);
     fill(0,0,255);
     if(mouseX<70) {
       fill(255,0,0);
       }
     if(mouseX>width-70) {
     fill(255,0,0);
     }
     ellipse(mouseX,mouseY,30,30);
     }
        
        

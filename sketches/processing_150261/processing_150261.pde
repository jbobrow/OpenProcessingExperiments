
void setup(){
    size(600,400);
    
}
void draw(){
    background(50);
    fill(255);
    noStroke();
    if(mouseX<50){
        fill(255,0,0);
    }
    if(mouseX>width-70){
        fill(255,0,0);
     }
  
 
   rect(mouseX,mouseY,20,20);
}

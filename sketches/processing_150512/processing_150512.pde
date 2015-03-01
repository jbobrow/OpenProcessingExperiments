
void setup(){
    size(700,300);
}    
void draw(){
    background(0);
    fill(0,0,255);
    if(mouseX<50){
        fill(255,0,0);
    }
    if(mouseX>width-50){
        fill(0,0,255)
    }
    ellipse(mouseX,mouseY,20,20);
}

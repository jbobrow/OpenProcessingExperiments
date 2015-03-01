
void setup(){
    size(700,300);
}

void draw(){
    background(255);
    fill(0,0,255);
    if(mouseX<49) {
        fill(255,0,0);
    }
    if(mouseX>width-50) {
        fill(255,0,0);
    }
    if(mouseY>height-50){
        fill(255,0,0);
    }
    if(mouseY<49) {
        fill(255,0,0);
    }
    if(mouseX>width-50) {
        rect(mouseX,mouseY,30,30);
    }
    rect(mouseX,mouseY,30,30);
}
        
    

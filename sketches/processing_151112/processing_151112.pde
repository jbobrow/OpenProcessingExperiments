
void setup(){
    size(700,300);
}

void draw(){
    background(255);
    fill(0,0,255);
    if(mouseX<50){
        fill(255,0,0);
    }
    if(mouseX>650){
        fill(255,0,0);
    }
    if(mouseY<50){
        fill(255,0,0);
    }
    if(mouseY>250){
        fill(255,0,0);
    }
    if(mouseX>650){
        rect(650,mouseY,30,30);
    }
    if(mouseX<650){
        rect(mouseX,mouseY,30,30);
    }
}

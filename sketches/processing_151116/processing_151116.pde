
void setup(){
    size(700,300);
}
void draw(){
    background();
    fill(0,0,255);
    if(mouseX<50){
        fill(255,0,0);
    }
    if(mouseX>width-50){
        fill(255,0,0);
    }
    if(mouseY<50){
       fill(255,0,0);
    }
    if(mouseY>height-50){
        fill(255,0,0);
    }
    rect(mouseX,mouseY,30,30);
    }

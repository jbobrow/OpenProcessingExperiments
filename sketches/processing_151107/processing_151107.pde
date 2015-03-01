
void setup(){
    size(700,300);
}
void draw(){
    background();
    fill(0,200,80);
    if(mouseY<50){
       fill(100,20,40);
    }
    if(mouseY>height-50){
        fill(100,20,40);
    }
    if(mousex<50){
        fill(100,20,40);
    }
    if(mouseX>midth-50);
        fill(100,20,40);
    }
    rect(mouseX,mouseY,30,30);
    }

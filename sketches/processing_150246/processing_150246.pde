
void setup(){
    size(600,400);
}
void draw(){
    background(50);
    noStroke();
    fill(255);
    if(mouseX<50){
        fill(255,0,0);
    }
    if(mouseX>550){
        fill(255,0,0);
    }
    if(mouseY<50){
        fill(255,0,0);
    }
    if(mouseY>350){
        fill(255,0,0);
    }
    rect(mouseX,mouseY,20,20);
}

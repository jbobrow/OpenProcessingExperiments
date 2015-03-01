
void setup(){
    size(600,400);}

void draw(){
    background(50);
    noStroke();
    fill(255);
    if(mouseX<60){
        fill(255,0,0);
    }
    if(mouseX>540){
        fill(255,0,0);
    }
    if(mouseY<60){
        fill(255,0,0);
    }
    if(mouseY>340){
        fill(255,0,0);
    }
    rect(mouseX,mouseY,20,20);
    }

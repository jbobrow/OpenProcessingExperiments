
void setup(){
    size(300,300);
}

void draw(){
    stroke(255);
    background(0);
    line(150,0,150,300);
    line(0,150,300,150);
    
    if(mouseX < 150 && mouseY < 150){
        fill(255,0,0);
    }
    else if(mouseX > 150 && mouseY < 150){
        fill(0,255,0);
    }
    else if(mouseX < 150 && mouseY > 150){
        fill(255);
    }
    else{
        fill(0,0,255);
    }
    ellipse(mouseX, mouseY, 30, 30);
}

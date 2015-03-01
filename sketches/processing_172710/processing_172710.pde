
void setup(){
    size(500,500);
    background(255);
    rect(100,100,300,300);
}

void draw(){
    background(255);
    if(mouseX >100 && mouseX < 400){
    fill(mouseX/2,mouseX/2,mouseY/2);
    ellipse(mouseX,mouseY,50,50);
    line(mouseX,mouseY,250,250);
    }
    if(mousePressed == true){
        background(255);
    }
    
}


void setup(){
    
    size(500,500);
    //background(0);
    smooth();
}

void draw(){
    
    fill(0,27);
    rect(0,0,width,height);
    noStroke();
    fill(255);
    ellipse(mouseX,mouseY,width/10,height/10);
    
}

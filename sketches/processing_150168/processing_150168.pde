
void setup(){
    size(600,600);
}
void draw(){
    background(255);
    fill(255,0,0);
    line(100,0,100,height-1);
    line(200,0,200,height-1);
    ellipse(mouseX,mouseY,50,50);
    noFill();
    rect(500,50,50,50);
    
}


void setup(){
    size(700,300);
}
void draw(){
    background(0);
    fill(0,200,80);
    if(mouseX<90){
        fill(200,30,20);
    }
    if(mouseX>width-90){
        fill(200,30,20); 
    }
    rect(mouseX,mouseY,30,30);
}

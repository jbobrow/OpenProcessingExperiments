
void setup(){
    size(700,300);
}
void draw(){
    background(0);
    fill(0,0,200);
    if(mouseX<100){
        fill(255,0,0);
        }
    if(mouseX>600){
        fill(255,0,0);
        }
    rect(mouseX,mouseY,30,30);
}

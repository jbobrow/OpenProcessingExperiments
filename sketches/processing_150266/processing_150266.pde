
void setup(){
    size(600,400);
    background(50);
}
void draw(){
    background(50);
    noStroke();
    fill(255);
if(mouseX<100){
    fill(255,0,0);
}
if(mouseX>500){
    fill(255,0,0);
}
if(mouseY<100){
    fill(255,0,0);
}
if(mouseY>300){
    fill(255,0,0);
}
    rect(mouseX,mouseY,20,20);

}

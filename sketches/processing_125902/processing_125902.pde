
void setup(){
    size(400,400);
    background(220,220,0);
}

void draw(){
    fill(0,0,255);
    if(mouseX>100&&mouseX<200&&mouseY>100&&mouseY<200)
    ellipse(mouseX,mouseY,3,3);
}

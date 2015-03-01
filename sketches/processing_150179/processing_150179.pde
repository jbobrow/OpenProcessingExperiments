
void setup(){
    size(600,600);
}
void draw(){
    background(255);
    fill(255,0,0);
    line(100,0,100,height-1);
    line(200,0,200,height-1);
    line(300,0,300,height-1);
    noStroke();
    ellipse(mouseX,mouseY,50,50);
    fill(0,255,0);
    if(mouseX<200&&mouseX>100){
       fill(0,0,255);
    }
    if(mouseX<300&&mouseX>200){
       fill(200,200,20);
    }
    if(mouseX>300){
       fill(150,0,150);
    }
    rect(500,50,50,50);
    ellipse(500,500,50,30);
    rect(50,50,50,50);
    ellipse(50,500,50,30);
    ellipse(300,300,50,50);
}

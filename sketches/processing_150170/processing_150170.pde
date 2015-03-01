
void setup(){
    size(600,600);    
}
void draw(){
     background(255);
     line(50,0,50,height-1);
     line(99,0,99,height-1);
     ellipse(mouseX,mouseY,50,50);
if(mouseX<50){
     fill(0,255,0);
     rect(width-100,50,50,50);
}
if(mouseX>50&&mouseX<99){
     fill(255,0,0);
     rect(width-100,50,50,50);
}
if(mouseX>99){
     fill(0,255,0);
     rect(width-100,50,50,50);
}
}

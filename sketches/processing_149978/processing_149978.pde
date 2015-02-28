
void setup(){
size(600,400);
}
void draw(){
background(255);
stroke(0);
strokeWeight(1);
line(40,0,40,height-1);
line(0,20,width-1,20);
ellipse(mouseX,mouseY,100,100);
stroke(255,0,0);
strokeWeight(3);
}

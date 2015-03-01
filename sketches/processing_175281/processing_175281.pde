
void setup(){
size(500,500);
background(255,255,255);
}


void draw(){
background(random(0,255),random(0,255),random(0,255));
ellipse(mouseX,mouseY,50,50);
ellipse(mouseY,mouseX,50,50);

 
}

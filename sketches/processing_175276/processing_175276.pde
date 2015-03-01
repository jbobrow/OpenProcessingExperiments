

void setup(){
size(500,500);
background(255,255,255);
}


void draw(){
fill(mouseX/2,mouseY,0);
rect(mouseX,mouseY,50,50);
ellipse(mouseY,mouseX,50,50);


}

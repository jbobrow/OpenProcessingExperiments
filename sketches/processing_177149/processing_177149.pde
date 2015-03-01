
void setup(){
backround(0,255,0);
size(500,500);
}

void draw(){
fill(255,0,0);
ellipse(mouseX,mouseY,50,50);

if(mousePressed){
   line(mouseY,mouseX,50,50);
}

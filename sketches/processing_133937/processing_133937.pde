
int aumenta=0;
void setup(){
size(600,600);
background(156,142,255);
}
void draw(){ 
ellipse(mouseX,mouseY,100,200);
aumenta++;
fill(random(169),40,196);
stroke(60,40,196);
strokeWeight(2);
}

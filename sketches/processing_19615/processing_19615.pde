
void setup(){
size(250,250);
smooth();
background(255,227,64);
}
void draw(){
if(mousePressed){
fill(random(255));
}
ellipse(mouseX,mouseY,100,100);
}



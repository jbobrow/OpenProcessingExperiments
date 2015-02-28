
void setup(){
size(300,300);
smooth();
background(204);
rectMode(CENTER);
}

void draw(){
if(mousePressed){
if(mouseButton == LEFT){
fill(255);
} else if(mouseButton == CENTER){
fill(0);
}
else{
fill(255,0,0);
}
rect(mouseX,mouseY,50,50);
}
}                               

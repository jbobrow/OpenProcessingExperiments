
void setup () {
size( 250, 250);
background(0);
}

void draw (){
stroke(0);
fill(166,255,3,20);
ellipse(mouseX,mouseY,47,40);
}

void keyPressed(){
if(key=='s'){
saveFrame("rhythmcircle.png");
} 
}


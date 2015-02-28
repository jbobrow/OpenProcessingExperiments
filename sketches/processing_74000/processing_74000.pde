
void setup (){
size (400,400);
smooth ();
}

void draw (){
if(mousePressed){
fill (0);
}
else{
fill(255);
}
ellipse(mouseX,mouseY,80,80);
}


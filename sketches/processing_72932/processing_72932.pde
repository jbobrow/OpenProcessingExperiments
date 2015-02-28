
void setup (){
size (200,200);
noFill();
}

void draw () { 
  background(255);
bezier (25,100,mouseX,mouseY,mouseX+120,mouseY+80,180,100);
}


void setup(){
size(600,600);
background (145,150,200,90);
smooth();
}
  
void draw(){
if(mousePressed) {
stroke(255,255,255,0)
fill(mouseX,mouseY,255,mouseX);
}else{
stroke(255,255,255,0)
fill(mouseY,mouseX,50,mouseY);
}
ellipse(mouseX,mouseY,mouseX,mouseY/5);
}


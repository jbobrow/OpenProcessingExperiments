
void setup(){
size(400,400);
smooth();
}
void draw(){
if(mousePressed){
  rect(mouseX,mouseY,80,80);
}

else{
  triangle(mouseX,mouseY,mouseX+10,mouseY-25,mouseX+20,mouseY);
}
}

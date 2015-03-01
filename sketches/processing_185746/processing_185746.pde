

void setup(){
  size(600,600);
  //backgroung(180,120,120);
}

void draw(){
if (mousePressed){
stroke(100,190,100);
line(mouseX, mouseY, pmouseX, pmouseY);
}
}

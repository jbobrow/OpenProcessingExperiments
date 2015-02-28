
void setup(){
  size(800,500);
  background(0);
  smooth();
}

void draw(){
  if(mousePressed==true){

    stroke(204, 51, 204,50);
  }
  else{
    stroke(102, 255, 255);
}
strokeWeight(.5);
line(mouseX, mouseY, mouseY, mouseX);
if(keyPressed){
if(key=='d'){
clear();
}
}
}


void setup(){
  size(400, 400);
  background(#3EAAD3);
}

void draw(){
  if (mousePressed == true){
    stroke(#DB1F1F);
    for(int i=0; i<50; i++){
      point(mouseX -15 + random(5), mouseY + random(5));
    }
    stroke(#27DB1F);
    for(int i=0; i<50; i++){
      point(mouseX + 15 + random (5), mouseY + random(5));
    }
  }
  stroke(#CD00FC);
  for(int i=0; i<50; i++){
     point(mouseX + random(5), mouseY + random(5));
   }
}

void mouseReleased(){
  stroke(#FFFFFF);
  for(int i=0; i<50; i++){
    line(mouseX, mouseY, 200, 200);
  }
}
  




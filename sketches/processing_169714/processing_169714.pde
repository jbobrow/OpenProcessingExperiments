
void setup(){
size (250,250);
stroke(255,0,0);
}

void draw(){
background (0);

for (int i=0; i<height;i+=10){
  line(mouseX,mouseY,width,i);
}

for (int i=0; i<height;i+=10){
  line(0,i,mouseX,mouseY);
}

for (int i=0; i<height;i+=10){
  line(i,0,mouseX,mouseY);
}

for (int i=0; i<height;i+=10){
  line(i,height,mouseX,mouseY);
}


}





void setup(){
size (255,255);

}

void draw(){
background (0);

for (int i=0; i<height;i+=10){
  stroke(255,i,i);
  line(mouseX,mouseY,width,i);
}

}




void setup(){
  size(600,600);
  smooth();
}

void draw(){
//make a line of ellipses
for(int i=0; i < width; i+=10){
   for(int j=0; j < height; j+=10){
    if (mouseX > i && mouseX < i+10 && mouseY > j && mouseY < j+10){
      fill(0,0,0);
    }else{
      noFill();
    }
  if(i%20 == 0 && j%20 ==0 ){
  fill(mouseX,mouseY,0);
  }
  point(i,j);
  rect(i,j,20,20);
  }
}
}

  void mouseReleased(){
fill(0,255,0);
}


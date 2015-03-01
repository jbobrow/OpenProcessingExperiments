
int diam=30;

void setup(){
  size(500,500);
}

void draw(){
translate(width/2, height/2);
rotate(millis()*-0.001);
for(int i=diam/2; i<width; i+=diam){
  for(int y=diam/2; y<height; y+=diam){
    int strokeValue = int(map(i, diam/2, width, 0, 255));
    rect(i - width/2,y - height/2, map(mouseX,0,500,0,30), map(mouseY,0,500,0,30));
  }

}
}



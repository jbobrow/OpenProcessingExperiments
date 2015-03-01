
int diam=20;

void setup(){
  size(500,500);
}

void draw(){

for(int i=diam/2; i<width; i+=diam){
  for(int y=diam/2; y<height; y+=diam){
    int strokeValue = int(map(i, diam/2, width, 0, 255));
    fill(strokeValue,mouseX,mouseY);
    ellipse(i,y, diam, diam);
  }
}

}



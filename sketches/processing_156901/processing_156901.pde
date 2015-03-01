
int diam=30;

void setup(){
  size(500,500);
}

void draw(){
noStroke();
for(int i=diam/2; i<width; i+=diam){
  for(int y=diam/2; y<height; y+=diam){
    int strokeValue = int(map(i, diam/2, width, 0, 255));
    fill(random(0,255),mouseX,mouseY);
    ellipse(i,y, map(mouseX,0,500,0,30), map(mouseY,0,500,0,30));
  }
}

}



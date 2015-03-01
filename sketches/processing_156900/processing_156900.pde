
int diam=15;

void setup(){
  size(500,500);
}

void draw(){

for(int i=diam/2; i<width; i+=diam){
  for(int y=diam/2; y<height; y+=diam){
    fill(random(0,255),mouseX,mouseY);
    rect(i,y, diam, diam);
  }
}

}



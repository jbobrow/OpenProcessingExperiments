
float a = 10;

void setup(){
  background(255);
  size(600,600);
}

void draw(){
  for(int y=0; y<height; y+=a){
    for (int x=0; x<width; x+=a/2){
      ellipse(x,y,x-3,y-3);
    }
  }
}
  

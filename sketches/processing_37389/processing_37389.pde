
void setup (){
  size (1000,200);
  smooth();
  background(0);
}

void draw(){
  for(int x = 0; x < width; x+=10){    
    for(int y = 0; y<height; y+=10){
      ellipse(x,y,5,5);
    }
  }
}


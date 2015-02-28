
void setup () {
  size(400,400);
}

void draw() {
  
  for (int x=0; x<width; x+=10){
      for (int y=0; y<height; y+=10){
    noStroke();
    fill(random(255),random(255),0);
    rect(x,y,10,10);
      }   
  }
  
}



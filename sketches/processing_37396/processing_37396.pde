
void setup (){
  size (1000,200);
  smooth();
  background(0);
}

void draw(){
  background(0);
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      ellipse(x,y,4,4);
      strokeWeight(.16);
      stroke(255);
      line(width/2,height/2,x,y);
    }
  }
}


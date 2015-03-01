
import processing.pdf.*;
color[]beach={#D9C680,#314650,#2D4761,#45718C,#B6E1F2};
color[] palette= beach;

int s = 25;

void setup(){
  size(600,200);
  background(palette[0]);
  smooth();
  noStroke();
  
  for(int x=0; x<width; x+=s){
    for(int y=0; y<height; y+=s){
      fill(palette[int(random(1,4))]);
      rect(x,y,s,s);
    }
  }
}
void draw(){
  fill(palette[int(random(1,4))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  rect(x,y,s,s);
}



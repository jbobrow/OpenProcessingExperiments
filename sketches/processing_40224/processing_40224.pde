
//BEAM(Homework Assignment 3)
//By Ellen Wang


void setup(){
  size (800,800);
  smooth();
  background(255);
}

void draw(){
  background(0);
  noStroke();
  for(int x=0; x<width; x+=10){
    for(int y=0;y <height; y+=10){
      if(x%5 ==0 && y%5 ==0){
        fill(0,250,0);
        float ellSizeX = (map(mouseX,0,width,1,30+random(0-20)));
        float ellSizeY = (map(mouseY,0,width,1,100));
        rect(x,y,ellSizeX,ellSizeY);
        if(dist(mouseX,mouseY,x,y)<75){
          fill(255);
          rect(x+random(0-100),y+random(0-800),ellSizeX,ellSizeY);
          rect(x-random(0-100),y-random(0-800),ellSizeX,ellSizeY);
          rect(x+random(0-100),y-random(0-800),ellSizeX,ellSizeY);
          rect(x-random(0-100),y+random(0-800),ellSizeX,ellSizeY);
        }
      }
    }
  }
}
   




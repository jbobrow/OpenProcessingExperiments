
void setup(){
  size(600,600);
  smooth();
  strokeWeight(.1);
}

void draw(){
  background(100,mouseY,mouseX);
  float tSize = 5;
  for(int x = 0;x<700;x+=1){
    for (int y=0;y<700;y+=1){
      tSize = sin(x-y);
      line(mouseX,y,tSize,x);
      stroke(0);
      line(x++,tSize*2,y,tSize);
      stroke(255);
      line(mouseX,y,tSize,x);
      stroke(0);
      line(y,tSize,x,mouseY);
      stroke(255);
      line(x*5,tSize++,tSize,x*5);
      stroke(0);
    }
  }
}



void setup(){
  size(500,500);
  background(0);
}
void draw(){
  background(0);
  noStroke();
  fill(255,10,40,100);
  for(int y=0;y<height;y+=30) {
    for(int x=0;x<width;x+=30) { 
      float d=dist(x,y,mouseX,mouseY);
      d/=10;
      d=50-d;
      ellipse(x+10,y+10,d,d);
    }

  }
}



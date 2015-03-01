
void setup(){
  size (500,500);
  smooth();
  frameRate(20);
  noStroke();
  background(237,55,230);
}

void draw(){
  for(int x=10;x<width;x=x+15){
    for(int y=10;y<height;y=y+15){
  fill(random(255));
  ellipse(x,y,10,10);
    }
  }
}

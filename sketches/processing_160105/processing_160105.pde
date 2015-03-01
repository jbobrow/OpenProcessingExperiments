
void setup(){
size(500,500);
background(0);
frameRate(25);
stroke(0,255,0,90);
}
void draw(){
  float x=random(width);
  float y=random(height);
  strokeWeight(25);
  line(x,0,y,500);
  if(mousePressed){
    background(0);
  }
}


float side;

void setup(){
size(600,600);
}
 
void draw(){
  background(235,228,23);
  for(float x=0; x<=width; x+=20){
    for(float y=0; y<=height; y+=20){
      float side=dist(mouseX, mouseY, x, y)/20;
      square(x,y,side);
    }
  }
}
 
void square(float xpos, float ypos, float s){
  color(HSB, 360, 100, 100);
  fill(map(dist(mouseX, mouseY, xpos, ypos), 600*sqrt(2), 0, 360, 0), 100, 100);
  stroke(235,228,23);
  strokeWeight(side*2);
  rect(xpos, ypos, s, s);
}

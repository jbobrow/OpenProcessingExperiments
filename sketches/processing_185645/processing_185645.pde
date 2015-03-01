
void setup(){
size(600,600);
}
void draw(){
  float aleatorio =random (100,150);
  float x=random(0,width);
  float y = random(0,height);
  background(aleatorio,255,255);
  ellipse(x,y,50,50);
}

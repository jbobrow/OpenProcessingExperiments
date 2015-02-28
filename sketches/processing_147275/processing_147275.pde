

void setup() {
  size(400,400);
  background(255);
  smooth();
  frameRate(5);
}
  
void draw() {
  if(mousePressed){
    background(255);    
  }
  float x = random(width);
  float y = random(height);
  fill(random(255),random(255),random(255));
  ellipse(x,y,70,70);
  fill(random(255),random(255),random(255));
  ellipse(x,y,50,50);
  fill(random(255),random(255),random(255));
  ellipse(x,y,30,30);
}
  
  

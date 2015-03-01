
void setup() {
  size(400,400);
  background(255); 
  frameRate(3);
}
   
void draw() {
  if(mousePressed){
    background(255);   
  }
  float x = random(width);
  float y = random(height);
  ellipse(x,y,20,20);
  fill(153,255,204);

 
}

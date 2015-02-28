
void setup(){
  size(600,600);
  background(180);
}
void draw(){
  noStroke();
  colorMode(HSB);
  fill(random( 100), random(120),random(200)); 
  ellipse(mouseX,mouseY,30,30);
  }


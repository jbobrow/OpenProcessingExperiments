
void setup(){
  size(1000,600);
  background(180);
}
void draw(){
  noStroke();
  colorMode(HSB);
  fill(random( 190), random(200),random(105)); 
 ellipse(mouseX,mouseY,20,20);

  }

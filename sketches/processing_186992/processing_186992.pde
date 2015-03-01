
void setup (){
  size (600,600);
  strokeWeight(5); 
  smooth();
}
 
void draw (){
  background(0); //black background
  stroke(0,255,0); //green stroke for triangle 1
  triangle(300,300,15,30,mouseX,mouseY); //green triangle
  stroke(0,0,255); //blue stroke for triangle 2
  float mx = map(mouseX, 300, width, 300, 100);
  triangle(300,300,15,30,mx,mouseY);  //blue triangle
 }



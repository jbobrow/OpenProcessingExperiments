
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255, 150, 200);
  stroke(255,255,255);
  strokeWeight(5);
 for(int x=0; x<width; x+=map(mouseX,0,width,4,30)){
   line(x,0,x+100,height);
 } 

}

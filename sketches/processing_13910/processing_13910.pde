
 void setup() {
  size(300, 300);
  background(0);
  smooth();
  strokeWeight(0.5);
  stroke(255);
  noFill();
  frameRate(60);
 
}
 
void draw() {
  for(int b = 0; b<100; b = b+100){
  float a = random(500);
  ellipse(a,a-b,b%255,a);
  rect(a-b,a-b,b%a,a);}
}
    



                
                

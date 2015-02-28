
void setup() {
size(1000,400);
smooth();
background(255);
draw_background();
}
void draw_background(){
  for(int i=0;i<16000;i++){
   pushMatrix();
translate(random(width),random(height));
rotate(random(1) * radians(360));
noStroke();
fill(random(255),random(255));
ellipse(0,0,random(30),random(10));
popMatrix();
}
}
void draw () {
  pushMatrix();
translate(random(width),random(height));
rotate(random(1) * radians(360));
noStroke();
fill(random(255),random(255));
ellipse(0,0,random(50),random(20));
popMatrix();
}


void setup(){
  size(400,400);
  noFill();
  smooth();
}
void draw(){
  background(0,0,255);
  fill(255,0,0);
  beginShape();
  vertex(50,370);
  vertex(70,345);
  vertex(50,300);
  vertex(100,250);
  vertex(190,300);
  vertex(140,300);
  vertex(180,320);
  vertex(100,345);
  vertex(120,370);
  endShape();
  fill(0);
 ellipse(100,275,10,10); 
}

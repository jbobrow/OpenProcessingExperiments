
void setup(){ 
  size(600,600);
  smooth();
  background(255);
  frameRate(15); 
}
 
void draw (){ 
  
 fill(random(50),random(200),random(40),100); 
  noStroke();
  drawLeaf(width/2,height/2);
}
 
 void drawLeaf(float x, float y) {
   
 
pushMatrix();
translate(x,y);
rotate(radians(random(0,360)));
scale(random(0.5,1.5));
smooth();
beginShape();
vertex(90, 69); 
bezierVertex(90, 60, 54, 47, 20, 113); 
bezierVertex(20, 113, 90, 137, 90, 60); 
endShape();
popMatrix();
 }

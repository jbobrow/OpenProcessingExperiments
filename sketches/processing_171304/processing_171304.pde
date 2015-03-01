
void setup(){ 
  size(600,600);
  smooth();
  background(255);
  frameRate(15); 
}
 
void draw (){ 
  fill(random(200,150),random(200),random(40),100); 
 
  noStroke();
  
  drawLeaf(random(0,width),random(0,height));
}
 
 void drawLeaf(float x, float y) {
   

pushMatrix();
translate(x,y);
rotate(radians(random(0,360)));
scale(random(0.5,1.5));
smooth();
beginShape();
vertex(90, 39); 
bezierVertex(90, 39, 54, 17, 26, 83); 
bezierVertex(26, 83, 90, 107, 90, 39); 
endShape();
popMatrix();
 }


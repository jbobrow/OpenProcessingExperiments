
void setup() {
  size(500,500,P3D);
}
 
void draw() {
  background(255);
  translate(width/2,height/2);
  smooth(8);
  rectMode(CENTER);
//circular motion  
  rotateY(frameCount*.02);

  pushMatrix();
  translate(120,0,0);
  fill (200);
  sphere(75);
  sphereDetail(40);
  popMatrix();
  
  pushMatrix();
  translate(120,0,0);
  fill (0);
  noStroke();
  rotateX (0.7);
  rotateY (0.8);  
  box(100);
  popMatrix();
  
  pushMatrix();
  translate(120,0,0);
  box(100);
  popMatrix();

}



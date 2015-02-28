

void setup() {
  size(256,256);
  smooth();
}

void draw() {
  background(0);
  stroke(0);
  
   pushMatrix();
  
  // soleil
  translate(width/2,height/2);
  
  fill(255,200,50);
  ellipse(0,0,20,20);
  
  pushMatrix();
  
  // La terre
  rotate(frameCount * 0.01);
  translate(50,0);
  
  fill(50,200,255);
  ellipse(0,0,10,10);
  
  // La lune de la terre
  rotate(frameCount * -0.04);
  translate(15,0);
  
  fill(127);
  ellipse(0,0,6,6);
  
  popMatrix();
  
  // Mars
  rotate(frameCount * 0.003 + 0.43);
  translate(100,0);
  
  fill(200,0,0);
  ellipse(0,0,20,20);
  
  pushMatrix();
  
  // Premiere lune de Mars
  rotate(frameCount * -0.02);
  translate(20,0);
  
  fill(255,50,60);
  ellipse(0,0,6,6);
  
   // Astéroide de la lune de Mars
   /*
  rotate(frameCount * -0.03 + 0.53);
  translate(7,0);
  fill(200,70,80);
  ellipse(0,0,4,4);
  */
  popMatrix();
  
  popMatrix();
  
}

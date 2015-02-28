
float angle = 0;
 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  background(173,255,254);
  fill(77,240,108);
  rect(0,400,500,100);
  
  fill(77,240,108);
  rect(450,355,3,50);
  
  fill(77,240,108);
  rect(400,355,3,50);
  
  fill(77,240,108);
  rect(350,355,3,50);
  
  fill(77,240,108);
  rect(300,355,3,50);
  
   fill(77,240,108);
  rect(250,355,3,50);
  
   fill(77,240,108);
  rect(200,355,3,50);
  
   fill(77,240,108);
  rect(150,355,3,50);
  
   fill(77,240,108);
  rect(100,355,3,50);
  
   fill(77,240,108);
  rect(50,355,3,50);
}
 
void draw() {
  
  pushMatrix();
  translate(150,100);
  rotate(angle);
  fill(255, random(190,215), random(0,100)); 
  rect(0,0,2,random(20,100)); 
  popMatrix();
  
  pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(450,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
  pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(400,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
  pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(350,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
  pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(300,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
   pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(250,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
   pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(200,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
   pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(150,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
   pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(100,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
   pushMatrix();
  fill((255),random(0,160),random(200,230));
  translate(50,350);
  rotate(angle);
  ellipse(1,1,1,random(0,40));
  popMatrix();
  
angle += .5;
}

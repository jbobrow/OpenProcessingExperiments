
float angulo1 = 0;
float angulo2 = 0;

void setup() {
  size(800,800,P3D);
}
void draw() {
  background(0);
  stroke(250,172,15);
 noFill();
  rectMode(CENTER);
  pushMatrix();
  translate(400,400); 
  rotateX(mouseX);
  rotateZ(angulo1);
  sphere(100); 
  popMatrix();
  
 pushMatrix();
  translate(400,400); 
  rotateX(angulo1);
   stroke(15,142,250);
ellipse(0,0,350,250); 
  popMatrix();
 
  pushMatrix();
  translate(400,400); 
  rotateY(angulo2);
  ellipse(0,0,250,350); 
  popMatrix();
  
  
  angulo1 += 0.06;
  angulo2 += 0.06;
  
}
void mousePressed (){
  saveFrame ("1.JPG");
}


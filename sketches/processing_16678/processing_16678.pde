
float angulo1 = 0;
float angulo2 = 0;

void setup() {
  size(800,600,P3D);
}
void draw() {
  background(0);
  stroke(12,21,242);
  ellipse (330,300,550, 450);
  
  stroke(18,67,8);
 noFill();
  rectMode(CENTER);
  pushMatrix(); 
  translate(250,250); 
  rotateY(mouseY);
  sphere (120);
   popMatrix();
    angulo1 += 2.00;
  angulo2 += 2.00;
   int moverx = constrain(mouseX,0,width);
  int movery = constrain(mouseY,0,height);
  pushMatrix(); 
   translate(moverx,movery);
   stroke (240,17,17);
sphere (50);
   popMatrix();
}
void mousePressed (){
  saveFrame ("1.JPG");
}


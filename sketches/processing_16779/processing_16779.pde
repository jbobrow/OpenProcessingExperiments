
float mov = 0;
float angulo1 = 0;
float angulo2 = 0;

void setup() {
  size(800,600,P3D);
}

void draw() {
  background(0);
  translate(width/2,height/2);
 noFill();
 
  pushMatrix();
translate(25,0); 
  rotateY(mov*2);
   stroke(85,201,37);
   sphere(800); 
  popMatrix();
  
   pushMatrix();
  translate(50,50); 
  rotateY(angulo2);
   stroke(255,70);
   sphere(120);
  popMatrix();

  
   mov += 0.02;
 angulo1 += 0.02;
  angulo2 += 0.02;

}
void mousePressed (){
  saveFrame ("1.jpg");
}


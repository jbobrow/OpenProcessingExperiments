
float a;

void setup() {

  size(300, 300, P3D);
  smooth();  
   }

void draw() {

  a += 0.01;
  lights();
  background(00);
  
  for (int i = 1; i <= 400; i = i + 1)/// background`s color stars
  {
   stroke(random(255),random(255),random(255)); 
    point(random(800),random(700)); 
  }
  translate(width >> 1, height >> 1);//position on the stage
  rotateX(a);
  rotateY(a);
  fill(255, 110, 110);  
  stroke(random(100),random(10),random(200)); //cube stroke colors
  for (int i = 0; i < 10 ; i++) {
     
    rotateZ(a); 
    rotateY(a);
    box(100);

   
  }
  
}





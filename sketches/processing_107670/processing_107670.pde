
float px= 3.1416;
void setup(){
  size(700,700,P3D);
  smooth();
  background(35);
  stroke(0.50);
 noCursor();
}
void draw(){
  //background(35);
  fill(100,2,200);
  translate(width/2,height/2);
  rotateY(mouseX*0.1);
  rotateX(     mouseY*0.1   );
   sphere(100);
  translate(width/3,height/3);
  fill(255,50);
  rotateY(mouseX*0.01);
  rotateX(mouseY*0.1);
  //sphereDetail(mouseX / 100);
 sphere(10);
 sphere(40);
}

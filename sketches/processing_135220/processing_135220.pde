
float px= 3.1416;
void setup(){
  size(500,500,P3D);
  smooth();
  background(202,187,203);
  random(23,90);
  stroke(0.120);
 noCursor();
}
void draw(){
  //background(98,69,183);
  random(232,245);
  fill(60,30,47);
  stroke(92,16,100);
  translate(width/2,height/2);
  rotateY(mouseX*0.2);
  rotateX(     mouseY*0.1   );
   sphere(63);
  translate(width/3,height/3);
  fill(204,205,252);
  rotateY(mouseX*0.01);
  rotateX(mouseY*0.1);
  //sphereDetail(mouseX / 40);
 sphere(10);
 translate(width/5,height/2);
 fill(13,14,95);
 stroke(88,90,185);
 sphere(30);
 translate(width/3,height/3);
 fill(48,49,80);
 stroke(188,190,255);
 
}


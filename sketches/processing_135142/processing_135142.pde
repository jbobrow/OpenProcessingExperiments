
float px= 3.1416;
void setup()
{
  size(700,700,P3D);
  background(82,80,255);
  random(23);
  stroke(0.120);
 noCursor();
}
void draw(){
  //background(188,187,206);
  random(44);
  fill(159,192,234);
  stroke(75,78,80);
  random(121);
  translate(width/2,height/2);
  rotateY(mouseX*0.2);
  rotateX(mouseY*0.1);
  sphere(140);
  translate(width/3,height/3);
  fill(193,121,156);
  rotateY(mouseX*0.01);
  rotateX(mouseY*0.2);
  //sphereDetail(mouseX / 50);
 sphere(10);
 stroke(4,33,62);
 fill(148,155,232);
 noFill();
fill(255);
 sphere(15);
 fill(198,64,192);
 sphere(20);
 fill(138,129,12);
}


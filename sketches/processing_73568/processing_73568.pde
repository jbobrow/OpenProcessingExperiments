
float rot = 0.5;

void setup()
{
  size(600,600,P3D);
  
}
void draw()
{
  
  pointLight(255,255,255,mouseY,mouseX,mouseY);
  background(255);
  fill(255);
  square();
}
void square()
{
    //Middle Part
 
  rotateX(rot);
  rotateY(rot);
  fill(random(255),random(255),random(255));
  translate(300,300,0);
  sphere(32);
 

  fill(86,94,95);
  translate(20,20,0);
  box(50);
  translate(-40,-40,0);
  box(50);
  
  //reset
  translate(20,20,0);
  rotateY(rot+1);
  rotateZ(rot+1);
  //Middle
  box(50);


  rot = rot + 0.02;  
}

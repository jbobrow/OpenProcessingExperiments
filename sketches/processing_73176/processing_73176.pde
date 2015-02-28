
//Stanley L,CP1, block 6
void setup()
{
size(500,500,P3D);
fill(0,0,255,80);

}
void draw()
{
noStroke();
  pointLight(0,255,0,mouseX,mouseY,0);
  background(0);
translate(mouseX,mouseY,0);
rotateX(-mouseY/25);
rotateY(-mouseX/25);
  box(100);
  stroke(255,0,0);
  translate(250,250,0);
  rotateX(random(0,1/2));
  rotateY(random(0,1/2));
  rotateZ(random(0,1/2));
  sphere(25);
}

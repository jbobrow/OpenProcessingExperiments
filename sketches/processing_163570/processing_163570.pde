
void setup()
{
size(600,600,P3D);

}
void draw()
{ 
  background(0);
  stroke(255);
  lights();
  fill(255);
  quad(270,0,150,600,450,600,330,0);
  translate(300,mouseY);
  rotateX(mouseY*0.03);
  fill(67,237,216);
  sphere(mouseY*0.3+30); 
}

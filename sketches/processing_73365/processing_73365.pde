
//Victor Murillo, CP1 mods 16-17, Rotating Cube
float x = .2;
float y = .2;
void setup()
{
  
  size(600, 600, P3D);
  frameRate(10);
}
void draw()
{
    background(0);
    pointLight(0,0,255,200,200,300);
    translate(300,300);
    rotateX(x);
    rotateY(y);
    box(100);
    rotateX(-x);
    rotateY(-y);
    translate(-300,-300);
    translate(400,400,0);
    rotateX(x);
    rotateY(y);
    box(100);
    x = x + .2;
    y = y + .2;
  }

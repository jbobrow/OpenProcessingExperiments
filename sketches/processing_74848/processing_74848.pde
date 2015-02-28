
//Eli Newbrun-Mintz, CP1 4-5, 100 Random Shapes Assignment
void setup()
{
  size(500,500,P3D);
  background(0);
  smooth();
  strokeWeight(0.5);
  frameRate(10);
}

void draw()
{

  int H=0;
  while(H<100)
 {
    rotateX(random(-0.5,0.5));
    rotateY(random(-0.5,0.5));
    translate(random(0,501),random(0,501));
    fill(random(0,256),random(0,256),random(0,256));
    box(50);
    H++;

    if(keyPressed==true && key=='x')
    {
      background(0);
    }
  }

}

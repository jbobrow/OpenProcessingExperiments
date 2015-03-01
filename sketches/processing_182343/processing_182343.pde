
float sferz;
void setup()
{
  size(1000,600);
  background(255);
  sferz = 2;
}
void draw()
{
  translate(width/2,height/2);
    rotate(sferz);
    strokeWeight(10);
    stroke(random(255),mouseX,mouseY);
    point(sferz*5+0,0);
    sferz = sferz+PI/34;
    line(sferz,sferz*5+7,sferz,sferz);
}
void mousePressed()
{
background(random(100,200),random(12,13),random(200,255));
sferz = 0;
}

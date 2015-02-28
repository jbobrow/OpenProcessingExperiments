
float rot = 0;
float x = 0;

void setup()
{
  size(800,600,P3D);
  background(134,127,133);
  smooth();
  stroke(255);
  frameRate(20);

}
void draw()
{
  {
    stroke(255,209,80);
    line(random(800),random(600),50,50);
    stroke(252,185,13);
    fill(252,201,13);
    ellipse(x+50,30,300,300);
    fill(0);
    stroke(250,89,61);
    fill(222,111,92);
    ellipse(x+210,160,70,70);
    stroke(113,144,98);
    fill(132,157,119);
    ellipse(x+280,210,90,90);
    stroke(245,131,54);
    fill(227,109,30);
    ellipse(x+650,500,350,350);
    
    stroke(52,86,139);
    lights();
    translate(x+400,300,0);
    rotateY(rot);
    rot = rot + .0005;
    fill(54,135,245);
    sphere(100);
    if(mousePressed == true)
    {
    x = x - int(random(-4,4));
    }
  }
}

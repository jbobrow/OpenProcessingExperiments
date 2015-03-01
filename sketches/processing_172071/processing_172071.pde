
float counter = 0;
 
void setup ()
{
  size (500, 500);
  background(255);
  smooth(3);
}
 
void draw ()
 
 
{
 
 
  background(255);
  colorMode(RGB, 155, 155, 155);
  //float counter_mouse=map(mouseX, 0, width, 0.01, 0.2);
  fill(0, 50, 50);
  ellipse(50, 50, 100, 100);
  ellipse(30, 70, 10, 10);
  ellipse(70, 70, 10, 10);
  ellipse(150, 50, 100, 100);
  ellipse(130, 70, 10, 10);
  ellipse(170, 70, 10, 10);
  fill(0, 50, 50);
 
  ellipse(250, 50, 100, 100);
  ellipse(230, 70, 10, 10);
  ellipse(270, 70, 10, 10);
  ellipse(350, 50, 100, 100);
  ellipse(330, 70, 10, 10);
  ellipse(370, 70, 10, 10);
  ellipse(450, 50, 100, 100);
  ellipse(430, 70, 10, 10);
  ellipse(470, 70, 10, 10);
 
  {
 
    colorMode(HSB, 360, 100, 100);
    float amplitude = map (sin(counter), -1, 1, 120, 60);
 
    fill(amplitude, 100, 100);
 
    translate(250, cos(counter)*amplitude);
 
    ellipse(0, 600, 300, 300);
    ellipse(-40, 500, 40, 40);
    ellipse(40, 500, 40, 40);
 
    println(sin(counter));
    counter +=0.01;
  }
}


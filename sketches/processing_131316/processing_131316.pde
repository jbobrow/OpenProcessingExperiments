
float a = 0.5;
float b = 1;
float c = 1.5;
float e = 0.0;


void setup(){
size(400, 400);
background(116, 193, 206);
frameRate(25);
smooth();
}

void draw()
{
  
a = a + .1;
b = b + .2;
c = c + .3;
e = cos(a)*1.5;

rotate(a);
rotate(b);
rotate(c);

stroke (255, 120);
  translate (40, 20);
  for (int i = 0; i < 10; i++)
  strokeWeight (i);
  rotate(PI/8);


fill(238, 238, 0);
rect(50, 50, 50, 75);
fill(242, 204, 47, 160);
rect(100, 100, 75, 100);
fill(174, 221, 60, 160);
rect(150, 150, 100, 125);
fill(238, 238, 0);
rect(200, 200, 125, 150);
fill(242, 204, 47, 160);
rect(250, 250, 150, 175);

translate(width/2, height/2);
scale(e);
fill(174, 221, 60, 160);
  rect (50, 300, 100, 200);
  rotate (-PI/8);
  
  colorMode(HSB, 300, 20, 20);
  for (int i = 0; i < 100; i++)
{
  float newHue = 200 - (i * 1.1);
  fill(newHue, 20, 20);
  ellipse(10, 10, 20, 20);
}
for (int h = 0; h < 75; h++) 
{
  float d = random(10);
  stroke(d*2);
  line(150, h, 150+d, h);
}


}




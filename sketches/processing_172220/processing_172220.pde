
float speed = 0;
void setup()
{
size(300, 300);
background(255);
colorMode(HSB, 360, 100, 100);
}

void draw()
{
background(360, 0, 100);

float heartheight = map(sin(speed), -1, 1, -30, 30);
float heartwidth = map(sin(speed), -1, 1, -200, 200);
float heartcolor  = map(cos(speed), -1, 1, 50, 100);

translate(width/2, height/2 +heartheight);


  stroke(360, 100, heartcolor);
  fill(360, 100, heartcolor);
  ellipse(-25, -50, 50, 40);
  ellipse(25, -50,  50, 40);
  triangle(-50, -48, 50, -48, 0, 10);
  
 speed += map(mouseX, 0, height, 0.05, 0.15);
}


//M. Kontopoulos (11.2010)
//Using sin values to control the 
//movement and scaling of an ellipse
float r = 100.0;
float angle = 0.0;
float speed = 0.05;
void setup()
{
  size(400,400);
  background(200);
  smooth();
}

void draw()
{
  background(200);

  fill(0,12);
  rect(0,0,width,height);
  fill(255);

  angle += speed;

  //Using the sin val to offset the y position
  float sinval = sin(angle);
  float yoff = sinval * r;
  ellipse(200, 200+yoff, 80,80);

  //using the sin val to control scaling
  translate(width/2+100,height/2);
  scale(yoff/900.0  +  0.5);
  ellipse(0,0, 80,80);
}



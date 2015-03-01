
float counter = 0;

void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{

  background(0);


  translate (height/2, width/2);
  float counter_mouse = map(mouseX, 0, width, 0, 0.2);
  float amplitude = map(sin(counter), -1, 1, 0, 255);

  pushMatrix();
  stroke(0);
  smooth();
  fill(255,218,185);
  ellipse(0, 0, 400, 400);
  popMatrix();





  pushMatrix();
  stroke(0);
  smooth();
  fill(255);
  ellipse(-80, -80, 70, 70);

  stroke(0);
  smooth();
  fill(255);
  ellipse(80, -80, 70, 70);

  fill(0);
  ellipse(0, 80, -150, 80);
  popMatrix();





  noStroke();
  smooth();
  fill(255, amplitude, 100);

  ellipse (85, -80, 16.5, 16.5);
  ellipse(-85, -80, 16.5, 16.5);
  ellipse (75, -80, 16.5, 16.5);
  ellipse(-75, -80, 16.5, 16.5);

  triangle(92, -75, 68, -75, 80, -60);
  triangle(-92, -75, -68, -75, -80, -60);


  counter+=counter_mouse;
}


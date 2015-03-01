
/*

most simple way to make a simulation of a planet running in a ellipse
using  the gravitation law

now the displacements are not equal anymore

you can see the speed variation also in the distance of the points from each other

Beam 2014, for the lecture on OPEN SOURCE ASTRONOMY

*/

float px = 0;
float py = 0;
float vx = 0;
float vy = 1;
float ax = 0;
float ay = 0;

float last_x;
float last_y;

float divide = 30000;
int numberOfCalc = 700;

void setup()
{
  background(0);
  size(300, 300);

  fill(255);
  stroke(255);

  px = -0.054833014 *2 ;
  py = -0.29217726 *2 ;
  vx = -0.78003997 ;
  vy = 0.13199782;
}


void draw()
{

  fill(0, 10);
  rect(0, 0, width, height);

  fill(255);
  stroke(255);

  for (int j = 0; j < numberOfCalc; j++) {

    float d = sqrt(px*px + py*py);

    ax =   -px / d/d/d;
    ay =  - py / d/d/d;

    vx += ax / divide;
    vy += ay / divide;

    px += vx / divide;
    py += vy / divide;
  }

  translate ( width/2.0, height/2.0);
  ellipse(px* width/2, py* height/2, 2, 2);
}


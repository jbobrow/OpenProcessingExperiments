
/**
 * Cubes
 * Modified from Processing example's "LightsGL" by Simon Greenwold. 
 * 
 * JI 2011/08/03
 */

import processing.opengl.*;

float t = 0;

void setup() 
{
  size( 500, 500, OPENGL );
  smooth();
  noStroke();
}

void draw() 
{
  defineLights(t);
  background(128,0,0);
  
  for ( int x = 0; x <= width; x += 20 )
  {
    for ( int y = 0; y <= height; y += 20 )
    {
      pushMatrix();
      translate(x, y);
      rotateY(t/100.0);
      rotateX(t/200.0);
      box(10.0 + 20.0*(sin(t/100.0) + 1)/2);
      popMatrix();
    }
  }
  t++;
}

void defineLights(float t)
{

  pointLight(255.0*(sin(t/200.0) * 0.5 + 0.5), 100, 0,   // Color
             width*(sin(t/200.0) * 0.5 + 0.5), width*(cos(t/200.0)*0.5 + 0.5), 200.0); // Position

  directionalLight(0.0, 102, 255.0 * (sin(t/200.0)*0.5 + 0.5), // Color
                   sin(t/300.0), cos(t/400.0), 0);    // Direction

  spotLight(255, 255, 109,  // Color
            width*(sin(t/300.0)*0.5 + 0.5), width*(cos(t/400.0)*0.5 + 0.5), 200.0,     // Position
            0, -0.5, -0.5,  // Direction
            PI/2.0, 1.0);     // Angle, Concentration
}


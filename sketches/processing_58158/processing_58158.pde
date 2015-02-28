
// Hasan - PS3 - Remix 
/* Structure is pretty much the same as before. Changed some values and shapes 
to create a totally different pattern. Overall, the code is very complex for my 
level, but I figured what area controls most of the pattern. Was good to try 
something new! */ 

/** 
 * Penrose Tile L-System 
 * by Geraldine Sarmiento (NYU ITP).
 *  
 * This code was based on Patrick Dwyer's L-System class. 
 */

PenroseLSystem ds;

void setup() 
{
  size(640, 360);
  smooth();
  ds = new PenroseLSystem();
  ds.simulate(4);
}

void draw() 
{
  background(0);
  ds.render();
}








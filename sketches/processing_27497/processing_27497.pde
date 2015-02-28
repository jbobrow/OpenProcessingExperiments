
/**
* blocks :
* (NomBot)
* paints blocks by drawing random rects of sinusoidal size.
*
*/

int ssize=600;
float is=ssize/12; 
int blocks=4;
float ir=ssize/(blocks*PI); 
float cr=20;

void setup()
{
  size(600, 600);
  frameRate(600);
  background(0);
  rectMode(CENTER);
  noStroke();

}
 
void draw()
{
 
 // fill somewhat random
 fill(240+random(-cr,cr),240+random(-cr,cr),240+random(-cr,cr),28);
 // position random
 float vx=random(0,width);
 float vy=random(0,height);
 // size sinusoidal 
 rect(vx, vy, is*(sin(vx/ir)), is*(sin(vy/ir)));
 
}
 

 


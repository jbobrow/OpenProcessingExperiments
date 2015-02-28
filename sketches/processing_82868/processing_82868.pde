
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//declaring minim stuff
Minim minim;
//declare Audio Input
AudioInput input;

float a2;

void setup()
{
  size(500,500);
  minim = new Minim(this); //construct minim object
  input = minim.getLineIn(Minim.MONO,400);  //construct audio, number can change, the larger, the more data
  
  a2 = 0;
  
}



void draw()
{
  //background(0);
  float a = abs(input.left.get(0))*100; //records soundwave/amplitude? changing multiplier changes size
  
  if(a > a2)
  {
   a2 = a;
  }
  a2*=.98;
  
  println(a);
  background(a2,0,0);
  
  
}

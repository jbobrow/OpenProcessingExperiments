
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput input;


float a, a2, a3;

void setup ()
{
  size (400, 400); 
  minim = new Minim(this);
  input = minim.getLineIn (Minim.MONO, 360); 
  a2 = 0;
  a3 = 0;
}

void draw ()
{
  background (0);  
  a = input.left.get(0)*100;
  //abs = keeps everything postive
  if (abs(a) > a2)
  {
    a2 = abs (a) ;
  }
  //ease a2 back to zero at all times V
  a2*=.98;
  a3*=.5;

  rect (100, 50, 100, 300-a);
  fill (255, 0, 0, 100*a3);
  rect (50, 275, 50, 400*a2);
  noFill ();
  fill (0,0, 255, 150*a3);
  rect (200, 50, 200, 50*a2);
  noFill();
  fill (255, 239, 88, 50*a2);
  rect (150, 30, 75, 150);
  noFill ();
  
  fill (120, 125, 252, 200);
  rect (375, 275, 100, 120*a3);
  noFill ();
  
  rect ( 270, 340, 500, 10*a3);
  
  fill (255, 0, 0, 200*a2);
  rect (75, 340, 1000, 50*a); 
  noFill ();
  
  fill (0, 30, 255, 100*a);
  rect (25, 15, 35, 1000*a2);
  noFill ();


  pushMatrix ();
  translate (width/2, height/2);
  rect (0, 0, 20, -30-a);
  
  rect (0,0, 200, 50-a);
  
  rect (100, 30, 10, 60-a);


  translate (50, 0);
  rect (0, 0, 20, -30-a2);
  popMatrix();

  pushMatrix ();
  translate (0, height/2);
  stroke (255);
  beginShape ();
  noFill();
  for (int i= 0; i < input.left.size (); i++)
  {
    float temp_y = input.left.get(i)*100;
    vertex ( i*2, temp_y  );
  }


  endShape();
  popMatrix ();



}




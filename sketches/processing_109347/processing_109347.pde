
//Adjust these for density/size
int loops = 0;
float maxLoops = 19999;
float tilesize = 150.0;

//static variables
float Tneg = tilesize/2.285;
float Tpos = tilesize/1.777;
float cols= 0.0, rows = 0.0;

//import processing.pdf.*;

void setup() 
{ 
  background (230);
  size (1200, 750);
    cols= width/tilesize;
    rows = height/tilesize;
// beginRecord(PDF, "radiationcross.pdf"); 
}


void draw ()
{         
  for (int i = 0; i <=rows; i++)
  {
    for (int j = 0 ; j <= cols; j++)
    {
      loops++;
      stroke(30);

      pushMatrix();
        translate(j*tilesize, i*tilesize); 
        line(Tneg, Tneg, random(0, Tneg), random (0, Tneg));
        line(Tpos, Tpos, random(Tpos, tilesize), random (Tpos, tilesize));
        line(Tpos, Tneg, random(Tpos, tilesize), random (0, Tneg));
        line(Tneg, Tpos, random(0, Tneg), random (Tpos, tilesize));
      popMatrix();
    }
    if (loops > maxLoops) noLoop();
 //  if (loops > maxLoops) endRecord();
  }
}


     




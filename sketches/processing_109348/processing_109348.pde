
//Adjust these for density/size
int loops = 0;
float maxLoops = 10099;
float tilesize = 150.0;

//static variables
float Tneg = tilesize/2.285;
float Tpos = tilesize/1.777;
float cols= 0.0, rows = 0.0;


color yay1 = color(201, 88, 68);
color yay2 = color(255, 129, 58);
color yay3 = color(255, 253, 191);
color yay4 = color(255, 219, 116);
color colors[] = {yay1, yay2, yay3, yay4};
//matching purple (84,34,84)


import processing.pdf.*;

void setup() 
{ 
  background (64,40,64);
 //background(40);
 //colorMode(HSB);
  size (1400, 800);
    cols= width/tilesize;
    rows = height/tilesize;
    

    
// beginRecord(PDF, "radiationcrossrainbow.pdf"); 
}


void draw ()
{         
  for (int i = 0; i <=rows; i++)
  {
    for (int j = 0 ; j <= cols; j++)
    {
      loops++;
 
      //stroke((random(0,255)/8)*6, 180, 230);
      stroke(colors[(int)random(4)]);
      
      pushMatrix();
        translate(j*tilesize, i*tilesize); 
        line(Tneg, Tneg, random(0, Tneg), random (0, Tneg));
        line(Tpos, Tpos, random(Tpos, tilesize), random (Tpos, tilesize));
        line(Tpos, Tneg, random(Tpos, tilesize), random (0, Tneg));
        line(Tneg, Tpos, random(0, Tneg), random (Tpos, tilesize));
      popMatrix();
    }
    if (loops > maxLoops) noLoop();
   if (loops > maxLoops) endRecord();
  }
}


     




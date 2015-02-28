
/*
Massive Scale!
by: Angeline Mingfield
*/
int xsize; 
int value = 0;
int r;
int g;
int b;

void setup()
{
 background (r, g, b);
 size (810,812);
 xsize = 60;
 noStroke(); 
 smooth();
}


void draw()
{
  fill(value);
  
     if (mousePressed)
   {
     fill(0);
   }
   else 
   {
     fill(100,60,90);
   }
  
 /*  if (value < 150)
   {
     background = 255; 
   }
  */
 for(int y=0; y<height; y+=xsize)
 { for(int x=0; x<width; x+=xsize)
  {fill(random(50,170),random(20,80),random(183), 37);
   ellipse(x, y, xsize ,xsize);
  }
  
 }
   int specialX = mouseX - (mouseX % xsize);
   int specialY = mouseY - (mouseY % xsize);
   fill(255, 3, 201);
   ellipse(specialX, specialY, xsize, xsize);
  

}


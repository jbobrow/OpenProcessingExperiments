
// homeWork (6); 
// copyright Carl Bajandas 2011 Pittsburgh, PA
float xPos,yPos, dia, inc  ;

void setup ()
{
size (800,800);
smooth();
noFill();
noCursor();
dia =50;
inc = 5;
}
void draw ()
{
  background (120);
  yPos = 0;
  xPos = 0;
   while ( xPos < 850)
   {
   CFB (xPos, 200, dia * 2, dia * 2);
    xPos=xPos+ 20;
   }
  
   while (yPos < 800)
   {
   CFB (200, yPos, dia , dia );
   yPos=yPos+ 40;
   }
 
 CFB ( mouseX, mouseY, 100, 100);  

  
  if (dia > 100) {
     inc = - inc;
  } 
  if (dia < -100){
    inc = -inc;
  }
  
  dia = dia + inc;
}


  
 
void CFB (float x, float y, float wd, float ht)
{

                   //// THIS IS THE B \\\\
beginShape ();
stroke( 125, 125, 200); // blue 
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .07 * wd, y - .23 *ht);
  curveVertex ( x + .09 * wd, y);
  curveVertex ( x + .07 * wd, y + .23 *ht);
  curveVertex ( x + .04 * wd, y + .39 *ht);
  curveVertex ( x + .14 * wd, y + .39 *ht);
  curveVertex ( x + .33 * wd, y + .31 *ht);
  curveVertex ( x + .40 * wd, y + .20 *ht);
  curveVertex ( x + .42 * wd, y + .08 *ht);
  curveVertex ( x + .32 * wd, y);
  curveVertex ( x + .42 * wd, y - .08 *ht);
  curveVertex ( x + .40 * wd, y - .20 *ht);
  curveVertex ( x + .33 * wd, y - .31 *ht);
  curveVertex ( x + .14 * wd, y - .39 *ht);
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .33 * wd, y - .31 *ht);

endShape();


                   //// THIS IS THE C \\\\

              // this is the C's inner arc
  
beginShape ();
stroke( 125, 200, 125 ); // green 
  curveVertex   ( x + .25 * wd, y - .40 * ht );
  curveVertex   ( x + .25 * wd, y - .40 * ht );
  curveVertex   ( x + .10 * wd, y - .43 * ht );
  curveVertex   ( x - .10 * wd, y - .40 * ht );
  curveVertex   ( x - .28 * wd, y - .25 * ht );
  curveVertex   ( x - .35 * wd, y - .08 * ht );
  curveVertex ( x - .35 * wd, y + .08 * ht );
  curveVertex ( x - .28 * wd, y + .25 * ht );
  curveVertex ( x - .10 * wd, y + .40 * ht );
  curveVertex ( x + .10 * wd, y + .43 * ht );
  curveVertex ( x + .25 * wd, y + .40 * ht );

              // this is the C's outer arc 

  curveVertex   ( x + .25 * wd, y + .40 * ht );
  curveVertex   ( x + .10 * wd, y + .45 * ht );
  curveVertex   ( x - .10 * wd, y + .45 * ht );
  curveVertex   ( x - .30 * wd, y + .35 * ht );
  curveVertex   ( x - .45 * wd, y + .13 * ht );
  curveVertex ( x - .45 * wd, y - .13 * ht );
  curveVertex ( x - .30 * wd, y - .35 * ht );
  curveVertex ( x - .10 * wd, y - .45 * ht );
  curveVertex ( x + .10 * wd, y - .45 * ht );
  curveVertex ( x + .25 * wd, y - .40 * ht );
  curveVertex ( x + .25 * wd, y - .40 * ht );        
endShape();

              //// THIS IS THE effin F \\\\
              
beginShape ();
stroke (200,125,125);
  curveVertex ( x + .01 * wd, y - .30 * ht); 
  curveVertex ( x + .01 * wd, y - .30 * ht); 
  curveVertex ( x - .06 * wd, y - .36 * ht); 
  curveVertex ( x - .10 * wd, y);
  curveVertex ( x - .02 * wd, y + .37 * ht);
  curveVertex ( x - .02 * wd, y + .37 * ht);

endShape(); 

             //// this is the f's cross \\\\
             
beginShape();             
  vertex ( x - .16 * wd, y - .01 * ht); 
  vertex ( x - .01 * wd, y - .03 * ht); 
endShape();
}

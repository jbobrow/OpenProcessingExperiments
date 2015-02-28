
// homeWork (4); 
// Copyright Carl Bajandas 2011 Pittsburgh, PA

float 
x, 
y, 
wd, 
ht, 
wdb, 
wdc, 
htb, 
htc ;
color col; 
 
int cc = 0;

void setup () 
{
  size (800,800);                
    // variable declaration 
  background (255);
  x=    400;
  y =   400;
  wd =  300;
  ht =  300;
  htc = 300;
  wdc = 300;
  htb = 300;
  wdb = 300;
  col= color(random(255), random(255), random(255));
  smooth       ( );  
  strokeWeight (5); 
}

void draw () 
{              
background(255);  // <----------this stops the shape repetition  
  fill (col);
  beginShape ();     //// THIS IS THE B \\\\
  stroke(250, 200, 100);  
  curveVertex ( x + .04 * wdb, y - .39 *htb);
  curveVertex ( x + .04 * wdb, y - .39 *htb);
  curveVertex ( x + .07 * wdb, y - .23 *htb);
  curveVertex ( x + .09 * wdb, y);
  curveVertex ( x + .07 * wdb, y + .23 *htb);
  curveVertex ( x + .04 * wdb, y + .39 *htb);
  curveVertex ( x + .14 * wdb, y + .39 *htb);
  curveVertex ( x + .33 * wdb, y + .31 *htb);
  curveVertex ( x + .40 * wdb, y + .20 *htb);
  curveVertex ( x + .42 * wdb, y + .08 *htb);
  curveVertex ( x + .32 * wdb, y);
  curveVertex ( x + .42 * wdb, y - .08 *htb);
  curveVertex ( x + .40 * wdb, y - .20 *htb);
  curveVertex ( x + .33 * wdb, y - .31 *htb);
  curveVertex ( x + .14 * wdb, y - .39 *htb);
  curveVertex ( x + .04 * wdb, y - .39 *htb);
  curveVertex ( x + .33 * wdb, y - .31 *htb);

  endShape();


                   //// THIS IS THE C \\\\
              // this is the C's inner arc
  fill (col);
  beginShape ();
  stroke( 250, 9 , 100 );  
  curveVertex   ( x + .25 * wdc, y - .40 * htc );
  curveVertex   ( x + .25 * wdc, y - .40 * htc );
  curveVertex   ( x + .10 * wdc, y - .43 * htc );
  curveVertex   ( x - .10 * wdc, y - .40 * htc );
  curveVertex   ( x - .28 * wdc, y - .25 * htc );
  curveVertex   ( x - .35 * wdc, y - .08 * htc );
  curveVertex   ( x - .35 * wdc, y + .08 * htc );
  curveVertex   ( x - .28 * wdc, y + .25 * htc );
  curveVertex   ( x - .10 * wdc, y + .40 * htc );
  curveVertex   ( x + .10 * wdc, y + .43 * htc );
  curveVertex   ( x + .25 * wdc, y + .40 * htc );

              // this is the C's outer arc 
  fill (col);
  curveVertex   ( x + .25 * wdc, y + .40 * htc );
  curveVertex   ( x + .10 * wdc, y + .45 * htc );
  curveVertex   ( x - .10 * wdc, y + .45 * htc );
  curveVertex   ( x - .30 * wdc, y + .35 * htc );
  curveVertex   ( x - .45 * wdc, y + .13 * htc );
  curveVertex   ( x - .45 * wdc, y - .13 * htc );
  curveVertex   ( x - .30 * wdc, y - .35 * htc );
  curveVertex   ( x - .10 * wdc, y - .45 * htc );
  curveVertex   ( x + .10 * wdc, y - .45 * htc );
  curveVertex   ( x + .25 * wdc, y - .40 * htc );
  curveVertex   ( x + .25 * wdc, y - .40 * htc );        
  endShape();

              //// THIS IS THE effin F \\\\
  noFill ();
  beginShape ();
  stroke (200);
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

void keyPressed() 
{ 
   if (keyCode == UP)
   { 
   ht = ht + 5;
   wd = wd + 5; 
   y  =  y - 5;
   }
   if (keyCode == DOWN)
   {
   ht = ht - 5;
   wd = wd - 5;   
   y  = y + 5;
   }
   if (keyCode == LEFT)
   {
   htc = htc + 5;
   wdc = wdc + 5; 
   htb = htb - 5;
   wdb = wdb - 5; 
   x = x - 5; 
   }
   if (keyCode == RIGHT)
   {
   htb = htb + 5;
   wdb = wdb + 5; 
   htc = htc - 5;
   wdc = wdc - 5;  
   x = x + 5;
   }

} 

void mousePressed ()
{
   if (mousePressed == true) {
    
    fill(col);
    stroke (col);
    strokeWeight (random (70));
  } else {
    fill(255);
  }
  col= color(random(255), random(255), random(255), 255);
}  




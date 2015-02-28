
//Assignment 9
//Annie Ranttila, Carnegie Mellon University
//Fall 2013

float [] array1 = new float [30];
float rectx, rectz, recty;
int y;

void setup()
{
size (1000, 800, P3D);
initArrays (array1);
rectx = 50;
recty = 50;
rectz = 50;
noStroke();
sphereDetail (5);
noCursor();
y=0;
}

void draw ()
{
  frameRate(20);
  background( 0 );
  lights( );
  moveFigs();
  drawLines( array1);
  

}

void drawLines(float [ ] arrayZ)
{
   directionalLight( 255, 255, 255, 0, -1, 0 );
   noFill(); 
   strokeWeight(4);
   for( int i = 1; i < arrayZ.length; i++)
   {  
       if (i=10) 
           stroke(255,0,0);
       else stroke(255,255,255);
       translate( 0, 0, -100 );  
       rectMode(CENTER);
       rect(mouseX, mouseY, width/i, height/i );
    }

}

void moveFigs ()
{ 
   for( int i = 0; i < array1.length; i++)
   {
     array1 [i] += 5;
      if (array1[i] >=1000)
      {
        array1[i] = -10000;
      }
      
   }}
   
void initArrays (float [] arrayz)
{
  for (int i=0; i<arrayz.length; i++)
  {
  arrayz [i] = 0;
  }
}





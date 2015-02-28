
//Madeline Chan mchan1 Copyright 2013
//HW 9 Floating Maze..give it a gew seconds if the screen goes blank, its coming!

float a =-10;
int[] lines = new int[20];
int[] Tri = new int[20];
int x,y,dx,dy;

void setup( )
{
  size( 600, 600, P3D );
  camera(width/6, -height, height / tan(PI*30.0 / 180.0), width/2.0, height/2.0, -2000, 0, 1, 0);
  
  x = width+(width/4);
  y = 0;
  dx = 0;
  dy =0;
  
}
 
void draw( )
{
  background(255);
  directionalLight( 255, 255, 255, 300, -30, 0 );
  //ambientLight(300, 300, 0);
  //pointLight(51, 102, 126, 35, 400, 36);
  move();  
 }

void move( )
{
   for( int i = 0; i < lines.length; i++)
   {
     arrayTriangle(lines[i], Tri, i);
      lines [i] += 6 ;
      if (lines [i] > 600)
      {
        lines[i] = -4000;
         Tri [i] = (int(random(20)) - 10) * 600;
    
      }
      
   }
}
 
void arrayTriangle( int z, int [] arrayX, int i)
{
  {
  pushMatrix();
  //rotateX(radians(20));
  a= a+.0005;
  rotateX(a);
  translate( arrayX[i]*.5,arrayX[i],z);
  drawTri(100);
  drawTri(200);
  drawTri(300);
  drawTri(400);
  drawTri(500);
  drawTri(600);
  drawTri(700);
  drawTri(800);
  
  translate(arrayX[i]*.5,z,z);
  drawTri(-100);
  drawTri(-200);
  drawTri(-300);
  drawTri(-400);
  drawTri(-500);
  
  popMatrix();
  }   
}
 
void drawTri(int t)
{
  stroke(245,245,245);
  fill (60,245,245);
  beginShape();
  
  vertex(-t,0,-t);
  vertex( -t,0,t);
  vertex( 0, -t, 0);

  strokeWeight(2);
  vertex(t, 0,-t);
  vertex(-t,0,-t);
  vertex( 0, -t, 0);
    
  endShape();
}




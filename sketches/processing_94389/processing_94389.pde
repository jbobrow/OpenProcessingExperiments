
//Ana Paula Moreto

int x=85;
int y=75;
int dtelhax=12;
int dtelhay=8;
int ptx=8;
int pty=8;
void setup()
{
  size (200, 200);
}
 
void draw() {
  background(16, 22,70);
  
noStroke();
fill(255);
ellipse(140, 60, 30, 30);
stroke(0);
fill (117,227,71);
noStroke();
rect(0, 180, 200, 20);
fill(255);
rect(40, 120, 90, 60);
 

  fill(71,219,168);
  rect(70, 140, 30, 40);
  stroke(0);
  strokeWeight(1);
  line(85,140,85,180);
  
  noStroke();
  fill(219,120,20);
  rect(70,180,30,20);
   triangle(40, 120, 85, 75, 130, 120);
 
 fill(71,151,219,90);
 ellipse(50,50,70,30);
 ellipse(70,60,50,20);
  int x=85;
  int y=75;
  int dtelhax=12;
  int dtelhay=8;
  int ptx=8;
  int pty=8;
   
  for (int i=0; i<6; i++)
  {
 
 
    strokeWeight(3);
    stroke(219,120,20);
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }
 
  x=85;
  y=75;
  dtelhax=-12;
  dtelhay=8;
  ptx=-8;
  pty=8;
 
  for (int i=0; i<6; i++)
  {
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }
}

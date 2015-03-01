
int a = 162;
int b = 181;
int c = 205;
int d = 0;
int e = 0;
int f = 100;
int g = 255;
int h = 255;

void setup()
{
  size (1000,700);
  background(162,181,205);
  smooth();
  noCursor();
}
void draw()
{
  noCursor();
  noStroke(); fill(0); rectMode(CORNER); rect(0,0,1400,1000); 
pushMatrix();

  translate(width/2,height);
  rotate(radians(width+pmouseX/5.7));
  fill(a,b,c,d); stroke(0); strokeWeight(1800); ellipse(0,-500,250,150);
  fill(a,b,c,e); noStroke(); quad(-100,-160, 100,-160, 125,-500, -125,-500); 
flashlight();
}
void mouseMoved()
{
pushMatrix();
translate(0,2*height/3);

  fill(g,h); 
  ellipse(width-mouseX,mouseY-height,20,20);
  ellipse(width-mouseX+50,mouseY-height,10,10);
  
  fill(0,h);
  ellipse(width-mouseX,mouseY-height,12,12);
  ellipse(width-mouseX+50,mouseY-height,5,5); 
popMatrix();
}
void flashlight()
{
    noStroke(); fill(90); rectMode(CORNER); rect(-50,-160,100,200);
    fill(80); arc(0,-160, 200, 200, 0, PI);
    stroke(50,230); strokeWeight(5); fill(a,b,c); ellipse(0,-160,200,10);
    fill(f,23,31); noStroke(); ellipseMode(CENTER); ellipse(0,-30,40,30);
popMatrix();
}
void mousePressed()
{
  if (f==100)
  {
    f=176;
  } else
  {
    f=100;
  }
}
void mouseReleased()
{
  if ((a==162)&&(b==181)&&(c==205)&&(d==0)&&(e==0)&&(h==255)) 
  {
    a=255; b=215; c=0; d=255; e=100; h=0;
  } else {
    a=162; b=181; c=205; d=0; e=0; h=255;
  }
}



size (800, 600);
background (0);
smooth();

float x1;
float x2;
float y1;
float y2;
float x3;
float y3;
float x4;
float y4;

int step;
 
x1 = 5;
x2 = width-5;

y1 = 5;
y2 = height-5;

x3 = random (100,700);
y3 = 303;

x4 = 403;
y4 = random (100,500);

step = 50;

strokeWeight(10);
fill(255,255,255,60);
noStroke();


float stepSize = 9.0/ step;
for ( float tx = 0; tx<= 20;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 20;  ty = ty + stepSize)
      {
          
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
       strokeWeight(1);
     stroke(random (255), random (255), random (255));
      fill(random (255), random (255), random (255));
          ellipse ( x,y, 10,10);
          
      }
}


strokeWeight(12);
stroke(0);
line(403,0,403,600);
strokeWeight(10.5);
stroke(0);
line (0,303,800,303);

noFill();
strokeWeight(15);
stroke(255);
point(x4,y4);

strokeWeight(10);
stroke(255);
point (x3, y3);

            

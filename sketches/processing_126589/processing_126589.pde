

float s1, s2, p1, p2, x1, y1, x2, y2;

void setup()                                    {
size(800,600);                                  }

void draw()                                     {

background(0);
  
x1= 400;                  y1= 300;                  p2=0;
s1= random(50)/100;       s2= random(50)/100;

for (int i= 0;            i < 1000;                 i += 1)         
                                                {
p1 += s1*sin(s2*i);       p2 += p1;
x2= x1;                   y2 = y1;
x1 += i*cos(p2)/100;      y1 += i*sin(p2)/100;
 

stroke(200+50*sin(x1/10),  200+50*sin(y1/10), 0);                 
strokeWeight(2);
line (x1,y1,x2,y2);                             }
                                                }


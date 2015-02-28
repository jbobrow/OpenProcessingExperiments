

int c;
float x, y;

void setup()                                      {
background(0);
size(800,600);                                    }

void draw()                                       {
for (int i= 0;        i < 1000;       i += 1)     {

c=int(random(3));   
x = x/2 + c*(2-c);                y = y/2- c;

stroke(255);                 
point (800+200*y,600-300*x);                  }   }

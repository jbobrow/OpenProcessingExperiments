
int h1;
int w1;
int x1;
int y1;

int h;
int w;
int x;
int y;

void setup (){
  size (800, 800);
  background (255);
h1 = 350;
w1 = 100;
x1 = 300;
y1 = 250;

h = 300;
w = 100;
x = 200;
y = 320;
}
void draw (){
  stroke (0);
  
  line (x1+w1,y1,x1+w1,y1 +h1);   
  line (x1,y1+h1,x1+w1,y1+h1);
  line (x1, y1+h1,x1,y1);
  line (x1,y1, x1+w1, y1);

  line (x, y, x + h, y);
  line (x, y, x, y + w);
  line (x, y + w, x + h, y + w);
  line (x + h, y + w, x + h, y);
  
  

 
}


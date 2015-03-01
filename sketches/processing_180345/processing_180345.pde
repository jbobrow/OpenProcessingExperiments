
size (800, 800);
background(255, 255, 255);
int x = 1;
int y = 1;
int a = x;
int b = height;

for (int i = 1; i < width; i = i+2){
  x = x + i;
  line(x, y, a, b);
}



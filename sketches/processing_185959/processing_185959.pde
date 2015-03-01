
size(480,120); //canvas size
int x = 25;
int h = 20;
int y = 25;
rect(x, y, 300 , h); //top rectangle
x = x + 100;
rect(x, y + h, 300, h); //middle rectangle
x = x - 250;
rect(x, y + h*2, 300, h);


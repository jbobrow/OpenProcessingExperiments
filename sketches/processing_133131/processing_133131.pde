
/* @pjs preload= "swallow.jpg"; */

size(240, 380);

int a = 0;
int b = 20;
int c = 140;
int d = 80;
int e = 60;
int f = 140;

triangle(a, b, c, d, e, f);
quad(60, 140, 140, 80, 220, 260, 120, 300);
triangle(a+120, b*15, c, d*4, e+80, f+152);
triangle(a+140, b+272, c+40, d+196, e*3, f+180);
triangle(a+180, b+256, c+80, d+180, e+160, f+160);
triangle(a+239, b+359, c+70, d+280, e+170, f+215);
triangle(a+200, b*16, c+80, d+250, e+160, f+170);
triangle(a+160, b+325, c+40, d+260, e*3, f+230);
PImage img;
img = loadImage("swallow.jpg");
image(img, 100, 150, 70, 90);





size(100, 100);

smooth();
stroke(0);
background(255);

/*
 float space = 10;
 float x = width/10;
 int y = height/4;
 
 while (x < width) {
 line(x,height - 80,x,height -20);
 x = x + space;
 }*/



/*
float space = 10;
 float x = width/10;
 int y = height/4;
 
 while (x < width) {
 line(x-5,height - 80,x,height -20);
 x = x + space;
 }
 */

/*
float space = 10;
 float y = width/10;
 int x = height/4;
 
 while (y < width) {
 line(width -80,y,width-20,y);
 y = y + space;
 }
 */

/*
float space = 10;
 float y = width/10;
 int x = height/4;
 
 while (y < width) {
 line(width -80,y-5,width-20,y+5);
 y = y + space;
 }
 */

/*
  float space= 5;
 float y = width/10;
 int x = height/4;
 
 while (y < width) {
 stroke(90);
 line(width -80,y,width-20,y);
 y = y + space;
 }*/

/* float space = 1.2;
 int y = height/4;
 
 for (float x = width/10; x < width; x = x * space) {
 line(x,height - 80,x,height -20);
 }*/

/*
 float space = 1.2;
 int x = height/4;
 
 for (float y = width/10; y < width; y = y * space) {
 line(height - 80,y,height -20,y);
 } */

/*float space = width/10;
int y = height/4;
for (int x = 10; x < 90;x=x+10) {
  if (x < 50)
    line(x, 20, x, 50);
  else
    line(x, 30, x, 60);
}*/

float space = width/10;
int x = height/4;


for (int y = 10; y < 90; y += 10) {
    line(20, y, 50, y);
  }
 for (int y = 10; y < 90; y += 10) {
    line(50, y+5, 80, y+5);
}



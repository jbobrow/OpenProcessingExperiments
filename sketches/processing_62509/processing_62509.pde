
size (200,200);
background (255);
smooth();

float space = 10;


/*
for (float x = 30; x <= width - 30; x = x + space){
   line(x,30,x,170);
   space = space * 1.2;
}*/

/*

for (float y = 30; y <= width - 30; y = y + space) {
  line(30, y, 170, y);
  space = space * 1.2;
}*/


/*
float x = 30;

for (float xx = width/2;x < width/2;x = x + space) {
  line(x,30,x,width/2);
  line(xx,height/2,xx,170);
  xx = xx + space; 
}*/


space = 20;

for (float y = 30;y <= width - 30;y = y + space) {
  line(30, y, width/2, y);
}
 
for (float yy = 40; yy <= height - 40; yy = yy + space) {
  line(width/2,yy,width-30,yy);
}
















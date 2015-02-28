
size(400, 400);

background(255);

/*float x = 20;
float space = 10;

while(x <= width - 20){
 line(x, 20, x, 380);
 x = x + space;
}*/


/*float y = 20;
float space = 10;

while(y <= height - 20){
  line(20, y, 380, y);
  y = y + space;
}*/


/*float x = 60;
float y = 20;
float xx = 20;
float yy = 380;
float space = 10;

while(x <= width - 20){
  line(x,y,xx,yy);
  x = x + space;
  xx = xx + space;
}*/


/*float x = 20;
float y = 60;
float xx = 380;
float yy = 20;
float space = 10;

while(y <= height - 20){
  line(x,y,xx,yy);
  y = y + space;
  yy = yy + space;
}*/


/*float space = 10;

for(float x = 20; x <= width - 20; x = x + space){
 line(x, 20, x, 380);
 space = space * 2;
}*/


/*float space = 10;

for(float y = 20; y <= height -20; y = y +space){
  line(20,y,380,y);
  space = space * 2;
}*/

/*for(float x = 20; x < width/2; x = x + 10){
line(x, 20, x, height/2);
}

for(float x2 = width/2; x2 <= width -20; x2 = x2 + 10){
line(x2, height/4, x2, height -20);
}*/

for(float y = 20; y <= height-20; y=y+40){
line(20,y,width/2,y);
}
for(float y2 = 40; y2 <= height-40; y2=y2+40){
line(width/2,y2,380,y2);
}


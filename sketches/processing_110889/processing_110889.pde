
void setup(){
size(600,600);
}
void draw(){
for (int x = 0; x < 600; x=x+10) {
for (int y = 0; y < 600; y=y+10) {
frameRate(10);
fill(random(255),random(255),random(255));
rect(x, y, 10,10);}

if(mouseX<200 && mouseY<200){
for (int ax = 0; ax < 200; ax=ax+10) {
for (int ay = 0; ay < 200; ay=ay+10) {
frameRate(5);
fill(random(100,200));
rect(ax, ay, 10,10);}
}
}
else if(mouseX>200 && mouseX<400 && mouseY<200){
for(int bx = 200; bx<400; bx=bx+10){
for(int by = 0; by<200; by=by+10){
frameRate(5);
fill(random(100,200));
rect(bx, by, 10,10);}
}
}
else if(mouseX>400 && mouseX<600 && mouseY<200){
for(int cx = 400; cx<600; cx=cx+10){
for(int cy = 0; cy<200; cy=cy+10){
frameRate(5);
fill(random(100,200));
rect(cx, cy, 10,10);}
}
}
else if(mouseX<200 && mouseY>200 && mouseY<400){
for(int dx = 0; dx<200; dx=dx+10){
for(int dy = 200; dy<400; dy=dy+10){
frameRate(5);
fill(random(100,200));
rect(dx, dy, 10,10);}
}
}
else if(mouseX<200 && mouseY>400 && mouseY<600){
for(int ex = 0; ex<200; ex=ex+10){
for(int ey = 400; ey<600; ey=ey+10){
frameRate(5);
fill(random(100,200));
rect(ex, ey, 10,10);}
}
}
else if(mouseX>200 && mouseX<400 && mouseY>200 && mouseY<400){
for(int fx = 200;fx<400;fx=fx+10){
for(int fy = 200;fy<400;fy=fy+10){
frameRate(5);
fill(random(100,200));
rect(fx, fy, 10,10);}
}
}
else if(mouseX>400 && mouseX<600 && mouseY>200 && mouseY<400){
for(int gx = 400;gx<600;gx=gx+10){
for(int gy = 200;gy<400;gy=gy+10){
frameRate(5);
fill(random(100,200));
rect(gx, gy, 10,10);}
}
}
else if(mouseX>200 && mouseX<400 && mouseY>400 && mouseY<600){
for(int hx = 200;hx<400;hx=hx+10){
for(int hy = 400;hy<600;hy=hy+10){
frameRate(5);
fill(random(100,200));
rect(hx, hy, 10,10);}
}
}
else if(mouseX>400 && mouseX<600 && mouseY>400 && mouseY<600){
for(int ix = 400;ix<600;ix=ix+10){
for(int iy = 400;iy<600;iy=iy+10){
frameRate(5);
fill(random(100,200));
rect(ix, iy, 10,10);}
}
}
}
}



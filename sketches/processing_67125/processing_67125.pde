
//繰り返し(auto5)
size(200,200);
int x;
int y;
int a;
int z;
int i;
background(255,0,0);

for(i=1; i<=300; i++) {
  x=int(random(200));
  y=int(random(200));
  a=int(random(200));
  z=int(random(200));
 
  line(x,y,a,z);
  
}
size(200,200);
rect(20,20,20,160);
rect(160,20,20,160);
triangle(40,20,110,180,90,180);
triangle(40,20,40,60,90,180);
triangle(160,20,90,180,110,180);
triangle(160,20,160,60,110,180);
fill(0,217,252);
text("byRYOmiyamiyazi",90,190);
save("sougou2-M.jpg");




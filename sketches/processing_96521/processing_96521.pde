
background (189, 242, 66);
size (200, 200);
strokeWeight (2);
smooth();
int y=50;
for (int x = 10; x<30; x=x+3){
stroke (216, 39, 45);
if (x<25) {
stroke (15, 40, 137);
}
  line (50,x*x/5,120,y-30);
y=y+10; 
}

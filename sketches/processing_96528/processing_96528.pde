
background (36,222,161);
size (200, 200);
strokeWeight (3);
smooth();
int y=50;
for (int x = 10; x<30; x=x+2){
stroke (217,13,222);
  if (x<25) {
  stroke (0);
  }
  line (50,x*x/5,120,y-30);
y=y+8; 
}

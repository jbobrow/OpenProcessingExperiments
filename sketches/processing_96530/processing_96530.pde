
//Monyse Takaki
background (255);
size (200, 200);
strokeWeight (1);
smooth();
int y=50;
for (int x = 10; x<30; x=x+3){
stroke (93, 250, 141);
if (x<25) {
stroke (0);
}
  line (50,x*x/5,120,y-30);
y=y+10;
}

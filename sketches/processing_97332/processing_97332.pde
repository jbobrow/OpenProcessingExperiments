
size (200, 200);
background (#BCB6B6);
strokeWeight (2);
smooth();
int y=40;
for (int x = 7; x<30; x=x+3){
stroke (255);
  if (x<25) {
  stroke (0);
  strokeWeight (3);
}
  line (50,x*x/5,120,y-30);
y=y+10;
}

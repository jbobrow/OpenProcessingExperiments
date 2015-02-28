
size (200,200);
background (255);
smooth ();
int y=50;

for (int x = 10; x<30; x=x+2){
  stroke (0,255,0);
y=y+5; 
if (x*x/5<120){
stroke (0);
}
 line (50,x*x/5,120,y-30);
}

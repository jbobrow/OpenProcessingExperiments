
// giovanna simokado
size (200,200);
background (255);
int y=20;
int x=120;

for (; x<200; x=x+10){
  line (x,y, 190,20);
  line (10,20,-x*2/3+150,y);
y=y+20;
}

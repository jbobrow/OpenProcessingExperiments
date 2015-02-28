
size (200,200);
background (#60CEF5);
int y=30;
 
for (int x = 100; x<200; x=x+5){
  stroke(#F59920);
  line (x,y, 200,27);
  line (10,20,(-x*2/3)+150,y);
y=y+10;
}

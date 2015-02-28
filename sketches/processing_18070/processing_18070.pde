
size(250,250);
background(0);
smooth();

int a =(5);
int b =(10);
int c =(15);
int d =(20);
int x =(125);


for(int i=10; i<2500; i+=5){
fill (random(255), random(255), random(255));
  ellipse(i+70,i+60,a+20,b+10);
  fill (random(255), random(255), random(255));
  ellipse(i+10,x,d+100,d+76);
   fill (random(255), random(255), random(255));
  ellipse((i+170),(i+160),a+120,b+60);
  fill (random(255), random(255), random(255));
  ellipse(i,x+i,d+40,d+76);
  fill (random(255), random(255), random(255));
  ellipse(i,a,i,x);
}

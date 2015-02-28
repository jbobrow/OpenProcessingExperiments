
size(400,400);
background(255);
smooth();
int x=0;
int y=400;
strokeWeight(15);
for(int i = 20; i<=255; i+=10){
  stroke(50,i);
  line(x+15,0,x,400);
  stroke(50,255-i);
  line(x,0,x+15,400);
  stroke(50,i);
  line(0,x,400,x+15);
  stroke(50,255-i);
  line(0,x+15,400,x);
  x +=20;
}

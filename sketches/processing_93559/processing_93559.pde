
//Brennda
size(200,200);
colorMode(HSB,240);
strokeWeight(20);
for(int x=0; x<200; x=x+9){
  for(int y=0; y<200; y=y+9){
    stroke(x, y, 200);
    point(x,y);}
    }
int i=2;
stroke(#6DB796);
strokeWeight (10);
while(i<200){
  point(i,i*i/200);
  i=i+10;
}

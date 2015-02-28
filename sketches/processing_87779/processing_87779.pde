
size (800, 800);
smooth();
strokeWeight(25);

background(255);
for(int i=0;i<400;i+=50){
  strokeCap(SQUARE);
  line(0,i,800,i);
  }

for(int x=0;x<820;x+=50){

  line(x,390,x,800);


}


size(250,250);
background(255,231,46);
smooth();

strokeWeight(2);

for(int y=25; y<=height; y+=20){
  for(int x=25; x<=width; x+=20){
    line(y,0,0,x);
    strokeWeight(1);
    line(0,y+250,x+250,0);
    line(0,y+100,x+100,0);
    line(y+50,0,0,x+50);
  }
}





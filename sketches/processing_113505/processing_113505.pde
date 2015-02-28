
size(800,800);
background(0);
strokeWeight(0);


for(int x =0; x<=800; x+=10) {
for(int y =0; y<=800; y+=10) {
noStroke();  

  stroke(255-y,x*2,y);
 line(x/20-11,x*3+2/10-150,1000-x*5,y*5);

 stroke(y,255-y,x*2);
  line(800-x/20+11,800-x*3+2/10,x*5,1000-y*5);

}
}





size (1000, 1000);
for (int x=1; x<300; x+=30){
  for (int y=x-30; y>0; y+=10){
    fill (x, y, x-y);
    beginShape (QUADS);
    vertex (x, y);
    vertex (x+1, y+1);
    vertex (x+2, y+2);
    vertex (x+3, y+3);
    vertex (x*1.3, x);
    endShape ();
  }
}
 
    



